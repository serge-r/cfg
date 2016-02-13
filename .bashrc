# .bashrc

# Some parts of this config gets from Dave Vehrs
# https://www.debian-administration.org/article/205/Fancy_Bash_Prompts

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias tmuxa='tmux attach || tmux new'

# use awk to easy convert unix timestamp to normal timestamp
awk_line="awk '{\$1=\"\"; print strftime(\"%Y-%m-%d %H:%M:%S\"),\$0}'"

alias awk_time=$awk_line

# Configure Colors:
COLOR_WHITE='\033[1;37m'
COLOR_LIGHTGRAY='033[0;37m'
COLOR_GRAY='\033[1;30m'
COLOR_BLACK='\033[0;30m'
COLOR_RED='\033[0;31m'
COLOR_LIGHTRED='\033[1;31m'
COLOR_GREEN='\033[0;32m'
COLOR_LIGHTGREEN='\033[1;32m'
COLOR_BROWN='\033[0;33m'
COLOR_YELLOW='\033[1;33m'
COLOR_BLUE='\033[0;34m'
COLOR_LIGHTBLUE='\033[1;34m'
COLOR_PURPLE='\033[0;35m'
COLOR_PINK='\033[1;35m'
COLOR_CYAN='\033[0;36m'
COLOR_LIGHTCYAN='\033[1;36m'
COLOR_DEFAULT='\033[0m'

# prompt function
prompt () {
	
	# Username for colorchange
	local USERNAME=""
	
	# DateTime
	local DATE=""

	# Ending symblos
	local PROMPT=""

		# User
	if [ ${UID} -eq 0 ] ; then
		if [ "${USER}" == "${LOGNAME}" ]; then
			if [[ ${SUDO_USER} ]]; then
				USERNAME="\[${COLOR_RED}\](\u)"
				PROMPT="\[${COLOR_RED}\]-\\$>"
			else
				USERNAME="\[${COLOR_LIGHTRED}\](\u)"
				PROMPT="\[${COLOR_LIGHTRED}\]-\\$>"
			fi
		else                               
			UESRNAME="\[${COLOR_YELLOW}\](\u)"
			PROMPT="\[${COLOR_YELLOW}\]-\\$>"
		fi
	
	else
		if [ ${USER} == ${LOGNAME} ]; then     
			USERNAME="\[${COLOR_GREEN}\](\u)"
			PROMPT="\[${COLOR_GREEN}\]-\\$>"
		else                               
			USERNAME="\[${COLOR_BROWN}\](\u)"
			PROMPT="\[${COLOR_BRONW}\]-\\$>"
		fi
	fi
	
	echo  "\n${USERNAME}-\[${COLOR_CYAN}\][\w]${PROMPT}\[${COLOR_DEFAULT}\]\[\033[s\]"
	#echo "\n\[${COLOR_RED}\]\u@\[${COLOR_GREEN}\]\h\[${COLOR_DEFAULT}\]"
}

# export section
export PS1=$(prompt)
export EDITOR=vim
export TERM=xterm-256color


# Attach TMUX session
if [[ -z "$TMUX" ]]; then
	tmuxa
fi
