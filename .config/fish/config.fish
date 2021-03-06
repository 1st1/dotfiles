set -xg GPG_TTY (tty)

if test -n "$VIRTUAL_ENV"
  # Make sure that venv/bin is always first in the $PATH
  set -xg PATH $VIRTUAL_ENV/bin $PATH

  # Set __PYVENV_LAUNCHER__ to the proper, local for the virtual env, python.
  set -xg __PYVENV_LAUNCHER__ (which python)

  function fish_title
    if test -n "$SSH_CLIENT" ;or test -n "$SSH_TTY"
      echo -sn (hostname -s) ": "
    end
    echo "{"(basename $VIRTUAL_ENV)"}" (prompt_pwd)
  end
else
  if test -d /opt/local/bin
    # MacPorts
    set -xg PATH /opt/local/bin /opt/local/sbin $PATH
  end

  function fish_title
    if test -n "$SSH_CLIENT" ;or test -n "$SSH_TTY"
      echo -sn (hostname -s) ": "
    end
    echo (prompt_pwd)
  end

  function python
    echo "'python' command is not available; use a venv" 1>&2
    return 1
  end

  function python3
    echo "'python3' command is not available; use a venv" 1>&2
    return 1
  end

  function pip
    echo "'pip' command is not available; use a venv" 1>&2
    return 1
  end

  function pip3
    echo "'pip3' command is not available; use a venv" 1>&2
    return 1
  end
end

set -xg PATH $PATH $HOME/.bin

set -xg WORKON_HOME $HOME/dev/venvs

set -xg MANPATH /opt/local/share/man $MANPATH

if type -q /opt/local/bin/vim
  set -xg EDITOR /opt/local/bin/vim
else
  set -xg EDITOR /usr/bin/vim
end

set -xg LSCOLORS gxfxcxdxbxegedabagacad
set -xg CLICOLOR 1

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind resh enad

function fish_prompt
  set last_status $status

  if test -n "$SSH_CLIENT" ;or test -n "$SSH_TTY"
    set -l h_tag (hostname -s)
    echo -sn (set_color 0CC) "$h_tag " (set_color 888) "« " (set_color normal)
  end

  if test -n "$VIRTUAL_ENV"
    set -l ve_tag (basename "$VIRTUAL_ENV")
    echo -sn (set_color B69) "{$ve_tag} " (set_color normal)
  end

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)
  echo -sn (set_color 888) '» '

  set_color normal
end

if functions -q fish_user_key_bindings
  # fisher defines its own 'fish_user_key_bindings' which we will
  # shadow later. Save it as __overloaded_fish_user_key_bindings
  # and call later in 'fish_user_key_bindings'.
  functions -c fish_user_key_bindings __overloaded_fish_user_key_bindings
end

function fish_user_key_bindings
  if functions -q __overloaded_fish_user_key_bindings
    __overloaded_fish_user_key_bindings
  end

  # clear command line on ^C
  bind \cc 'commandline ""'
end

function p
  ps aux | grep -i $argv
end

function cdc
  if test -z "$_VIRTUAL_ENV_HOME"
    cd
  else
    cd $_VIRTUAL_ENV_HOME
  end
end

function vex
  # Enhances 'vex' command with an '--wd' command option and
  # returns you back to the dir you were working in before
  # entering a venv.

  # Use --wd within a virtual env to set a "home dir" for it.

  if not type -f -q "$HOME/dev/sys-venvs/fish/bin/vex"
    echo "'vex' is missing." 1>&2
    echo "Make ~/dev/sys-venvs/fish venv and install vex there." 1>&2
    return 1
  end

  set -l _OLD_VIRTUAL_ENV_HOME "$_VIRTUAL_ENV_HOME"

  pushd $PWD

  if test (count $argv) -eq 1
    switch $argv[1]
    case "--wd"
      if test -z "$VIRTUAL_ENV"
        echo "You must be in a virtual env to execute 'vex --wd'"
        popd
        return 1
      else
        echo $PWD >"$VIRTUAL_ENV/.wd"
        popd
        return 0
      end
    case "*"
      set -l wd "$WORKON_HOME/"$argv[1]"/.wd"
      if test -e $wd
        read wd <$wd
        set -xg _VIRTUAL_ENV_HOME "$wd"
        cd $wd
      end
    end
  end

  command "$HOME/dev/sys-venvs/fish/bin/vex" $argv
  popd
  set -xg _VIRTUAL_ENV_HOME "$_OLD_VIRTUAL_ENV_HOME"
end

source ~/.config/fish/theme.fish

if test -e ~/.config/fish/local.fish
  # For local modifications
  source ~/.config/fish/local.fish
end
