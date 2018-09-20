#!/bin/bash

echo "What Is Your Package Name? (note: use CamelCase)"
read package
if [ -f $package ] ; then
    echo "Opps You didnt Set A Package Name"
    exit;
fi

echo "Whats Your Vendor Name?"
read vendor
if [ -f $vendor ] ; then
    vendor="$(echo "$(git config --global user.name)")"
    echo "Default Vendor Name: : Git Config Username"
    echo $'\n'
fi

echo "What Is The Author's Name?"
read author_name
if [ -f $author_name ] ; then
    author_name="$(echo "$(whoami)" | sed 's/.*/\u&/')"
    echo "Default Author's Name: System User"
    echo $'\n'
fi

echo "What Is The Author's Username?"
read author_username
if [ -f $author_username ] ; then
    author_username="$(echo "$(git config --global user.name)")"
    echo "Default Author's Username: Git Config Username"
    echo $'\n'
fi

echo "Whats Your Author's Email?"
read author_email
if [ -f $author_email ] ; then
    author_email="$(echo "$(git config --global user.email)")"
    echo "Default Author's Email: Git Config Email"
    echo $'\n'
fi

echo "Set Package Description?"
read package_description
if [ -f $package_description ] ; then
    package_description="A Laravel Nova Package"
    echo "Default Description: A Laravel Nova Package"
    echo $'\n'
fi
namespace_vendor="$(echo "$(git config --global user.name)" | sed 's/.*/\u&/')"
namespace_tool_name=$package

package_name=$(sed --expression 's/\([A-Z]\)/-\L\1/g' \
--expression 's/^-//'              \
<<< $package)
git clone https://github.com/spatie/skeleton-nova-tool $package_name
cd $package_name

echo $'\n'
rm -rf .git
echo $'\n'
git init
echo $'\n'
git add .
echo $'\n'
git commit -m "Initial Commit!"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:author_name/$author_name/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:vendor/$vendor/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:author_username/$author_username/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:author_email/$author_email/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:package_name/$package_name/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:package_description/$package_description/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:namespace_vendor/$namespace_vendor/g"
find $(pwd) -type f -print0 | xargs -0 sed -i "s/:namespace_tool_name/$namespace_tool_name/g"

echo $'\n'
echo "LARAVEL NOVA PACKAGE GENERATED"
echo '`composer install`'
echo '`yarn && yarn production`'