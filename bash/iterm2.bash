function it2prof() { 
    echo -e "\033]50;SetProfile=$1\a" 
}

function dark() {
    it2prof SolarizedDark
    sed -i '' s/background=light/background=dark/ $HOME/.config/nvim/init.vim
}


function light() {
    it2prof SolarizedLight
    sed -i '' s/background=dark/background=light/ $HOME/.config/nvim/init.vim
}
