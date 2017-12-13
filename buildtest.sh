#!/bin/bash

folderPath="\/Applications\/ColdFusion2016\/cfusion\/wwwroot\/lang_app\/";
relativePath=$(echo $1 | sed "s/$folderPath//")
open http://localhost:8501/lang_app/$relativePath?method=runtestremote&output=html&debug=true
