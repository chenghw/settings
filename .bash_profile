function mov-to-gif() {
  ffmpeg -i $1 -vf "scale=1200:-1:flags=lanczos" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $2
}

function hi-gif() {
  local palette="/tmp/palette.png"

  local filters="fps=15,scale=700:-1:flags=lanczos"

  ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
  ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
}

# Prompt Configuration
# =====================
	# This function is called in your promt to output your active git branch
	function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^​*]/d' -e 's/* \(.*\)/ (\1)/'
	}
    #
	# This function builds your prompt. It is called below
	function prompt {
		# Define some local colors
		local         GREEN="\[\033[0;32m\]" # This syntax is some weird bash color thing I never
		local   LIGHT_RED="\[\033[1;31m\]" # really understood
		local        CHAR="$"
		local   BLUE="\[\e[0;49;34m\]"

		# :hearts: ☆ ★ - Keeping some cool ASCII Characters for reference

		# Here is where we actually export the PS1 Variable which stores the text for your prompt
		export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]] $BLUE\u\w $GREEN(\$(parse_git_branch)) \n \[\e[0m\]$CHAR \[\e[0m\]"
		    PS2='> '
		    PS4='+ '
	}
    #
	prompt
    # Load in the git branch prompt script.
    # source ~/.git-prompt.sh
    #
    # PS1="\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u\[$YELLOW\]\[$YELLOW\]\w\[\033[m\]\[$MAGENTA\]\$(__git_ps1)\[$WHITE\]\$ "
    # PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
# Aliases
# =====================

 # LS
 alias l='ls -lah'

 # Git
 alias gcl="git clone"
 alias gst="git status"
 # alias gl="git pull"
 # alias gp="git push"
 # alias gpr="git pull --rebase"
 # alias gd="git diff | subl"
 # alias gc="git commit -m"
 # alias gb="git branch"
 # alias gcob="git checkout -b"
 # alias gco="git checkout"
 # alias gcam="git commit -am"
 alias gap="git add -p"

# Case-Insensitive Auto Completion
bind "set completion-ignore-case on"

# Postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin

# Git Bash Completion
# Will activate bash git completion if installed
# via homebrew
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# NVM
export NVM_DIR=~/.nvm
  . $(brew --prefix nvm)/nvm.sh

export GIT_MERGE_AUTOEDIT='no'

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -s "/Users/howoncheng/.scm_breeze/scm_breeze.sh" ] && source "/Users/howoncheng/.scm_breeze/scm_breeze.sh"
