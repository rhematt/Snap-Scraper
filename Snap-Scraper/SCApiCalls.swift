//
//  SCApiCalls.swift
//  SCMapDownloader
//
//  Created by Richard Matthews on 11/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//

import Foundation

class SCApiCalls {
    
    func getEpoch(lat: String = "-34.939798", lon: String = "138.611250", zoom: String = "6.5") -> Int {
        // This file was generated from JSON Schema using quicktype, do not modify it directly.
        // To parse the JSON, add this file to your project and do:
        //
        //   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
        
        // MARK: - Welcome
        struct Welcome: Codable {
            let renderConfig: RenderConfig?
            let tileSetInfos: [TileSetInfo]?
        }
        
        // MARK: - RenderConfig
        struct RenderConfig: Codable {
            let heatmapGradient: HeatmapGradient?
            let heatNormalizationPeak: Int?
            let fuzzNormalizationPeak: Double?
            let heatPointBaseRadius: Int?
        }
        
        // MARK: - HeatmapGradient
        struct HeatmapGradient: Codable {
            let colors: [Color]?
            let transitionLocations: [Double]?
        }
        
        // MARK: - Color
        struct Color: Codable {
            let red, green, blue, alpha: Double?
        }
        
        // MARK: - TileSetInfo
        struct TileSetInfo: Codable {
            let id: ID?
            let state: String?
            let startTime, lastUpdateTime: Int?
            let poiTileSetInfo: PoiTileSetInfo?
            let heatTileSetInfo: HeatTileSetInfo?
        }
        
        // MARK: - HeatTileSetInfo
        struct HeatTileSetInfo: Codable {
            let heatFromTime, heatToTime, totalHeatmapPoints: Int?
            let heatmapGradient: HeatmapGradient?
            let heatNormalizationPeak: Int?
            let fuzzNormalizationPeak: Double?
            let heatPointBaseRadius: Int?
        }
        
        // MARK: - ID
        struct ID: Codable {
            let type, flavor, epoch: String?
        }
        
        // MARK: - PoiTileSetInfo
        struct PoiTileSetInfo: Codable {
            let poiSizeEquation: PoiSizeEquation?
        }
        
        // MARK: - PoiSizeEquation
        struct PoiSizeEquation: Codable {
            let order: [Int]?
            let stretch: [Double]?
            let coefficient: [Int]?
            let intercept: Int?
        }
        
        
        let semaphore = DispatchSemaphore (value: 0)
        var returner = 0
        
        let parameters = "{}"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://ms.sc-jpl.com/web/getLatestTileSet")!,timeoutInterval: Double.infinity)
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        request.addValue("https://map.snapchat.com", forHTTPHeaderField: "Origin")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //formulate the url field refferer from lat, lon and zoom.
        
        let requester = "https://map.snapchat.com/@\(lat),\(lon),\(zoom)z"
        //print(requester)
        
        request.addValue(requester, forHTTPHeaderField: "Referer")
        
        //Replaced this line of code from postman canary with the line above that is generaed from the arguments parsed from the file
        //request.addValue("https://map.snapchat.com/@-34.871315,138.555850,9.91z", forHTTPHeaderField: "Referer")
        request.addValue("2", forHTTPHeaderField: "Content-Length")
        request.addValue("ms.sc-jpl.com", forHTTPHeaderField: "Host")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 13_0_1) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15", forHTTPHeaderField: "User-Agent")
        request.addValue("en-US", forHTTPHeaderField: "Accept-Language")
        request.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let welcome = try? JSONDecoder().decode(Welcome.self, from: data)
            //print(String(data: data, encoding: .utf8)!)
            //print("testing")
            //print("...")
            if let tileEpoch = welcome?.tileSetInfos?[1].id?.epoch {
                
                //print(tileEpoch)
                returner = Int(tileEpoch)!
                
            } else {
                print("\(String(describing: welcome.self)) does not have epoch")
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return returner
    }
    
