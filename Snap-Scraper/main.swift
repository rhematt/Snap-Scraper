//
//  main.swift
//  SC-MapDownloader
//
//  Created by Richard Matthews on 11/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//
//  built using a tutorial avaliable from
//  https://www.raywenderlich.com/511-command-line-programs-on-macos-tutorial

/*
The usage for this progam:
1. provide a list of arguments which will be used as part of POST method calls to SC servers.
2. POST method call to getLatestTileSet to obtain values for EPOCH
4. POST method call to getPlaylist using EPOCH and arguments.
   -lat
   -long
   -zoom

ALGORITHM

1. Provide arguments:
   -lat
   -long
   -zoom

2. getEpoch
   - getTileSet
   - return EPOCH

3. getDownloadList
   - getPlaylist (lat,long,zoom,epoch)
       - calculate radius
       - POST getPlayList
       - return ObjectList
   - return MediaLinks

4. downloadFiles

*/


import Foundation
import Alamofire

let MapDownloader = SCMapDownloader()
if CommandLine.argc < 2 {
    MapDownloader.interactiveMode()
} else {
    MapDownloader.staticMode()
}

