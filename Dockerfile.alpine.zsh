FROM tsl0922/ttyd:alpine

EXPOSE 7681

RUN apk update && apk upgrade -y && apk add -y \
      git \
      zsh \
      curl \
      nano \
      htop \
      wget \
      screen \
      vim && \
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="pygmalion"/' /root/.zshrc

# CMD ["ttyd", "/bin/zsh"]