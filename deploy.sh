mkdocs build
cd site
git init
git add -A
git commit -m 'deploy'
git branch -M main
git push -f git@github.com:krahets/dsa-021.git main:gh-pages
cd -
