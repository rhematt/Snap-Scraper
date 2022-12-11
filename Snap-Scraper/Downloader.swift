//
//  downloader.swift
//  SCMapDownloader
//
//  Created by Richard Matthews on 12/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//


/*
 List of things to do:
 - need to save details as metadata in the video
    - captureTimestamp
    - creatorID
    - prefixURL
    - previewURL
    - mediaURL
    - mediaVideoURL
    - mediaM3u8URL
    - id
    - extracted location
    -
 
 */

import Foundation
import Alamofire

class Downloader {
    
    // let consoleIO = ConsoleIO()
    let caller = SCApiCalls()
    
    func SCMapDownloader(lat:String, long:String, zoom:String){
        //let caller = SCApiCalls()
        let epoch = caller.getEpoch(lat: lat,lon: long,zoom: zoom)
        let (mediaURLS, mediaDictionary) = caller.getPlaylist(lat: lat,lon: long,zoom: zoom,epoch: epoch)
        downloadFile(lat:lat, long:long, urlArray: mediaURLS, urlDictionary: mediaDictionary)
    }
    
    /*
     Use dictionary to look up value of mediaUrl to get timestamp
     */
    
    func downloadFile(lat:String, long:String, urlArray:[String], urlDictionary:[String:String])->Void{
        //date setup - this isnt static....
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = format.string(from: date)
        
        
        var urlArray = urlArray
        //print("DEBUG: \(urlArray)")
        
        let urlDictionary = urlDictionary
        
        if let s3Url = urlArray.popLast(){
            //set download destination
            //sleep(1) //rate limiting request 1 second
            let destination: DownloadRequest.Destination = { _, _ in
                let documentsURL = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
                
                let foldernames = s3Url.components(separatedBy: "/")
                
                // <TODO> download snaps by creator ID
                // let fileURL = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(lon)/\(creatorID)/\(foldernames[3]).mp4")
                if(foldernames[5]=="media.mp4"){
                    if let timestamp = urlDictionary["\(s3Url)"]{
                        // download movie
                        let fileURL = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(long)/\(timestamp)-\(foldernames[3]).mp4") // currently downloads to unique filenames but no linkage in stories. Multiple videos in series are broken up.
                        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                    }else {
                        let timestamp = "0"
                        let fileURL = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(long)/\(timestamp)-\(foldernames[3]).mp4") // currently downloads to unique filenames but no linkage in stories. Multiple videos in series are broken up.
                        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                    }
                }
                else { //download picture
                    if let timestamp = urlDictionary["\(s3Url)"]{
                        let fileURL = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(long)/\(timestamp)-\(foldernames[3]).jpg") // currently downloads to unique filenames but no linkage in stories. Multiple videos in series are broken up.z
                    
                        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                    }
                    else {
                        let timestamp = "0"
                        let fileURL = documentsURL.appendingPathComponent("Snapchat/\(formattedDate)-@lat\(lat)-lon\(long)/\(timestamp)-\(foldernames[3]).jpg") // currently downloads to unique filenames but no linkage in stories. Multiple videos in series are broken up.z
                                       
                        return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
                    }
                }
            }
            //download file
            AF.download(s3Url, to: destination)
                .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    // Called on utility dispatch queue
                    print("Download progress: \(progress.fractionCompleted)")
            }
            .response { response in
                
            }
            //edit metadata
            
                //created should be the extracted timestamp from metadata
                //modifed should be the timestamp it was extracted on
                
                /* Currently timestamp of media download tine is placed into filename. This is less than satisfactory and should be placed into the metadata of the file. */
            
            
            //call next download
            downloadFile(lat:lat, long:long, urlArray: urlArray, urlDictionary: urlDictionary)
            
        }
        
    }
    
}


