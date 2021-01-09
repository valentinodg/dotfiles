# initialize zsh-autosuggestion
# source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# bindkey '^ ' autosuggest-accept

# initialize zsh-syntax-highlighting
# source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.config/zsh/.zsh_history

setopt appendhistory 
setopt autocd 
setopt extendedglob 
setopt nomatch 
setopt notify
# setopt correctall
setopt autolist
setopt automenu
setopt alwaystoend

unsetopt beep

# enable vim mode
bindkey -v

# use jk to trigger vi-cmd-mode
bindkey 'jk' vi-cmd-mode

zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit 
compinit

autoload -Uz promptinit
promptinit
# prompt walters

autoload -Uz colors 
colors

PROMPT='%F{226}[%n:%m:%~]> %f'

# zle key bindings (create a zkbd compatible hash)
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"

# setup keys 
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete

# make sure the terminal is in application mode, when zle is active
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
	echoti smkx
	}
	function zle_application_mode_stop {
	echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# matching-driven history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search

key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# automatic ls after autocd
autoload -U add-zsh-hook
# add-zsh-hook -Uz chpwd(){ lsd -A --icon never --group-dirs first }
add-zsh-hook -Uz chpwd(){ exa -as type }

# auto-completion with keyboard
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# enable auto-completion in privileged commands (ex. sudo)
zstyle ':completion::complete:*' gain-privileges 1

# case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# generate descriptions with magic
zstyle ':completion:*' auto-description 'specify: %d'

# auto-completion of command line switches for alias
setopt completealiases

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# enable reverse search
bindkey '^N' history-incremental-search-backward

# autopushd
DIRSTACKSIZE=10
setopt autopushd
setopt pushdsilent 
setopt pushdminus 
setopt pushdignoredups

# no duplicate lines in the history
setopt histsavenodups
setopt histignorealldups
setopt histreduceblanks
setopt histfindnodups
setopt incappendhistory
setopt sharehistory

# use lf to switch directories and bind it to ctrl-o
# lfcd () {
#   tmp="$(mktemp)"
#   lf -last-dir-path="$tmp" "$@"
#   if [ -f "$tmp" ]; then
#     dir="$(cat "$tmp")"
#     rm -f "$tmp"
#     [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#   fi
# }
# bindkey -s '^o' 'lfcd\n'

# use ranger to switch directories and bind it to ctrl-o
function ranger-cd {
  tempfile="$(mktemp -t tmp.XXXXXX)"
  ranger --choosedir="$tempfile" "${@:-$(pwd)}"
  test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
      cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
  }

bindkey -s '^O' 'ranger-cd\n'

# use fzf to find/mod files
fzfed() { 
  du -aL ~/.config ~/code ~/.local/bin | 
  awk '{print $2}' | 
  fzf --layout=reverse --height 20% | 
  xargs -or $EDITOR ;
}
bindkey -s '^p' 'fzfed\n'

# save dirstacksize last visited folder
autoload -Uz add-zsh-hook

DIRSTACKFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
  dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
  [[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

setopt pushdtohome

# persistent rehash
zstyle ':completion:*' rehash true

#completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path $HOME/.config/zsh/cache

# prevent cvs files/directories from being completed
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#CVS'

# fuzzy matching of completion on mistype
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# the number of errors allowed by _approximate increase with the length of what you have typed so far
zstyle -e ':completion:*:approximate:*' \
        max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# ignore completion functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '_*'

# helper function
xdvi() { command xdvi ${*:-*.dvi(om[1])} }

# fall into menu selection immediately and have the  words sorted by time
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# completing process ids with menu selection
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# remove the trailing slash if you end up using a directory as argument (usefull with ln)
zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# load alias config file
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
