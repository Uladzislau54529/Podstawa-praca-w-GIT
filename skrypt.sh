#!/bin/bash
show_date(){
    date
}

create_log(){
    for i in $(seq 1 $1); do
        echo "log$i.txt - Utworzone przez skrypt skrypt.sh w dniu $(date)" > "log$i.txt"
    done
}

show_help(){
    echo "Dostepne opcje:"
    echo "--date, -d: dzisiejsza data"
    echo "--logs, -l: automatyczne tworzenie 100 plikow logi.txt, i pózniej numer pliku od 1 do 100"
    echo "--logs 30, -l 30: automatyczne tworzenie 30 plikow, wychodzi tak samo jak wyzej, ale z obsluga argumentu liczby plikow"
    echo "--help, -h: wyswietlenie wszystkich opcji"
    echo "--init, -i: klonuje twój repozytorium"
    echo "--error, -e: tworzy errorx/errorx.txt"
}

init_repo() {
    git clone https://github.com/Uladzislau54529/Podstawa-praca-w-GIT?tab=readme-ov-file#podstawa-praca-w-git
    repo_name=$(basename "https://github.com/Uladzislau54529/Podstawa-praca-w-GIT?tab=readme-ov-file#podstawa-praca-w-git" .git)
    export PATH=$PATH:$(pwd)/$repo_name
    echo "Repozytorium $repo_name klonuje i dodaje do PATH"
}

create_errors(){
    mkdir -p errorx
    for i in $(seq 1 ${1:-100}); do
        echo "error$i.txt - tworzenie przez skrypt skrypt.sh" > "errorx/error$i.txt"
    done
}

case "$1" in
    --date|-d)
    show_date
    ;;
    --logs|-l)
    count=${2:-100}
    create_log $count
    ;;
    --help|-h)
    show_help
    ;;
    --error|-e)
    count=${2:-100}
    create_errors $count
    ;;
    --init|-i)
    init_repo
    ;;
    *)
    echo "Nieznana opcja: $1"
    show_help
    ;;
esac