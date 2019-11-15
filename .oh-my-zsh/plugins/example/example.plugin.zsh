# Add your own custom plugins in the custom/plugins directory. Plugins placed
# here will override ones with the same name in the main plugins directory.

typeset -a globalias_ignore
globalias_ignore=()

globalias() {
   if ! [[ $LBUFFER =~ "\<($(IFS=$'\|'; echo "${globalias_ignore[*]}"))\$" ]]; then
      zle _expand_alias
      zle expand-word
   fi
   zle self-insert
}
zle -N globalias

# space expands all aliases, including global
bindkey -M emacs " " globalias
bindkey -M viins " " globalias

# control-space to make a normal space
bindkey -M emacs "^ " magic-space
bindkey -M viins "^ " magic-space

# normal space during searches
bindkey -M isearch " " magic-space
