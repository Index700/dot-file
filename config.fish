##cd with ls
function cdls
	 builtin cd $argv; and ls
end


alias cd=cdls		
# alias rm=mvtmp
alias o=oald
alias math=MathKernel

# #KG Proxy
# function kgproxy
#     set -x  http_proxy http://proxy.ksc.kwansei.ac.jp:8080
#     set -x https_proxy http://proxy.ksc.kwansei.ac.jp:8080
#     set -x  ftp_proxy http://proxy.ksc.kwansei.ac.jp:8080
#     sudo cp /etc/apt/kgapt /etc/apt/apt.conf
# end

function kgproxy
    export http_proxy=http://proxy.ksc.kwansei.ac.jp:8080
    export https_proxy=http://proxy.ksc.kwansei.ac.jp:8080
    export ftp_prixy=http://proxy.ksc.kwansei.ac.jp:8080
end

function noproxy
    set -e http_proxy
    set -e https_proxy
    set -e ftp_prixy
    sudo cp /etc/apt/noproxy /etc/apt/apt.conf
end

#pytonにPATHを通す
	#export PATH="~/.anyenv/bin:$PATH"
set PATH ~/.anyenv/bin $PATH
    #eval "$(anyenv init -)"	
anyenv init - |source

#PYTHONPATH
set -x PYTHONPATH /usr/local/lib/python3.5/dist-packages/:/home/keita/lib/python//:~/.anyenv/envs/pyenv/versions/3.7.3/lib/python3.7/site-packages//

#C-rでコマンドの履歴検索 *packageのpecoを利用
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

#filefoxを自身で入れたfirefoxへ X(firefox-esr)
# alias firefox=~/firefox/firefox

#perl設定用
set  PATH ~/.plenv/bin $PATH
plenv init - |source

#TexのPATHを通す
# // でそれ以下のディレクトリを参照
export TEXINPUTS=.:/usr/local/lib/inputs//:/usr/share/texlive/texmf-dist//:/etc/texmf//

# set -x TEXINPUTS .:/usr/local/lib/inputs//:/usr/share/texlive//:/etc/texmf// $TEXINPUTS

#alias
alias m=mupdf
alias g=git

set -x BROWSER firefox-esr

set PATH ~/bin $PATH
# export PATH=$PATH:~/bin

# export DISPLAY=localhost:0.0

set -x  PKG_CONFIG_PATH /home/keita/.config/pkgconfig/
