#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# git deploying commands
git init
git config user.email 'ponaravindwork98@gmail.com'
git add -A
git commit -m 'deploy'
git push -f git@github.com:imaravind98/personal-site.git master:gh-pages

cd -
