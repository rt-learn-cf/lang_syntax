# Overview

This project aims to serve as a playground to try different construct, features and functions of the coldfusion language.


## Setup 

[Install Coldfusion Developer edition](http://www.adobe.com/sea/products/coldfusion-family.html) Select options that lean towards development.

Clone this repo inside `/Applications/ColdFusion2016/cfusion/wwwroot/` and simply create a symbolic link in your default workspace so you don't need to dig deep to the default folder.

Symbolic Linking example:
```
ln -s /Applications/ColdFusion2016/cfusion/wwwroot/lang_app/ /Users/royceremulla/projects/cf_lang_syntax
```


## Starting the server

Note: Check to see if you already have a running server, in that case you don't need to start it up your self.

Go to coldfusion home under bin, usually `/Applications/ColdFusion2016/cfusion/bin`, then run:
```
$ ./coldfusion start
```




## Issues

- Fix the linking due to recent refactoring of the file structure.