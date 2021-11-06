//
//  SC-MapDownloader.swift
//  SC-MapDownloader
//
//  Created by Richard Matthews on 11/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//

import Foundation

enum OptionType: String {
    //These are the individual keys entered into the CLT
    case downloadmedia = "d"
    case check = "c"
    case help = "h"
    case quit = "q"
    case license = "l"
    case publications = "p"
    case support = "s"
    case report = "r"
    case devlog = "log"
    case unknown
    
    
    init(value: String) {
        switch value {
        case "d": self = .downloadmedia
        case "c": self = .check
        case "h": self = .help
        case "q": self = .quit
        case "l": self = .license
        case "p": self = .publications
        case "s": self = .support
        case "r": self = .report
        case "log": self = .devlog
        default: self = .unknown
        }
    }
}


class Scraper {
    
    let consoleIO = ConsoleIO()
    
    let downloader = Downloader()
    let check = Check()
    
    func staticMode() {
        
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        let (option, value) = getOption(argument.substring(from: argument.index(argument.startIndex, offsetBy: 1)))
        
        switch option {
            
        case .downloadmedia:
            if argCount != 5 {
                if argCount > 6 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                let lat = CommandLine.arguments[2]
                let long = CommandLine.arguments[3]
                let zoom = CommandLine.arguments[4]
                downloader.SCMapDownloader(lat:lat,long:long,zoom:zoom)
            }
            //Check depreciated for static mode from now on 2021/11/05
        case .check:
            if argCount != 5 {
                if argCount > 6 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                let lat = CommandLine.arguments[2]
                let long = CommandLine.arguments[3]
                let zoom = CommandLine.arguments[4]
                check.checker(lat:lat,long:long,zoom:zoom,consoleIO:consoleIO)
            }
            
            //Check depreciated for static mode from now on 2021/11/05
            
        case .help:
            consoleIO.printUsage()
            
        case .unknown, .quit, .report:
            //7
            consoleIO.writeMessage("Unknown option \(value)")
            consoleIO.printUsage()
            
        case .license:
            consoleIO.licence()
        
        case .publications:
            consoleIO.references()
            
        case .support:
            consoleIO.support()
        
        case .devlog:
            consoleIO.devhist()
        }
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
 
//***************************
// Useful program starts here, above is static mode
//***************************

    
    func interactiveMode() {
        
        consoleIO.logo()
        consoleIO.writeMessage("\n")
        consoleIO.references()
        
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.options()
            
            let (option, value) = getOption(consoleIO.getInput())
            
            
            switch option {
  
            case .check:
                //implement pasting of URL here to get Lat, Long and zoom
                consoleIO.writeMessage("Type the latitude to 6 decimal places or press enter for default:")
                var lat = consoleIO.getInput()
                if (lat == ""){
                    lat = "-34.939798"
                    consoleIO.writeMessage("\n >>> Using default -34.939798")
                }
                consoleIO.writeMessage("\nType the longitude to 6 decimal places or press enter for default:")
                var long = consoleIO.getInput()
                if (long == ""){
                    long = "138.611250"
                    consoleIO.writeMessage("\n >>> Using default 138.611250")
                }
                consoleIO.writeMessage("\nSpecify the zoom to 2 decimal places between 2.00 and 16.99 or press enter for default:")
                var zoom = consoleIO.getInput()
                if (zoom == ""){
                    zoom = "6.5"
                    consoleIO.writeMessage("\n >>> Using default 6.5")
                }
                check.checker(lat:lat,long:long,zoom:zoom,consoleIO:consoleIO)
                
                
            case .help:
                consoleIO.printUsage()
                
            case .license:
                consoleIO.licence()
                
            case .publications:
                consoleIO.references()
                
            case .support:
                consoleIO.support()
                
            case .report:
                consoleIO.writeMessage("Report functionality currently disabled.")
                consoleIO.writeMessage("Please create log file manually through shell window:")
                consoleIO.writeMessage("Shell -> Export Text as")
                // prompt user for file name for log file.
                // generate log file for session (save terminal output in full).
                // create SHA56 hash of log file for verification and save in seperate file.
                // Optional - create prefilled affidavit
                // - prompt for user generated inputs
                //  - Name
                
            case .devlog:
                consoleIO.devhist()
            
            case .quit:
                shouldQuit = true
                consoleIO.quiter()
                
            case .unknown, .downloadmedia:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
}


