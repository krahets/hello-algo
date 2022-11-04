mkdocs build
cd site
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:krahets/dsa-021.git master:gh-pages
cd -
