#!/bin/bash

# Couleurs pour l'affichage terminal
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # Pas de couleur

VERISOL_DLL="../../bin/Debug/VeriSol.dll"
OUTPUT_DIR="BoogieOutputs"

# --------------------------------------------------
# CATALOGUE DES TESTS DISPONIBLES
# --------------------------------------------------


# --------------------------------------------------
# CATALOGUE DES TESTS DISPONIBLES
# --------------------------------------------------

ALL_TESTS=(
    # --- ARITHMETIQUE ---
    "arithmetique/unitaire/eqz"
    "arithmetique/unitaire/clz"
    "arithmetique/unitaire/ctz"
    "arithmetique/unitaire/popcnt"
    "arithmetique/unitaire/abs"
    "arithmetique/unitaire/neg"
    "arithmetique/unitaire/sqrt"
    "arithmetique/unitaire/floor"
    "arithmetique/unitaire/ceil"
    "arithmetique/unitaire/trunc"
    "arithmetique/unitaire/nearest"
    "arithmetique/unitaire/wrap_i64"
    "arithmetique/unitaire/extend_i32_s"
    "arithmetique/unitaire/extend_i32_u"
    "arithmetique/unitaire/trunc_ft_s"
    "arithmetique/unitaire/trunc_ft_u"
    "arithmetique/unitaire/convert_it_s"
    "arithmetique/unitaire/convert_it_u"
    "arithmetique/unitaire/demote_f64"
    "arithmetique/unitaire/promote_f32"

    # --- ARITHMETIQUE BINAIRE ---
    "arithmetique/binaire/add"
    "arithmetique/binaire/sub"
    "arithmetique/binaire/mult"
    "arithmetique/binaire/div_s"
    "arithmetique/binaire/div_u"
    "arithmetique/binaire/div_ft"
    "arithmetique/binaire/rem_s"
    "arithmetique/binaire/rem_u"
    "arithmetique/binaire/and"
    "arithmetique/binaire/or"
    "arithmetique/binaire/xor"
    "arithmetique/binaire/shl"
    "arithmetique/binaire/shr_s"
    "arithmetique/binaire/shr_u"
    "arithmetique/binaire/rotl"
    "arithmetique/binaire/rotr"
    "arithmetique/binaire/min"
    "arithmetique/binaire/max"
    "arithmetique/binaire/copysign"

    # --- COMPARAISON ---
    "comparaison/eq"
    "comparaison/ne"
    "comparaison/lt_s"
    "comparaison/le_s"
    "comparaison/gt_s"
    "comparaison/ge_s"
    "comparaison/lt_u"
    "comparaison/le_u"
    "comparaison/gt_u"
    "comparaison/ge_u"
    "comparaison/lt_ft"
    "comparaison/le_ft"
    "comparaison/gt_ft"
    "comparaison/ge_ft"

    # --- CONTROLE ---
    "controle/loop"
    "controle/block"
    "controle/if_no_else_false"
    "controle/if_no_else_fonc"
    "controle/if_void_else"
    "controle/nested_if"
    "controle/br"
    "controle/br_if"
    "controle/br_table"
    "controle/return"
    "controle/return_call"
    "controle/return_call_indirect"

    # --- FONCTIONS ---
    "fonctions/call"
    "fonctions/local_get"
    "fonctions/local_set"
    "fonctions/local_tee"
    "fonctions/call_indirect"
    "fonctions/global_get"
    "fonctions/global_set"

    # --- MEMOIRE ---
    "memoire/load"
    "memoire/store"
    "memoire/memory_grow"
    "memoire/memory_size"
    "memoire/memory_copy"
    "memoire/memory_fill"
    "memoire/load8_s"
    "memoire/load8_u"
    "memoire/load16_s"
    "memoire/load16_u"
    "memoire/load32_s"
    "memoire/load32_u"
    "memoire/load_ft"
    "memoire/store8"
    "memoire/store16"
    "memoire/store32"
    "memoire/store_ft"

    # --- AUTRES ---
    "autres/drop"
    "autres/unreachable"
    "autres/select"
    "autres/i32_const"
    "autres/i64_const"
    "autres/f32_const"
    "autres/f64_const"

    # --- TABLES ---
    "tables/table_get"
    "tables/table_set"
    "tables/table_size"
    "tables/table_grow"
    "tables/table_copy"
    "tables/table_fill"
)


