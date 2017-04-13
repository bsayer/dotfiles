function fish_prompt
  set last_status $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  echo -n -s "$__fish_prompt_hostname" " "
  set_color $fish_color_cwd
  set_color -b 3C3C3C
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  set_color normal
end
