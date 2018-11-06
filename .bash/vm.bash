function vm() {
    export VAGRANT_SYNC_DIR=$(pwd)
    cd $(dfm where)/vagrant
    VAGRANT_SYNC_DIR=$VAGRANT_SYNC_DIR vagrant $@
    cd $VAGRANT_SYNC_DIR
}