# --------------------------------------------------
# LISTE DES TESTS À EXÉCUTER
# --------------------------------------------------

# Vide = tous les tests
TESTS=(
    "arithmetique"
    # "arithmetique/binaire"
    # "arithmetique/binaire/add"
)


# --------------------------------------------------
# SELECTION DES TESTS
# --------------------------------------------------

SELECTED_TESTS=()

if [ ${#TESTS[@]} -eq 0 ]; then

    # Aucun filtre => tous les tests
    SELECTED_TESTS=("${ALL_TESTS[@]}")

else

    # Pour chaque filtre demandé
    for FILTER in "${TESTS[@]}"; do

        FOUND=0

        for T in "${ALL_TESTS[@]}"; do

            # Correspondance exacte
            if [ "$T" = "$FILTER" ]; then
                SELECTED_TESTS+=("$T")
                FOUND=1

            # Correspondance par préfixe
            elif [[ "$T" == "$FILTER/"* ]]; then
                SELECTED_TESTS+=("$T")
                FOUND=1
            fi

        done

        # Aucun test correspondant
        if [ $FOUND -eq 0 ]; then
            echo -e "${RED}ERREUR : Aucun test trouve pour '$FILTER'${NC}"
            exit 1
        fi

    done
fi

PASSED=0
FAILED=0

echo "=================================================="
echo "   Analyse des Traductions WASM -> Boogie         "
echo "=================================================="

for T in "${SELECTED_TESTS[@]}"; do
    # Extraction de la catégorie et du nom du test
    CATEGORY=$(dirname "$T")
    TEST_NAME=$(basename "$T")

    echo ""
    echo -e "${YELLOW}TEST : [ $TEST_NAME ] (Catégorie: $CATEGORY)${NC}"
    echo "--------------------------------------------------"

    # Mise à jour des chemins pour intégrer le sous-dossier de catégorie
    WAT_FILE="tests/$T/$TEST_NAME.wat"
    EXPECTED_FILE="tests/$T/$TEST_NAME.expected"
    BPL_FILE="$OUTPUT_DIR/$TEST_NAME.bpl"

    # 1. Vérification des fichiers
    if [ ! -f "$WAT_FILE" ] || [ ! -f "$EXPECTED_FILE" ]; then
        echo -e "${RED}ERREUR : Fichiers manquants dans tests/$T/${NC}"
        ((FAILED++))
        continue
    fi

    # 2. Génération
    dotnet "$VERISOL_DLL" --wasm "$WAT_FILE" --no-boogie > /dev/null 2>&1
    if [ ! -f "$BPL_FILE" ] ; then
        echo -e "${RED}ERREUR : Echec de generation du fichier $BPL_FILE${NC}"
        ((FAILED++))
        continue
    fi

    # 3. Extraction de la zone etudiee
    BODY=$(awk "/implementation[[:space:]]+${TEST_NAME}[[:space:]]*\(/, /^}/" "$BPL_FILE")
    if [ -z "$BODY" ]; then
        echo -e "${RED}ERREUR : Impossible d'extraire la fonction $TEST_NAME() dans le .bpl${NC}"
        ((FAILED++))
        continue
    fi

    echo -e "${CYAN}[Fonction Boogie generee] :${NC}"
    echo "$BODY"
    echo "--------------------------------------------------"

    echo -e "${CYAN}[Logique attendue] :${NC}"
    cat "$EXPECTED_FILE"
    echo "--------------------------------------------------"

    # 4. Normalisation pour comparaison
    CLEANED_BODY=$(echo "$BODY" | tr -d '[:space:]')
    CLEANED_EXPECTED=$(cat "$EXPECTED_FILE" | tr -d '[:space:]')

    # 5. Verdict
    if [[ "$CLEANED_BODY" == *"$CLEANED_EXPECTED"* ]]; then
        echo -e "${GREEN}RESULTAT : SUCCES${NC}"
        echo "La sequence attendue a ete detectee dans la fonction."
        ((PASSED++))
    else
        echo -e "${RED}RESULTAT : ECHEC${NC}"
        echo "La logique attendue est introuvable dans le bloc genere."
        ((FAILED++))
    fi
    echo "=================================================="
done

# Bilan Final
echo ""
echo "=================================================="
echo -e "BILAN : ${GREEN}$PASSED valide(s)${NC}, ${RED}$FAILED en echec${NC}."
echo "=================================================="

if [ $FAILED -gt 0 ]; then
    exit 1
fi