FROM ubuntu:24.04

WORKDIR /home/example-to-push-to-hub

RUN apt-get update && \
apt-get install git curl neovim vim -y

WORKDIR /root/.config

RUN git clone https://github.com/MichaelScarn75/nvim-0.11-linux-config.git

RUN mv nvim-0.11-linux-config nvim

ENTRYPOINT ["bash"]

# Run PackerSync and PackerUpdate manually in nvim after this
