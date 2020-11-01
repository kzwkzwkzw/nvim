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

### Install git for windows

Download and place where you like.  
[neovim release][nvim]  

### Install LLVM (clangd)

Download and install to default path.  
[llvm release][llvm]  

### Install ripgrep

Download and place to '$KZW_BIN_DIR\ripgrep'  
[ripgrep release][ripgrep]  

### Clone this repository

Use git bash.  
```
mkdir -p ~/.config
cd ~/.config
git clone https://github.com/kzwkzwkzw/nvim.git
```

  [git]: https://gitforwindows.org/
  [nvim]: https://github.com/neovim/neovim/releases
  [llvm]: https://github.com/llvm/llvm-project/releases
  [ripgrep]: https://github.com/BurntSushi/ripgrep/releases
