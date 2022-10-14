FROM tsl0922/ttyd

EXPOSE 7681

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
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
