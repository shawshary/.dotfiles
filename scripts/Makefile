softwares = build-essential curl git zathura

git_submoudle: base
	git submodule update --init

base:
	sudo apt-get install -yf $(softwares)

vim_dependencies:
	sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev \
	libxpm-dev libxt-dev

clean_vim_depend:
	sudo apt-get purge libncurses5-dev libgnome2-dev libgnomeui-dev \
	libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev \
	libxpm-dev libxt-dev \

