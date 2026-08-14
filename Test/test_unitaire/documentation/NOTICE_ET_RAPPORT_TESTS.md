# Notice d'Utilisation et Rapport de Tests Unitaires — Traduction WASM vers Boogie

Ce document constitue la notice d'utilisation et le rapport technique pour la suite de tests unitaires validant la traduction de WebAssembly (`.wat`) vers le langage intermédiaire Boogie (`.bpl`).

---

## 1. Présentation Générale & Objectif

L'objectif principal du harnais de test automatisé (`run_tests.sh`) est de s'assurer que le traducteur convertit correctement des instructions et constructions WebAssembly en structures Boogie valides et conformes aux spécifications attendues.

Le script compile les fichiers d'entrée `.wat`, génère les représentations Boogie `.bpl`, isole la fonction sous test et compare sa structure logique interne avec un résultat de référence (`.expected`).

Les traductions attendu par les tests sont basées sur le fichier `Formal_rules.pdf`.

---

## 2. Arborescence du Projet

La structure des dossiers du sous-projet `test_unitaire` s'organise de la façon suivante :

```text
test_unitaire/
├── BoogieOutputs/          # Dossier de destination de TOUS les fichiers .bpl générés par VeriSol
├── tests/                  # Catalogue de tests organisés par catégories fonctionnelles
│   ├── arithmetique/       # Tests des instructions d'arithmétique (add, sub, mult, div...)
│   │   ├── binaire/
│   │   └── unitaire/
│   ├── autres/             # Instructions diverses (drop, unreachable, select...)
│   ├── comparaison/        # Instructions de comparaison (eq, ne...)
│   ├── controle/           # Structures de contrôle (loop, if/else, br, block...)
│   ├── fonctions/          # Appels et gestion de la pile locale (call, local.get, local.set...)
│   ├── memoire/            # Gestion mémoire (load, store, memory.grow, memory.size)
│   └── tables/             # Gestion des tables WASM (ex: table_set)
├── BoogieOutputs.zip       # Archive de sauvegarde/référence des outputs Boogie
└── run_tests.sh            # Script Bash principal d'exécution et de vérification des tests
```

### Organisation d'un cas de test
Chaque cas de test est stocké dans son propre répertoire sous `tests/<categorie>/<nom_test>/` et comporte **obligatoirement** deux fichiers :
1. **`<nom_test>.wat`** : Le code WebAssembly au format texte (source d'entrée).
2. **`<nom_test>.expected`** : Le motif ou la séquence d'instructions Boogie attendue dans l'implémentation générée.

---

## 3. Dépendances et Prérequis

Pour pouvoir exécuter la suite de tests via le script `run_tests.sh`, la machine de développement ou le serveur CI doit remplir les prérequis suivants :

* **Système d'exploitation / Shell :** Environnement POSIX/Bash (Linux, macOS, WSL sous Windows, ou Git Bash).
* **CLI .NET (`dotnet`) :** Le SDK ou Runtime .NET doit être installé et accessible globalement dans le `PATH`.
* **Binaire VeriSol :** La bibliothèque compilée `VeriSol.dll` doit être disponible au chemin relatif exact :
  `../../bin/Debug/VeriSol.dll`
* **Utilitaires système standards :**
  * `awk` : Pour l'extraction textuelle des fonctions Boogie.
  * `tr` : Pour la suppression des espaces et la normalisation des chaînes.
  * `cat`, `dirname`, `basename` : Utilitaires de manipulation de fichiers et de chemins POSIX.

---

## 4. Fonctionnement Détaillé du Script `run_tests.sh`

Le script automatisé suit un flux d'exécution séquentiel rigoureux pour chaque test défini dans le tableau `TESTS` :

```text
  [ Fichier .wat ] ──> ( WasmtoBoogie ) ──> [ BoogieOutputs/<test>.bpl ]
                                                              │
                                                        ( awk extraction )
                                                              │
                                                              ▼
[ Fichier .expected ] ──( tr -d space )──> [ COMPARE ] <──( tr -d space )── [ Body extrait ]
                                              │
                                       ┌──────┴──────┐
                                       ▼             ▼
                                   [ SUCCÈS ]    [ ÉCHEC ]
```

### Étapes d'exécution pas à pas :

1. **Initialisation des variables et chemins :**
   - `VERISOL_DLL` pointe vers `../../bin/Debug/VeriSol.dll`.
   - `OUTPUT_DIR` pointe vers `BoogieOutputs`. **C'est dans ce dossier unique que VeriSol dépose l'ensemble des fichiers `.bpl` générés lors des tests.**

2. **Parsing des sous-dossiers :**
   - Pour chaque entrée `$T` du tableau `TESTS` (ex: `"tables/table_set"`), le script extrait :
     - La catégorie : `CATEGORY=$(dirname "$T")` (ex: `tables`)
     - Le nom du test : `TEST_NAME=$(basename "$T")` (ex: `table_set`)
   - Les chemins de fichiers associés sont construits dynamiquement :
     - Entrée WAT : `tests/$T/$TEST_NAME.wat`
     - Fichier attendu : `tests/$T/$TEST_NAME.expected`
     - Sortie Boogie : `BoogieOutputs/$TEST_NAME.bpl`

3. **Contrôle d'existence des sources :**
   - Le script s'assure que le fichier `.wat` et le fichier `.expected` existent. Si l'un des deux manque, le test échoue immédiatement.

4. **Traduction WebAssembly → Boogie :**
   - Le script exécute la commande :
     ```bash
     dotnet "../../bin/Debug/VeriSol.dll" --wasm "tests/$T/$TEST_NAME.wat" --no-boogie > /dev/null 2>&1
     ```
   - VeriSol génère le fichier correspondant `$TEST_NAME.bpl` à l'intérieur du dossier `BoogieOutputs/`.

5. **Extraction ciblée de la fonction générée :**
   - À l'aide de `awk`, le script extrait uniquement le corps de la fonction correspondant au test dans le fichier `.bpl` :
     ```bash
     BODY=$(awk "/implementation[[:space:]]+${TEST_NAME}[[:space:]]*\(/, /^}/" "$BPL_FILE")
     ```
   - Si l'extraction renvoie un résultat vide (la fonction n'a pas été trouvée dans le fichier `.bpl`), le test passe en échec.

