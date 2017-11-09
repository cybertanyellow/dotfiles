# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yellow/.fzf/bin* ]]; then
  export PATH="$PATH:/home/yellow/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/yellow/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/yellow/.fzf/shell/key-bindings.zsh"

# copy from https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
