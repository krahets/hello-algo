FROM ubuntu:latest

# Use Ubuntu image from Aliyun
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN apt-get update && apt-get install -y wget

# Install languages environment
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
            # More languages...
            *) \
                echo "Warning: No installation workflow for $LANG" ;; \
        esac \
    done

WORKDIR /codes
COPY ./ ./

CMD ["/bin/bash"]
