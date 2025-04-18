FROM nvcr.io/nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

# 패키지 설치시 상호작용 방지
ARG DEBIAN_FRONTEND=noninteractive

# 시스템 패키지 설치
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    g++ \
    cmake \
    swig \
    libgl1-mesa-glx \
    xvfb \ 
    python3.8 \
    python3.8-dev \
    python3.8-distutils \
    curl \
    && rm -rf /var/lib/apt/lists/*

# SSH 데몬 설정
RUN mkdir -p /run/sshd
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
EXPOSE 22

# pip 설치 (python3.8용)
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.8

# pip alias 추가
RUN ln -s /usr/bin/python3.8 /usr/bin/python && \
    ln -s /usr/local/bin/pip /usr/bin/pip

# RUN pip3 install torch==1.10.1+cu111 torchvision==0.11.2+cu111 torchaudio==0.10.1 -f https://download.pytorch.org/whl/cu111/torch_stable.html
RUN pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

# 작업 디렉토리 설정
WORKDIR /workspace

# 프로젝트 파일 복사
COPY . /workspace

# requirements 설치
RUN pip install --upgrade pip setuptools six
RUN pip install -r requirements.txt

# OpenAI baselines 클론 및 설치
# RUN git clone https://github.com/openai/baselines.git && \
#    cd baselines && \
#    pip install -e .
WORKDIR /workspace/baselines
RUN pip install -e .

ENV PYTHONPATH="/workspace/baselines:${PYTHONPATH}"
WORKDIR /workspace

# pyglet 버전 고정 설치
RUN pip install pyglet==1.5.11

# # 컨테이너 진입 시 bash로 시작
# CMD bash -c "Xvfb :99 -screen 0 1024x768x24 & export DISPLAY=:99 && bash"

# 시작 스크립트 생성 (SSH 서버 시작 및 Xvfb 실행)
RUN echo '#!/bin/bash\n\
/usr/sbin/sshd\n\
Xvfb :99 -screen 0 1024x768x24 &\n\
export DISPLAY=:99\n\
echo "SSH 서버가 실행 중입니다. RunPod의 SSH over exposed TCP를 통해 접속하세요."\n\
exec "$@"\n' > /start.sh && chmod +x /start.sh

# 시작 스크립트를 엔트리포인트로 설정
ENTRYPOINT ["/start.sh"]
CMD ["bash"]
