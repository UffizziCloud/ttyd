FROM ubuntu:20.04

# ARG TARGETARCH
# COPY ./dist/${TARGETARCH}/ttyd /usr/bin/ttyd
# RUN apt-get update && apt-get install -y --no-install-recommends tini && rm -rf /var/lib/apt/lists/*

# EXPOSE 7681
# WORKDIR /root

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

# CMD ["ttyd", "/bin/zsh"]