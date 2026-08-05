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

# Opérations arithmétiques : "arithmetique/add" "arithmetique/sub" "arithmetique/mult" "arithmetique/div_s" "arithmetique/div_u" "arithmetique/div_ft" 
# Opérations de comparaison : "comparaison/eq" "comparaison/ne" 
# Opérations de contrôle : "controle/loop" "controle/if_no_else_false" "controle/if_no_else_fonc" "controle/if_void_else" "controle/nested_if" "controle/br" "controle/br_if" "controle/block"
# Fonctions : "fonctions/call" "fonctions/local_get" "fonctions/local_set" "fonctions/local_tee"
# Opérations de mémoire : "memoire/load" "memoire/store" "memoire/memory_grow" "memoire/memory_size"
# Autres Instructions : "autres/drop" "autres/unreachable" "autres/select"

# --------------------------------------------------
# LISTE DES TESTS À EXÉCUTER
# --------------------------------------------------
TESTS=(
    "tables/table_set"
)

PASSED=0
FAILED=0

echo "=================================================="
echo "   Analyse des Traductions WASM -> Boogie         "
echo "=================================================="

for T in "${TESTS[@]}"; do
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