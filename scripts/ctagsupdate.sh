#!/bin/bash

cd $1
git_root=$(pwd -P 2>/dev/null || command pwd)
while [ ! -e "$git_root/composer.json" ]; do
  git_root=${git_root%/*}
  if [ "$git_root" = "" ]; then break; fi
done

echo Root :$git_root

exec ctags -f ~/.vim/ctags/tags \
    -h ".php" -R \
    --languages=PHP \
    --PHP-kinds=cfiv\
    --totals=yes \
    --tag-relative=yes \
    --regex-PHP='/abstract\s+class\s+([^ ]+)/\1/c/' \
    --regex-PHP='/interface\s+([^ ]+)/\1/c/' \
    --regex-PHP='/(public\s+|static\s+|abstract\s+|protected\s+|private\s+)function\s+\&?\s*([^ (]+)/\2/f/' \
    --exclude="*.js" \
    --exclude=".svn" \
    --exclude=".git" \
    --exclude=".git/*" \
    --exclude="app/*" \
    --exclude="bin/*" \
    --exclude="web/*" \
    --exclude="tests/*" \
    --exclude="*/Test/*" \
    --exclude="*/Tests/*" \
    --exclude="*test*" \
    --exclude="*Form/Type*" \
    $git_root'/src' \
    $git_root'/vendor/sensio' \
    $git_root'/vendor/symfony' \
    #$git_root'/vendor/doctrine' \
    $git_root'/vendor/twig' \
    $git_root'/vendor/friendsofsymfony' \
