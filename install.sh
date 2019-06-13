#!/usr/bin/env sh

install() {
	TARGET=$1 DESTINATION=$2$(basename "$TARGET")
	sudo rm -fr "$DESTINATION"
	sudo ln -rs dotfiles/"$TARGET" "$DESTINATION" &&
		echo Installed: "$TARGET"
}

install .condarc ~/
install .inputrc ~/
install .tmux.conf ~/
install .xinitrc ~/
install bash/.bash_profile ~/
install bash/.bashrc ~/
install git ~/.config/
install nvim ~/.config/
install pacman/hooks/ /etc/pacman.d/
install pacman/pacman.conf /etc/
install st.desktop /usr/share/applications/

sudo rm /etc/systemd/journald.conf
sudo ln ~/Projects/dotfiles/dotfiles/systemd/journald.conf /etc/systemd/journald.conf &&
	echo Installed: journald
sudo rm /etc/systemd/logind.conf
sudo ln ~/Projects/dotfiles/dotfiles/systemd/logind.conf /etc/systemd/logind.conf &&
	echo Installed: logind
