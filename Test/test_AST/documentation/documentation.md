
---

# Spécification et Évaluation Formelle WebAssembly en Boogie

Ce document explique le fonctionnement du fichier de vérification Boogie (`test_ast.bpl`). Ce fichier n'est pas un compilateur classique, mais un **évaluateur symbolique pur** écrit à l'aide de *Datatypes*. Son but est de fournir une sémantique de référence formelle pour un sous-ensemble d'instructions WebAssembly (Wasm), afin de prouver mathématiquement via le solveur Z3 que l'exécution d'un Arbre Syntaxique Abstrait (AST) produit le résultat attendu.

---

## 1. Représentation des Données (Les Datatypes)

L'architecture repose entièrement sur les `datatype` natifs de Boogie, ce qui permet de déléguer l'exhaustivité et la disjonction des cas directement à la théorie SMT-LIB, sans écrire de triggers complexes.

### Valeurs et Types

WebAssembly manipule des types numériques précis. Nous avons modélisé ces valeurs de manière stricte :

* **`ValType`** : Énumère les types possibles (`I32Type`, `I64Type`, etc.).
* **`Value`** : Encapsule la valeur concrète (`I32Val(i: int)`).
* **`UndefVal()`** : Un constructeur spécial ajouté à `Value` pour représenter un crash, une exception ou un comportement indéfini (comme une division par zéro ou un débordement mémoire).

### L'État de la Machine (Immuable)

Au lieu de modifier des variables globales, chaque étape d'exécution prend un état et renvoie un **nouvel état**.

* **`Stack`** : Représente la pile d'exécution Wasm sous forme de liste chaînée (`NilStack` ou `ConsStack(top, rest)`).
* **`State`** : Un objet unique regroupant toute la machine à un instant T (la pile `stStack`, la mémoire `stMemory`, la taille mémoire, les variables locales, globales et les tables).

### L'Arbre Syntaxique Abstrait (AST)

Les instructions Wasm ne sont plus des chaînes de caractères opaques (`"i32.add"`), mais des structures fortement typées :

* **Les opérateurs** : Séparés par arité et famille (ex: `BinOp` avec `Add()`, `Sub()`, `DivS()`).
* **`Instr`** : L'AST récursif principal. Par exemple, un nœud d'addition est représenté par `BinaryOpNode(Add(), bLeft, bRight)`.

---

## 2. Le Moteur d'Évaluation Sémantique (`eval_*`)

La logique d'exécution est découpée en deux couches : des fonctions mathématiques pures pour les opérations atomiques, et une procédure avec "inlining" pour le parcours de l'AST.

### Les Fonctions Pures (Sémantique des opérations)

Chaque opération de base (comme `eval_Add` ou `eval_StoreI32`) est une `function` Boogie.

* Elles prennent un `State` en entrée et renvoient un `State` en sortie.
* Boogie ne possédant pas de `match`, elles utilisent des conditions imbriquées basées sur les tests de constructeurs (`is`) et l'accès aux champs (`->`).
* **Sécurité :** Si la pile ne contient pas les bons types (ex: on essaie d'additionner alors que la pile est vide), la fonction renvoie un nouvel état où le sommet de la pile est `UndefVal()`.

### L'Évaluateur Récursif (`eval_Instr`)

C'est le chef d'orchestre qui parcourt l'arbre AST.

* C'est une `procedure` annotée avec **`{:inline 4}`**.
* Boogie interdit l'inlining infini des appels récursifs pour éviter de faire planter le compilateur ("Call cycle detected"). Le chiffre `4` limite la profondeur du copier-coller (macro-expansion) à 4 niveaux.
* L'utilisation d'une procédure avec le mot-clé `call` permet d'enchaîner l'évaluation des branches (ex: évaluer `bLeft`, stocker l'état dans `outSt`, puis évaluer `bRight` à partir de ce nouvel état) de manière séquentielle et déterministe pour le solveur Z3.

---

## 3. La Batterie de Tests Formels

Le fichier se termine par une série de procédures de tests unitaires. Ces tests construisent manuellement des arbres AST et demandent au solveur Z3 de vérifier (`assert`) l'état final de la machine. Le solveur prouve ces assertions mathématiquement pour tous les cas.

Les tests sont catégorisés pour valider chaque aspect de la machine Wasm :

* **Catégorie 1 : Arithmétique de base**
Vérifie les opérations simples et imbriquées comme `(10 + 2) * 3`.
* **Catégorie 2 : Arithmétique avancée**
Vérifie l'ordre d'évaluation (LIFO) avec des opérations non commutatives (la soustraction et la division).
* **Catégorie 3 : Sécurité et Traps**
Prouve qu'une division par zéro (ex: `10 / 0`) n'échoue pas silencieusement, mais produit bien l'état d'erreur attendu (`UndefVal`).
* **Catégorie 4 : Opérations Unaires**
Vérifie les cascades de modification du sommet de pile, par exemple tester si l'inverse d'un nombre est égal à zéro (`Eqz(Neg(x))`).
* **Catégorie 5 : Accès Mémoire (Store / Load)**
Prouve que l'écriture d'une valeur à une adresse mémoire (avec vérification des bornes mémoires simulées) modifie bien la table `stMemory`, et que la lecture à cette même adresse renvoie la bonne valeur sur la pile.
* **Catégorie 6 : Tables de fonctions**
Simule l'écriture et la lecture de références dans le tableau indexé `stTables`, validant le mécanisme de `TableSet` et `TableGet`.