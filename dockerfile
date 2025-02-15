# CUDA 10.2 및 CUDNN 8 지원 PyTorch Docker 이미지 사용
FROM nvcr.io/nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

# 패키지 설치시 상호작용 방지
ARG DEBIAN_FRONTEND=noninteractive

# 기본 패키지 설치
RUN apt-get update && apt-get install -y \
    wget git curl ca-certificates \
    libgl1-mesa-dev libglib2.0-0 \
    xvfb libegl1-mesa libgles2-mesa-dev \
    libosmesa6-dev \  
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && pip3 install --upgrade pip setuptools

RUN python --version

# PyTorch 설치
RUN pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

# Requirements 설치
COPY requirements.txt /workspace/requirements.txt
WORKDIR /workspace
RUN pip3 install --no-cache-dir -r requirements.txt

# Xvfb 설정 추가 ✅
RUN echo "Xvfb :99 -screen 0 1024x768x24 &" >> /root/.bashrc
RUN echo "export DISPLAY=:99" >> /root/.bashrc

# 기본 실행 환경 설정
CMD ["/bin/bash"]
