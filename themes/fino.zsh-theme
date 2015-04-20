# fino.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with rbenv and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function prompt_char {
  git branch >/dev/null 2>/dev/null && echo "±" && return
  echo '○'
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $SHORT_HOST || echo $HOST
}

local ruby_env=''
if which rvm-prompt &> /dev/null; then
  ruby_env=' ‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    ruby_env=' ‹$(rbenv version-name)›%{$reset_color%}'
  fi
fi

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'


PROMPT="╭─%{$FG[032]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$FG[112]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[024]%}${current_dir}%{$reset_color%} ${git_info}
╰─${prompt_char}%{$reset_color%} "

# ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"

# ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"

GIT_CB="git::"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$FG[214]*%{$reset_color%}%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
