FROM nvcr.io/nvidia/pytorch:22.08-py3
LABEL maintainer="yjchen@eda.ee.ntu.edu.tw"

# update torch
RUN pip install --upgrade pip 
RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117

# install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y \
    wget \
    flex \
    htop \
    libcairo2-dev \
    libboost-all-dev

# install commonly used python dependencies
RUN pip install seaborn

# ***********************************
# * Set non-root user (for VS Code) *
# ***********************************
ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# [Optional] Set the default user. Omit if you want to keep the default as root. (Comment the following if you are using rootless docker)
USER $USERNAME
