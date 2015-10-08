function mybrew
	set -lx PATH /usr/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin
	brew $argv
end
