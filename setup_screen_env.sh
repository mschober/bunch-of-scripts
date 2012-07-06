function screen_env {
    local env=$1
    local label=$2
    local user=`whoami`

    if [[ $label != "dev" ]]; then
        GIT=`echo $GIT_PERSONAL | perl -pi -e "s/$user\/main/axio$1\/main/"`
        export GIT_PERSONAL=$GIT
    fi
}
