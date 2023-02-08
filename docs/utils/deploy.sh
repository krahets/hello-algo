# This script is borrowed from https://gist.github.com/cobyism/4730490

cd build
git add .
git commit -m "build"
git push -u origin docs
cd ..

mkdocs build --clean

cd site
git add .
git commit -m "deploy"
git push -u origin gh-pages
