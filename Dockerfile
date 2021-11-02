FROM qmcgaw/godevcontainer

# Aliases
RUN echo "alias lrt='ls -lrt'" >> ~/.zshrc
RUN echo "alias md='mkdir -pv'" >> ~/.zshrc
RUN echo "alias cls='clear'" >> ~/.zshrc
RUN echo "alias please='sudo $(fc -ln -1)'" >> ~/.zshrc

# History
RUN echo "HISTFILE=~/.zsh_history" >> ~/.zshrc
RUN echo "setopt EXTENDED_HISTORY" >> ~/.zshrc
RUN echo "setopt HIST_EXPIRE_DUPS_FIRST" >> ~/.zshrc
RUN echo "setopt HIST_FIND_NO_DUPS" >> ~/.zshrc
RUN echo "setopt HIST_IGNORE_ALL_DUPS" >> ~/.zshrc
RUN echo "setopt HIST_IGNORE_SPACE" >> ~/.zshrc
RUN echo "setopt HIST_REDUCE_BLANKS" >> ~/.zshrc
RUN echo "setopt HIST_NO_FUNCTIONS" >> ~/.zshrc
RUN echo "setopt HIST_NO_STORE" >> ~/.zshrc
RUN echo "setopt HIST_SAVE_NO_DUPS" >> ~/.zshrc
RUN echo "setopt HIST_VERIFY" >> ~/.zshrc
RUN echo "setopt SHARE_HISTORY" >> ~/.zshrc
RUN echo "HISTORY_IGNORE='([ \t]*|[bf]g *}exit|[alsh]#( *)#|history *|clear|ps|cd ~|cd ..|--|pwd|clear|reset|h|vi[m,] *)'" >> ~/.zshrc
RUN echo "HISTSIZE=10000" >> ~/.zshrc
RUN echo "HISTFILESIZE=20000" >> ~/.zshrc

# bat configuration
RUN echo "export BAT_PAGER='less -R'" >> ~/.zshrc

# ripgrep configuration
RUN echo "--smart-case" >> ~/.ripgreprc
RUN echo "--hidden" >> ~/.ripgreprc
RUN echo "--max-columns=150" >> ~/.ripgreprc
RUN echo "--path-separator=/" >> ~/.ripgreprc
RUN echo "export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc" >> ~/.zshrc

# Useful functions
RUN echo "--() { cd -; }" >> ~/.zshrc
RUN echo "h() { if [ -z \"$*\" ]; then history; else history | egrep \"$@\"; fi; }" >> ~/.zshrc

RUN apk add ripgrep bat tig fd
RUN apk add bazel4 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/

# WORKDIR /bazel
# RUN wget -O bazel-install.sh https://github.com/bazelbuild/bazel/releases/download/4.2.1/bazel-4.2.1-installer-linux-x86_64.sh
# RUN chmod 755 bazel-install.sh
# RUN echo "./bazel-install.sh --user" >> ~/.zshrc
