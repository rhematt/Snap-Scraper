//
//  check.swift
//  SCMapDownloader
//
//  Created by Richard Matthews on 15/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//
import Foundation

class Check {
    
    let caller = SCApiCalls()
    let downloader = Downloader()
    
    func checker(lat:String, long:String, zoom:String, consoleIO:ConsoleIO){
        let epoch = caller.getEpoch(lat: lat,lon: long,zoom: zoom)
        print("EPOCH IS:", epoch)
        let (mediaURLS, mediaDictionary) = caller.getPlaylist(lat: lat,lon: long,zoom: zoom,epoch: epoch,flag:"checker")
        
        //exportToLog()
        
        print("")
        print("Would you like to print the links? y/n")
        let printLinks = consoleIO.getInput()
        
        switch printLinks {
            
        case "y":
            print("")
            // loop through the mediaURLS and print them to the screen on a newline
            for item in mediaURLS {
                print("\(item)")
            }
        default:
            break
        }
        print("")
        print("Would you like to save the links to file? y/n")
        let saveLinks = consoleIO.getInput()
        
        switch saveLinks {
            
        case "y":
            print("")
            // loop through the mediaURLS and print them to the screen on a newline
            // Set the file path
            let date = Date()
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = format.string(from: date)
            let documentsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
            
            let path = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(long)-listing.txt")
            
            let output = mediaURLS.joined(separator: "\n")
            
            do {
                try output.write(to: path, atomically: false, encoding: String.Encoding.utf8)
                //print("\(output)")
            }
            catch let error as NSError {
                print(error.localizedDescription)
                print("Ooops! Something went wrong: \(error)")
            }
        default:
            break
        }
            print("")
            print("Would you like to download the media? y/n")
            let downloadLinks = consoleIO.getInput()
            
            switch downloadLinks {
                
            case "y":
                print("")
                downloader.downloadFile(lat:lat, long:long, urlArray:mediaURLS, urlDictionary: mediaDictionary)
            default:
                print("")
                break
            }
    
    }

    
}

