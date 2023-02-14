python docs/utils/build_markdown.py

while true; do
    read -p "Do you wish to deploy the site? [y] [n]" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes[y] or no[n].";;
    esac
done

# push the built docs
cd build
git add .
git commit -m "build"
git push -u origin docs
cd ..

# Build mkdocs
mkdocs build --clean

# deploy the site
cd site
git add .
git commit -m "deploy"
git push -u origin gh-pages
cd ..
