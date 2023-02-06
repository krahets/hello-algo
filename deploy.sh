rm -rf ./site
mkdocs build --clean
cd site
git init
git add -A
git commit -m "deploy"
git push -f git@github.com:krahets/hello-algo.git main:gh-pages
cd -
