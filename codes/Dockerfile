FROM ubuntu:latest

# Use Ubuntu image from Aliyun
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/ports.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# Install languages environment
ARG LANGS
RUN for LANG in $LANGS; do \
        case $LANG in \
            python) \
                apt-get update && apt-get install -y python3.10 && \
                update-alternatives --install /usr/bin/python python /usr/bin/python3.10 1 ;; \
            cpp) \
                apt-get update && apt-get install -y g++ gdb ;; \
            java) \
                apt-get update && apt-get install -y openjdk-17-jdk ;; \
            csharp) \
                apt-get update && apt-get install -y wget && \
                wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
                chmod +x ./dotnet-install.sh && \
                ./dotnet-install.sh --channel 8.0 && \
                apt-get install libicu-dev ;; \
            c) \
                apt-get update && apt-get install -y gcc gdb ;; \
            # More languages...
            *) \
                echo "Warning: No installation workflow for $LANG" ;; \
        esac \
    done

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /codes

CMD ["/bin/bash"]
