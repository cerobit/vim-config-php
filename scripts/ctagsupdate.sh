#!/bin/bash

cd $1
git_root=$(pwd -P 2>/dev/null || command pwd)
while [ ! -e "$git_root/composer.json" ]; do
  git_root=${git_root%/*}
  if [ "$git_root" = "" ]; then break; fi
done

echo Root :$git_root

exec ctags -f ~/.vim/ctags/tags \
    --recurse \
    --languages=php \
    --PHP-kinds=+cfidv\
    --totals=yes \
    --tag-relative=yes \
    --regex-PHP='/abstract\s+class\s+([^ ]+)/\1/c/' \
    --regex-PHP='/interface\s+([^ ]+)/\1/c/' \
    --regex-PHP='/(public\s+|static\s+|abstract\s+|protected\s+|private\s+)function\s+\&?\s*([^ (]+)/\2/f/' \
    --exclude="*.js" \
    --exclude=".svn" \
    --exclude=".git" \
    --exclude=".phpcd" \
    --exclude=".phpcd/*" \
    --exclude=".git/*" \
    --exclude="bin/*" \
    --exclude="app/*" \
    --exclude="bin/*" \
    --exclude="var/*" \
    --exclude="web/*" \
    --exclude="tests/*" \
    --exclude="*/Test/*" \
    --exclude="*/Tests/*" \
    --exclude="*test*" \
    --exclude="*Form/Type*" \
    --exclude=vendor/*/vendor \
    --extra=+f \
    --langdef=file \
    --langmap=file:.html.twig.xml.yml \
    $git_root'/src/AppBundle/Controller' \
    $git_root'/src/AppBundle/Entity' \
    $git_root'/vendor/symfony/symfony/src/Symfony/Component/HttpFoundation' \
    #$git_root'/vendor/sensio' \
    #$git_root'/vendor/doctrine' \
    #$git_root'/vendor/twig' \
    #$git_root'/vendor/friendsofsymfony' \
