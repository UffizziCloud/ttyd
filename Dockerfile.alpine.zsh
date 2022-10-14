FROM tsl0922/ttyd:alpine

EXPOSE 7681

RUN apk update && apk upgrade && apk add \
      git \
      zsh \
      curl \
      nano \
      htop \
      wget \
      screen \
      vim \ 
      zsh-autosuggestions \
      zsh-syntax-highlighting \
      bind-tools && \
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
    echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc

# CMD ["ttyd", "/bin/zsh"]