FROM python:3.9.0-alpine

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple mkdocs-material==9.0.13

WORKDIR /app

COPY docs /app/docs
COPY mkdocs.yml /app/mkdocs.yml
COPY requirements.txt /app/requirements.txt

RUN pip install  -r /app/requirements.txt && mkdir -p /app/docs/overrides

EXPOSE 8000

CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
