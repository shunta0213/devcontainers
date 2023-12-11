# customization
# GO_VERSION
# NODE_VERSION

FROM archlinux:latest

ENV USERNAME=archie
ARG DOWNLOAD_DIR="/tmp/downloads"

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm git neovim gcc wget base-devel sudo npm nodejs python3

# add user
RUN useradd -m -s /bin/bash -g wheel ${USERNAME} ;\
  echo "ALL ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/${USERNAME}" ;\
  chmod 0440 "/etc/sudoers.d/${USERNAME}"

# create download folder
RUN mkdir -p "${DOWNLOAD_DIR}"



# install yay
USER archie
RUN pushd /home/archie/ ;\
  sudo git clone https://aur.archlinux.org/yay.git ;\
  sudo chown -R archie:wheel /home/archie/yay ;\
  sudo chmod -R 775 /home/archie/yay ;\
  pushd yay ;\
  makepkg -si --noconfirm ;\
  popd -1 ;\
  rm -rf yay ;\
  popd -1


# install go
ARG GO_VERSION="1.20.10"
ARG GO_ROOT="/usr/local/go"
RUN sudo wget "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" -O "/tmp/downloads/go${GO_VERSION}.tar.gz" ;\
  sudo rm -rf "${GO_ROOT}" ;\
  sudo tar -C "/usr/local" -xzf "/tmp/downloads/go${GO_VERSION}.tar.gz" ;\
  sudo echo 'export PATH="${PATH}:/usr/local/go/bin"' >> ~/.bashrc

# install nvm and node
ARG NODE_VERSION="21"
RUN yay -S nvm --noconfirm ;\
  echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc ;\
  source ~/.bashrc ;\
  nvm install ${NODE_VERSION} ;\
  nvm use ${NODE_VERSION} ;\
  node -v


# install neovim config
RUN git clone https://github.com/shunta0213/nvim.git ~/.config/nvim

RUN sudo rm -rf "${DOWNLOAD_DIR}"
