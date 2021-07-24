# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz promptinit
promptinit
prompt adam1

autoload -Uz compinit		# Use modern completion system
compinit
setopt print_eight_bit		# 日本語ファイル名等8ビットを通す
bindkey -v			# Vi キーバインド
export LANG=ja_JP.UTF-8		# 文字コードの指定
autoload -Uz colors && colors	# 色を使用出来るようにする
setopt hist_reduce_blanks	# ヒストリに保存するときに余分なスペースを削除する
autoload -Uz zmv		#zmvで一括置換
alias zmv='noglob zmv -W'
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
unsetopt promptcr
#lsに色付け
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls --color"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e
bindkey '^R' history-incremental-search-backward

# zplug 
source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/fasd", from:oh-my-zsh
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto

zplug romkatv/powerlevel10k, as:theme, depth:1
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

(( ! ${+functions[p10k]} )) || p10k finalize
