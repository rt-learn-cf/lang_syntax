# Overview

This project aims to serve as a playground to try different construct, features
 and functions of the coldfusion language.

## Running with Docker

```shell
docker run -d -p 8500:80 -v \
/Users/royce/github/rt-learn-lang/coldfusion:/var/www/lang_app \
roycetech/coldfusion10_dev:0.01
```

## Setup(Alternative)

[Install Coldfusion Developer edition](http://www.adobe.com/sea/products/coldfusion-family.html)
 Select options that lean towards local development.

Or you can check out [older versions](http://www.cfmlrepo.com/) of Coldfusion

Clone or fork this repo inside `/Applications/ColdFusion2016/cfusion/wwwroot/`
 and simply create a symbolic link in your default workspace so you don't need
 to dig deep to the default folder.

Symbolic Linking example:

```shell
ln -s /Applications/ColdFusion2016/cfusion/wwwroot/lang_app/ \
/Users/royceremulla/projects/cf_lang_syntax
```

## Starting the server

Go to coldfusion home under bin, usually
 `/Applications/ColdFusion2016/cfusion/bin`, then run:

```shell
./coldfusion start
```

## Stopping the server

```shell
./coldfusion stop
```

## Setting Up Live Reload

1. Install chrome browser extension
2. Enable a compatible ruby runtime
3. Install the required gem `$ gem install guard-livereload`
4. Initialize the live reload configuration  by running: `$ guard init livereload`
5. Update the `Guardfile` file manually to watch all the coldfusion files that
 will trigger the reload.
6. Run guard `$ guard`
7. Enable the live-reload extension by clicking its icon in your chrome browser

## Build Index

Get the project files by running: `$ find . -type f -name '*.cf*' | sort`

Using your favorite text editor, find:

```text
\.\/((?:tags|scripts)\/(?:.*\/)*(\d{2}-.*\.cf.{1,2}))
```

and replace with:

```text
<li><a href="\1">\2</a></li>
```
