# termite
rm -rf ./termite
cp -a ~/.config/termite ./termite

# nvim
rm -rf ./nvim
mkdir nvim
cp ~/.config/nvim/init.vim ./nvim/init.vim
ls -l ~/.config/nvim/bundle >> ./nvim/plugins_list

# tmux
rm -rf ./tmux
mkdir tmux
cp ~/.tmux.conf ./tmux/.tmux.conf
