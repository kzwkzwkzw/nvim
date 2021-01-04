# nvim
personal nvim settings

## Windows

### Add environment variables

:XDG_CONFIG_HOME  
This repository uses XDG_CONFIG_HOME for nvim.  
Add environment variable 'XDG_CONFIG_HOME' and set `~/.config`.  

:KZW_BIN_DIR  
This path will be added $PATH by nvim script.  
Add environment variable 'KZW_BIN_DIR' and set your binary path.  

### Install git for windows

Download and install to default path.  
[git for windows][git]  

### Install neovim

Download and place where you like.  
[neovim release][nvim]  

### Install python3

Download and install to default path with add to PATH.  
[python3][py]

Use cmd.
```
pip install pynvim
```

### Install LLVM (clangd)

Download and install to default path.  
[llvm release][llvm]  

### Install ripgrep

Download and place to '$KZW_BIN_DIR/ripgrep'  
[ripgrep release][ripgrep]  

### Install Node.js

Download and place to default path.  
[node.js][nodejs]  

### Clone this repository

Use git bash.  
```
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/kzwkzwkzw/nvim.git
```

### CocInstall

Run nvim and execute CocInstall
```
CocInstall coc-clangd
```

  [git]: https://gitforwindows.org/
  [nvim]: https://github.com/neovim/neovim/releases
  [py]: https://www.python.org/
  [llvm]: https://github.com/llvm/llvm-project/releases
  [ripgrep]: https://github.com/BurntSushi/ripgrep/releases
  [nodejs]: https://nodejs.org/ja/
