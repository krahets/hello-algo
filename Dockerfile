FROM python:3.9.0-alpine

ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --upgrade pip
RUN pip install mkdocs-material==9.4.1 mkdocs-glightbox

WORKDIR /hello-algo

COPY docs ./build/docs
COPY overrides ./build/overrides
COPY mkdocs.yml ./mkdocs.yml

RUN mkdocs build

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
