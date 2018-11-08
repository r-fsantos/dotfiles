export MONGODB_JIRA_USERNAME="mathew.robinson"
export MONGODB_DEFAULT_REVIEWERS="andrew.morrow@10gen.com"

function cr() {
    flags=(--jira_user=\"$MONGODB_JIRA_USERNAME\" $@)

    if [[ $flags == *--help* || $flags == *-h* ]]; then
        python ~/Code/mongodb/kernel-tools/codereview/upload.py --help
        return
    fi

    if [[ $flags != *--reviewers* ]]; then flags+=(--reviewers=\"$MONGODB_DEFAULT_REVIEWERS\"); fi
    if [[ $flags != *--title* ]]; then
        TITLE=$(git log -n 1 --format='%s')
        flags+=(--title=\"$TITLE\");
    fi

    eval python ~/Code/mongodb/kernel-tools/codereview/upload.py ${flags[@]}
}
