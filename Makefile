.POSIX:

OS = $(shell uname -s)

install:
	stow nvim -t ${HOME}
	stow picom -t ${HOME}
	stow ranger -t ${HOME}
	stow shell -t ${HOME}
	stow vifm -t ${HOME}
	stow x11 -t ${HOME}
	stow zathura -t ${HOME}
	stow zsh -t ${HOME}
	if [ ! -L "${HOME}/.profile" ]; then \
		ln -s ${HOME}/.config/shell/profile ${HOME}/.profile; \
	fi
	if [ ! -L "${HOME}/.zprofile" ]; then \
		ln -s ${HOME}/.config/shell/profile ${HOME}/.zprofile; \
	fi
	if [ ! -L "${HOME}/.xinitrc" ]; then \
		ln -s ${HOME}/.config/x11/xinitrc ${HOME}/.xinitrc; \
	fi
	if [ ! -L "${HOME}/.xprofile" ]; then \
		ln -s ${HOME}/.config/x11/xprofile ${HOME}/.xprofile; \
	fi

uninstall:
	stow -D nvim -t ${HOME} >/dev/null 2>&1
	stow -D picom -t ${HOME} >/dev/null 2>&1
	stow -D ranger -t ${HOME} >/dev/null 2>&1
	stow -D shell -t ${HOME} >/dev/null 2>&1
	stow -D vifm -t ${HOME} >/dev/null 2>&1
	stow -D x11 -t ${HOME} >/dev/null 2>&1
	stow -D zathura -t ${HOME} >/dev/null 2>&1
	stow -D zsh -t ${HOME} >/dev/null 2>&1
	if [ -L "${HOME}/.profile" ]; then \
		rm ${HOME}/.profile; \
	fi
	if [ -L "${HOME}/.zprofile" ]; then \
		rm ${HOME}/.zprofile; \
	fi
	if [ -L "${HOME}/.xinitrc" ]; then \
		rm ${HOME}/.xinitrc; \
	fi
	if [ -L "${HOME}/.xprofile" ]; then \
		rm ${HOME}/.xprofile; \
	fi

.PHONY: install uninstall
