## MYDOTFILES SETUP 

#### Repo Clone
```
git clone git://github.com/<username>/mydotfiles.git .files
```

#### Submodules Clone
```
cd .files
git submodule init && git submodule update
```

#### Sym Links
```
ln -s .files/bashrc .bashrc
ln -s .files/aliases .bash_aliases
ln -s .files/gitconfig .gitconfig
ln -s .files/vimrc .vimrc
ln -s .files .vim
```

#### Installing New VIM plugins
```
git submodule add git://github.com/author/vim-plugin-name.git bundle/plugin-name
git add .
git commit -m 'adding new plugin'
```

### Update Installed plugins
```
git submodule foreach git pull origin master
```

