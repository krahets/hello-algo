FROM python:3.9.0-alpine

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mkdocs-material==9.4.1 mkdocs-glightbox

WORKDIR /app

COPY overrides /app/build/overrides
COPY docs /app/build/docs
COPY docs-en /app/build/docs-en
COPY mkdocs.yml /app/mkdocs.yml
COPY mkdocs-en.yml /app/mkdocs-en.yml

RUN mkdocs build -f mkdocs.yml
RUN mkdocs build -f mkdocs-en.yml

WORKDIR /app/site
EXPOSE 8000
CMD ["python", "-m", "http.server", "8000"]
