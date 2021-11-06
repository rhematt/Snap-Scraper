//
//  ConsoleIO.swift
//  SC-MapDownloader
//
//  Created by Richard Matthews on 11/5/20.
//  Copyright © 2020 Richard Matthews. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    
    func getInput() -> String {
        
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    func clearScreen(){
        writeMessage("\u{001B}[2J")
    }
    
    func lineBreak(){
        writeMessage("\n********************************************************************************\n")
    }
    
    func versionInfo(){
        lineBreak()
        writeMessage("SNAP SCRAPER")
        writeMessage("Version 0.5b")
        writeMessage("Last updated 2021:11:05")
    }
    
    func logo(){
        writeMessage("--------------------------------------------------------------------------------")
        writeMessage("SNAP SCRAPER--------------------------------------------------------------------")
        writeMessage("Version 0.5b------------------@@@&@@@@@@@@@@@&&---------------------------------")
        writeMessage("Last updated 2021:11:05-----&@@(          ,%%%%%%%%%%%--------------------------")
        writeMessage("--------------------------@@.          .%%(........../%%&-----------------------")
        writeMessage("-----------------------@&@.           *%#............../%%----------------------")
        writeMessage("----------------------@@%        OO   %#................(%&---------------------")
        writeMessage("---------------------@&@.       OOOO  ##................(%&---------------------")
        writeMessage("---------------------@&@        OOOO  *%#.............,(%%----------------------")
        writeMessage("---------------------@&@         OO     %%#(.........(%%------------------------")
        writeMessage("---------------------@&@.                 ,#%%%%%%%%#*.%&-----------------------")
        writeMessage("----------------&@@&@@&@,                              &&&----------------------")
        writeMessage("-------------@&@,  .,**.                                ,*,.   -----------------")
        writeMessage("---------------@&@@&*                                     ,#@@------------------")
        writeMessage("--------------------@&@(                               .@&@@@@@-----------------")
        writeMessage("----------------------@(                               ,@@@@@-------------------")
        writeMessage("-------------------@&@*                                 .@@---------------------")
        writeMessage("-------------------@%                                     *@&-------------------")
        writeMessage("----------------@@(                                         ,@@-----------------")
        writeMessage("----------@%&@@/                                               ,&@@@@-----------")
        writeMessage("--------@@.                                                          %@---------")
        writeMessage("----------@@@@@@%/                                           ,#&@@@@@-----------")
        writeMessage("-----------------@#                                         ,@------------------")
        writeMessage("-----------------@&&&@@@@@@@@%,                  (@@&@@@@@@&&@------------------")
        writeMessage("-------------------------------@@#     RM    *&@&@@-----------------------------")
        writeMessage("--------------------------------------------------------------------------------")
    }
    
    func options(){
        lineBreak()
        writeMessage("Type:")
        writeMessage(" 'c' to check for Snap media.")
        writeMessage(" 'l' for license.")
        writeMessage(" 'p' for publication information.")
        writeMessage(" 's' to support the project.")
        writeMessage(" 'r' to generate report.")
        writeMessage(" 'h' for help.")
        writeMessage(" 'log' for development log.")
        writeMessage(" 'q' to quit.")
    }
    
    func printUsage() {
        lineBreak()
        writeMessage("HELP")
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        //Description of what the app does
        writeMessage("Snap Scraper downloads any public snaps uploaded to the Snap Map from a set of \nlatitude, longitude  and zoom co-ordinates. These co-ordinates are of the \nform 123.456789 123.456789 1.23. Zoom ranges from 2.00 - 16.99 where 2.00 is a \ncircle of radius 1,170km and 16.99 is a circle of radius 42m.")
       
        //Usage Syntax
        writeMessage("\n\nUsage:")
        
        writeMessage("\n   Command line options to run in static mode:")
        writeMessage("   \(executableName) [-d download] lattitude longitude zoom")
        writeMessage("   \(executableName) [-h help]")
        
        writeMessage("\n   Run in interactive mode to access the following methods:")
        writeMessage(" 'c' to check for Snap media.")
        writeMessage(" 'l' to display the MIT license.")
        writeMessage(" 'p' for the publication information to reference use of this program.")
        writeMessage(" 's' to support the project through Monero.")
        writeMessage(" 'h' for help (this information).")
        writeMessage(" 'q' to quit.")
        writeMessage("\n\n********************************************************************************\n\n")
        writeMessage("Report bugs to: bugs@drmatthews.science Re: Snap Scraper")
        writeMessage("\n\n********************************************************************************\n\n")
   
    }
    
    func licence() {
        lineBreak()
        writeMessage("MIT LICENSE")
        writeMessage("Copyright (c) 2020- Dr Richard MATTHEWS")
        writeMessage("Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:")
        writeMessage("[1] The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.")
        writeMessage("[2] THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHERLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.")
        writeMessage("[3] This project is in no way affiliated with, authorized, maintained, sponsored or endorsed by Snap inc or any of its affiliates or subsidiaries.")
        writeMessage("[4] Reference is made to those works found in the publications option of this program.")
        writeMessage("[5] This program is for education, forensic and bug reporting purposes only and is provided without warranty for this purpose. ")
    }
    
    func support() {
        lineBreak()
        writeMessage("SUPPORT INFORMATION")
        writeMessage("We need your support to continue development and maintain.")
        writeMessage("Dontate using Monero:")
        writeMessage("41hZLF5Mhh7gDeiTLLws8dXMsi9NpyM6cWUQJoTJNAWkbx4YccDagRMWYED4cyHw481VjYyiEgkEh9mxHR1tJeNy7ce9yNp")
    }
    
    func references() {
        lineBreak()
        writeMessage("PUBLICATIONS")
        writeMessage("To reference this work please cite the following publications:")
        writeMessage("[1] Richard Matthews, Kieren Lovell, Matthew Sorell, Ghost protocol – Snapchat as a method of surveillance, Forensic Science International: Digital Investigation, Volume 36, Supplement, 2021, 301112, ISSN 2666-2817, https://doi.org/10.1016/j.fsidi.2021.301112.")
    }
    
    func devhist() {
        lineBreak()
        writeMessage("DEVELOPMENT LOG")
        writeMessage("November 05 2021")
        writeMessage("Version 0.5b")
        writeMessage(" - Improved graphical terminal interface.")
        writeMessage(" - added support for license, publication, support and report options.")
        writeMessage(" - depreciated download option.")
        writeMessage(" - created development log.")
        
    }
    
    func quiter(){
        lineBreak()
        writeMessage("Thank you for using:")
        logo()
        support()
        lineBreak()
    }
}


