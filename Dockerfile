FROM python:3.9.0-buster

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mkdocs mkdocs-material

WORKDIR /app

COPY codes /app/codes

COPY docs /app/docs

COPY mkdocs.yml /app/mkdocs.yml

RUN mkdir ./docs/overrides && mkdocs build

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]