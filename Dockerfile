FROM python:3.10.0-alpine

# Official PyPI is preferred when reachable.
ENV PIP_INDEX_URL=https://pypi.org/simple

# Use the mirror when official PyPI is unreachable.
# ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install --upgrade pip
RUN pip install mkdocs-material==9.5.5 mkdocs-glightbox

WORKDIR /hello-algo

COPY overrides ./build/overrides

COPY docs ./build/docs
COPY mkdocs.yml mkdocs.yml
RUN mkdocs build -f mkdocs.yml

COPY zh-hant/docs ./build/zh-hant/docs
COPY zh-hant/mkdocs.yml ./zh-hant/mkdocs.yml
RUN mkdocs build -f ./zh-hant/mkdocs.yml

COPY en/docs ./build/en/docs
COPY en/mkdocs.yml ./en/mkdocs.yml
RUN mkdocs build -f ./en/mkdocs.yml

COPY ja/docs ./build/ja/docs
COPY ja/mkdocs.yml ./ja/mkdocs.yml
RUN mkdocs build -f ./ja/mkdocs.yml

COPY ru/docs ./build/ru/docs
COPY ru/mkdocs.yml ./ru/mkdocs.yml
RUN mkdocs build -f ./ru/mkdocs.yml

WORKDIR /hello-algo/site
EXPOSE 8000
CMD ["python", "-m", "http.server", "8000"]
