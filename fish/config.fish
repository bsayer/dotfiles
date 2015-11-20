# Set architecture flags
set -g -x ARCHFLAGS="-arch x86_64"
# Turn off default fish greeting
set -g -x fish_greeting ''
set fish_key_bindings fish_vi_key_bindings
set fish_color_cwd FDF6E3
#fish_vi_mode
set fish_color_search_match --background=white
set fish_color_selection --background=white
# Fish git prompt
set __fish_git_prompt_show_informative_status 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showcolorhints 'yes'
switch (uname -n)
case Bens-MBP.local
case Bens-MacBook-Pro.local
	# Ensure user-installed binaries take precedence
	set -g -x PATH  /Applications/MAMP/Library/bin /usr/local/bin $PATH
	# Set JAVA_HOME for soapUI
	set -x JAVA_HOME /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/java
case '*'
end