6. **Normalisation et comparaison insensible au formatage :**
   - Afin d'éviter les faux négatifs dus aux espaces, tabulations ou sauts de ligne, le corps extrait (`BODY`) et la référence (`EXPECTED`) sont normalisés :
     ```bash
     CLEANED_BODY=$(echo "$BODY" | tr -d '[:space:]')
     CLEANED_EXPECTED=$(cat "$EXPECTED_FILE" | tr -d '[:space:]')
     ```
   - Le script vérifie la présence de la chaîne attendue normalisée dans le corps généré : `[[ "$CLEANED_BODY" == *"$CLEANED_EXPECTED"* ]]`.

7. **Comptage et bilan final :**
   - Le script incrémente les compteurs `PASSED` et `FAILED` puis affiche le résultat coloré dans la console.
   - Si au moins un test échoue (`FAILED > 0`), le script retourne le code de sortie `exit 1` (très utile pour bloquer une pipeline CI/CD).

---

## 5. Guide d'Utilisation

### Lancement de la suite de tests

1. Rendre le script exécutable (si nécessaire) :
   ```bash
   chmod +x run_tests.sh
   ```

2. Exécuter le script :
   ```bash
   ./run_tests.sh
   ```

### Ajouter un nouveau test unitaires

1. Choisir ou créer la catégorie appropriée sous `tests/` (ex: `tests/arithmetique/unitaire/`).
2. Créer le sous-dossier du test (ex: `tests/arithmetique/unitaire/my_add/`).
3. Placer le fichier WebAssembly source `my_add.wat`.
4. Placer le fichier avec la logique Boogie attendue `my_add.expected`.
5. Ajouter le chemin relatif dans le tableau `TESTS` dans `run_tests.sh` :
   ```bash
   TESTS=(
       "tables/table_set"
       "arithmetique/unitaire/my_add"
   )
   ```
   
### Modifier le résultat attendu dans un test

1. Trouver la catégorie que l'on recherche à modifier sous `tests/` (ex. : `tests/arithmetique/unitaire/`).
2. Modifier le fichier `<nom_test>.expected` pour qu'il représente la suite de code Boogie attendue.
