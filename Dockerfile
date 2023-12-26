FROM python:3.10.0-alpine

ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --upgrade pip
RUN pip install mkdocs-material==9.5.2 mkdocs-glightbox

WORKDIR /hello-algo

COPY overrides ./build/overrides
COPY docs ./build/docs
COPY docs-en ./build/docs-en
COPY mkdocs.yml ./mkdocs.yml
COPY mkdocs-en.yml ./mkdocs-en.yml

RUN mkdocs build -f mkdocs.yml
RUN mkdocs build -f mkdocs-en.yml

WORKDIR /hello-algo/site
EXPOSE 8000
CMD ["python", "-m", "http.server", "8000"]
