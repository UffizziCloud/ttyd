FROM golang:1.18-alpine

ARG TARGETARCH
COPY ./dist/${TARGETARCH}/ttyd /usr/bin/ttyd
RUN apk add --no-cache bash tini

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
      bind-tools \
      tmux && \
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
    echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc && \
    echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc


ENTRYPOINT ["/sbin/tini", "--"]


# CMD ["ttyd", "/bin/zsh"]
