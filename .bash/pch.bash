function pch() {
    evergreen patch -t all -d "$(git log --format=%s -n 1)" $@
}
