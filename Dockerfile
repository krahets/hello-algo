FROM python:3.9.0-buster

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

RUN pip install --upgrade pip && pip install mkdocs mkdocs-material

WORKDIR /app

COPY codes /app/codes

COPY docs /app/docs

COPY mkdocs.yml /app/mkdocs.yml

RUN mkdir ./docs/overrides && mkdocs build

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]