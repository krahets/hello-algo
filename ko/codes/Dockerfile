FROM ubuntu:latest

# Aliyun의 Ubuntu 이미지를 사용한다
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y wget

# 프로그래밍 언어 실행 환경을 설치한다
ARG LANGS
RUN for LANG in $LANGS; do \
        case $LANG in \
            python) \
                apt-get install -y python3.10 && \
                update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 ;; \
            cpp) \
                apt-get install -y g++ gdb ;; \
            java) \
                apt-get install -y openjdk-17-jdk ;; \
            csharp) \
                wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
                dpkg -i packages-microsoft-prod.deb && \
                apt-get update && \
                apt-get install -y dotnet-sdk-8.0 ;; \
            # 추가 언어...
            *) \
                echo "경고: $LANG 설치 절차가 없다" ;; \
        esac \
    done

WORKDIR /codes
COPY ./ ./

CMD ["/bin/bash"]