    func getPlaylist(lat: String = "-34.939798", lon: String = "138.611250", zoom: String = "6.5", epoch: Int, flag:String? = nil) -> ([String], [String:String] ){
        
        //Insert JSON SCHEMA here
        
        // This file was generated from JSON Schema using quicktype, do not modify it directly.
        // To parse the JSON, add this file to your project and do:
        //
        //   let sc20221209 = try? newJSONDecoder().decode(Sc20221209.self, from: jsonData)

        // MARK: - Sc20221209
        struct Sc20221209: Codable {
            let manifest: Manifest?
        }

        // MARK: - Manifest
        struct Manifest: Codable {
            let elements: [Element]?
        }

        // MARK: - Element
        struct Element: Codable {
            let id: String?
            let duration: Double?
            let timestamp: String?
            let snapInfo: SnapInfo?
        }

        // MARK: - SnapInfo
        struct SnapInfo: Codable {
            let snapMediaType: SnapMediaType?
            let title: Title?
            let streamingMediaInfo: StreamingMediaInfo?
            let streamingThumbnailInfo: StreamingThumbnailInfo?
            let overlayText: String?
        }

        enum SnapMediaType: String, Codable {
            case snapMediaTypeVideo = "SNAP_MEDIA_TYPE_VIDEO"
            case snapMediaTypeVideoNoSound = "SNAP_MEDIA_TYPE_VIDEO_NO_SOUND"
        }

        // MARK: - StreamingMediaInfo
        struct StreamingMediaInfo: Codable {
            let mediaURL: String?

            enum CodingKeys: String, CodingKey {
                case mediaURL = "mediaUrl"
            }
        }

        // MARK: - StreamingThumbnailInfo
        struct StreamingThumbnailInfo: Codable {
            let infos: [Info]?
        }

        // MARK: - Info
        struct Info: Codable {
            let thumbnailType: ThumbnailType?
            let thumbnailURL: String?

            enum CodingKeys: String, CodingKey {
                case thumbnailType
                case thumbnailURL = "thumbnailUrl"
            }
        }

        enum ThumbnailType: String, Codable {
            case imageThumbnailType = "IMAGE_THUMBNAIL_TYPE"
        }

        // MARK: - Title
        struct Title: Codable {
            let strings: [StringElement]?
            let fallback: String?
        }

        // MARK: - StringElement
        struct StringElement: Codable {
            let locale: Locale?
            let text: String?
        }

        enum Locale: String, Codable {
            case ar = "ar"
            case de = "de"
            case en = "en"
            case es = "es"
            case fr = "fr"
            case ja = "ja"
            case ko = "ko"
            case pt = "pt"
            case ru = "ru"
            case zh = "zh"
        }


        
        
        
        var returnerA:[String] = []
        var returnerB:[String] = []
        
        //calculate radiusmeters
        
        var parameters:String = ""
        
        if Double(lat) != nil{
            if Double(lon) != nil{
                if let zoomer = Double(zoom){
                    //let a = magicLat*latitude
                    //let b = magicLon*long
                    //let c = magicZoom*zoomer
                    //let radius =  a+b+c
                    let radius = 2E+06*exp(-0.625*zoomer)
                    //print("DEBUG:\(radius) @ zoom of: \(zoom)")
                    parameters = "{\"requestGeoPoint\":{\"lat\":\(lat),\"lon\":\(lon)},\"zoomLevel\":\(zoom),\"tileSetId\":{\"flavor\":\"default\",\"epoch\":\(epoch),\"type\":1},\"radiusMeters\":\(radius),\"maximumFuzzRadius\":0}\n\n"
                }
            }
        }
        else{
            parameters = "{\"requestGeoPoint\":{\"lat\":-34.85812245203570,\"lon\":138.55767711250678},\"zoomLevel\":8.5,\"tileSetId\":{\"flavor\":\"default\",\"epoch\":1589175424000,\"type\":1},\"radiusMeters\":12583.83852123980,\"maximumFuzzRadius\":0}\n\n"
        }
        
        
        
        let semaphore = DispatchSemaphore (value: 0)
        
        //let parameters = "{\"requestGeoPoint\":{\"lat\":-34.85812245203570,\"lon\":138.55767711250678},\"zoomLevel\":8.5,\"tileSetId\":{\"flavor\":\"default\",\"epoch\":1589175424000,\"type\":1},\"radiusMeters\":12583.83852123980,\"maximumFuzzRadius\":0}\n\n"
        let postData = parameters.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: "https://ms.sc-jpl.com/web/getPlaylist")!,timeoutInterval: Double.infinity)
        request.addValue("*/*", forHTTPHeaderField: "Accept")
        request.addValue("https://map.snapchat.com", forHTTPHeaderField: "Origin")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //formulate the url field refferer from lat, lon and zoom.
        
        let requester = "https://map.snapchat.com/@\(lat),\(lon),\(zoom)z"
        print(requester)
        
        request.addValue(requester, forHTTPHeaderField: "Referer")
        
        //Replaced this line of code from postman canary with the line above that is generaed from the arguments parsed from the file
        //request.addValue("https://map.snapchat.com/@-34.871315,138.555850,9.91z", forHTTPHeaderField: "Referer")
        request.addValue("208", forHTTPHeaderField: "Content-Length")
        request.addValue("ms.sc-jpl.com", forHTTPHeaderField: "Host")
        request.addValue("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1 Safari/605.1.15", forHTTPHeaderField: "User-Agent")
        request.addValue("en-US", forHTTPHeaderField: "Accept-Language")
        request.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        request.addValue("keep-alive", forHTTPHeaderField: "Connection")
        request.addValue("text/plain", forHTTPHeaderField: "Content-Type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            
            let Sc20221209 = try? JSONDecoder().decode(Sc20221209.self, from: data)
            print(String(data: data, encoding: .utf8)!)
            print("testing")
            print("...")
            
            
            if let numberOfSnaps = Sc20221209?.manifest?.elements?.count {
                print("Value of numberOfSnaps is \(numberOfSnaps)" )
                
                if (flag=="checker"){
                    print("")
                    print("There are \(numberOfSnaps) snaps in the region selected.")
                    print("")
                }
                let snapContents = Sc20221209?.manifest?.elements
                print("\(String(describing: snapContents))")
                print("")
                print("Begining Print of Snap INFO for Log:")
                print("")
                for n in 0...numberOfSnaps-1{
                    
                    print("Snap number: \(n+1)")
                    //SNAP_MEDIA_TYPE is VIDEO or VIDEONOSOUND
                    if let mediaList:String = (snapContents?[n].snapInfo?.streamingMediaInfo?.mediaURL) {
                        print("URL: \(mediaList)")
                        returnerA.append("\(mediaList)/media.mp4")
                        if let timeStamp:String = Sc20221209?.manifest?.elements![n].timestamp{
                            print("TimeStamp: \(timeStamp)")
                            let doubleTime = Double(timeStamp) ?? 0
                            let humanTime = NSDate(timeIntervalSince1970: (doubleTime/1000))
                            print("Human Time: \(humanTime)")
                            returnerB.append(timeStamp)
                        }else{
                            returnerB.append("0")
                        }
                        if let duration:Double = Sc20221209?.manifest?.elements![n].duration {
                            print("Snap Duration: \(duration) seconds")
                        }
                        
                        if let id:String = Sc20221209?.manifest?.elements![n].id {
                            print("Snap ID: \(id)")
                        }
                        
                        if let overlay:String = Sc20221209?.manifest?.elements![n].snapInfo?.overlayText {
                            print("OverlayText: \(overlay)")
                        }
                        
                        if let snapMediaType = Sc20221209?.manifest?.elements![n].snapInfo?.snapMediaType {
                            print("Snap Media Type: \(snapMediaType)")
                        } else {
                            print("Snap Media Type: Image Only")
                        }
                        
                        if let location:String = Sc20221209?.manifest?.elements![n].snapInfo?.title?.fallback {
                            print("Location: \(location)")
                        }
                        
                        //print("DEBUG:\(n) \(mediaList)")
                        
                        //SNAP MEDIA TYPE HAS NO TYPE == IMAGE ONLY
                    } else if let mediaList:String = Sc20221209?.manifest?.elements![n].snapInfo?.streamingMediaInfo?.mediaURL {
                        print("URL: \(mediaList)")
                        returnerA.append("\(mediaList)")
                        if let timeStamp:String = Sc20221209?.manifest?.elements![n].timestamp{
                            print("TimeStamp: \(timeStamp)")
                            let doubleTime = Double(timeStamp) ?? 0
                            let humanTime = NSDate(timeIntervalSince1970: (doubleTime/1000))
                            print("Human Time: \(humanTime)")
                            returnerB.append(timeStamp)
                        }else{
                            returnerB.append("0")
                        }
                        if let duration:Double = Sc20221209?.manifest?.elements![n].duration {
                            print("Snap Duration: \(duration) seconds")
                        }
                        
                        if let id:String = Sc20221209?.manifest?.elements![n].id {
                            print("Snap ID: \(id)")
                        }
                        
                        if let overlay:String = Sc20221209?.manifest?.elements![n].snapInfo?.overlayText {
                            print("OverlayText: \(overlay)")
                        }
                        
                        if let snapMediaType = Sc20221209?.manifest?.elements![n].snapInfo?.snapMediaType {
                            print("Snap Media Type: \(snapMediaType)")
                        } else {
                            print("Snap Media Type: Image Only")
                        }
                        
                        if let location:String = Sc20221209?.manifest?.elements![n].snapInfo?.title?.fallback {
                            print("Location: \(location)")
                        }
                        //print("DEBUG:\(n) \(mediaList)")
                    }
                    print("")
                    print("*********")
                    print("")
                }
            }
            else {
                print("There are no snaps in that region able to be downloaded at this time.")
                print("")
                print("This could be an error in clock synchronisation with the server. Please run 3x to be sure.")
                print("")
                print("*********")
                print("")
            }
            
            
            
            // print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        //print("DEBUG: \(returner)")
        let returner = Dictionary(uniqueKeysWithValues: zip(returnerA,returnerB))
        return (returnerA, returner)
    }
    
    
}
