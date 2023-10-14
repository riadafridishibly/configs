all:

astro-user-conf:
	rm -r ~/.config/nvim/lua/user
	cp -r ./nvim/user ~/.config/nvim/lua/user

nvim:
	# mkdir -p ~/.config/nvim
	# cp -r ./nvim ~/.config/nvim
