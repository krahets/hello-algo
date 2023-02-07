# This script is borrowed from https://gist.github.com/cobyism/4730490

git add build && git commit -m "build"
git subtree push --prefix build origin built-docs

mkdocs build --clean
git add site && git commit -m "deploy"
git subtree push --prefix site origin gh-pages
