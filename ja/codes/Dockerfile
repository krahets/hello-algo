FROM ubuntu:latest

# Aliyun の Ubuntu イメージを使用する
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y wget

# 各言語の実行環境をインストールする
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
            # その他の言語...
            *) \
                echo "警告：$LANG のインストール手順がありません" ;; \
        esac \
    done

WORKDIR /codes
COPY ./ ./

CMD ["/bin/bash"]
