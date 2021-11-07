# Snap-Scraper
![alt text](https://github.com/rhematt/Snap-Scraper/releases/download/v0.5.0-b/icon.png)

## Description

Snap Scraper is an open source intelligence tool which enables users to download media uploaded to Snapchat's Snap Map using a set of latitude and longitiude co-ordinates. This project is in no way affiliated with, authorized, maintained, sponsored or endorsed by Snap inc. or any of its affiliates or subsidiaries. This program is for education, forensic and bug reporting purposes only and is provided without warranty. 

When using this tool please cite the following publication:

1. Richard Matthews, Kieren Lovell, Matthew Sorell, Ghost protocol – Snapchat as a method of surveillance, Forensic Science International: Digital Investigation, Volume 36, Supplement, 2021, 301112, ISSN 2666-2817, https://doi.org/10.1016/j.fsidi.2021.301112.

## Screenshots

<img src ="https://live.staticflickr.com/65535/51659970798_6e65449754_c.jpg" height="300px"></imgsrc>
<img src ="https://live.staticflickr.com/65535/51658934547_b306008bff_c.jpg" height="300px"></imgsrc>
<img src ="https://live.staticflickr.com/65535/51658934662_a399a1c1f0_c.jpg" height="300px"></imgsrc>
<img src ="https://live.staticflickr.com/65535/51658934712_98376e0b4a_c.jpg" height="300px"></imgsrc>
<img src ="https://live.staticflickr.com/65535/51660553014_050c14a390_b.jpg" height="300px"></imgsrc>

## Installation

### MacOS
Download the current linked binary in the most recent release. Using terminal ensure you change permissions to include the executable permission.
    
    chmod 755 SnapScraper

Optionally, a icon.png file is included which can be used to change the icon of the downloaded executable.

### Windows/Linux
At this point in time, SnapScraper only supports MacOS. However, dependancies have been checked and users should be able to complile the code on their own file system without any issues. Ensure Alamofire has been installed.

## Usage

Double click SnapScraper to launch the command line tool. SnapScraper works best when the defaul window size is set to 80x50.

You should be presented with the following window:

![alt text](https://live.staticflickr.com/65535/51659970798_6e65449754_c.jpg)

The current options for use are indicated in the command window. Select to option by pressing the required key(s) on the keyboard and pressing enter. 

### Check

The main option users will select will be the check option to locate snap media on the Snap Map. To select this option type 'c' followed by the enter key.

SnapScraper will then ask you for a set of longitude and lattitude coordinates which can be obtained from map.snapchat.com as discussed in the publication _"Richard Matthews, Kieren Lovell, Matthew Sorell, Ghost protocol – Snapchat as a method of surveillance, Forensic Science International: Digital Investigation, Volume 36, Supplement, 2021, 301112, ISSN 2666-2817, https://doi.org/10.1016/j.fsidi.2021.301112."_. Navigate to map.snapchat.com and note the URL of the location you wish to extract snap media from ie. _https://map.snapchat.com/@24.931153,44.873214,6.04z_. The coordinates to enter into SnapScraper are located in the URL after the @ symbol. The first number is the lattitude, the second the longitude and the final the zoom level. Lattitude and longitude should be entered into SnapScraper to 6 decimal places while zoom should be entered to 2 decimal places.

When each coordinate is entered into the program SnapScraper will then poll Snap Map for snap media at the desired location. When media is located the meta data of the media will be printed to the command window.

![alt text](https://live.staticflickr.com/65535/51658934547_b306008bff_c.jpg)

Users will then be given the option of printing direct links to the media to the command window. Select y to print these links to the command window or n to skip.

Users will then be given the option to save the links to a text file. Select y to save the file n to skip. File will be saved in the users _"Downloads"_ directory in a folder called _"Snapchat"_(macOS users only). The file is titled with the current date, time and coordiates of extraction prefixed with the word _"listing"_.

Finally, users will be asked if they would like to download the media. This is the extraction step with media being saved directly from the URLs indicated in the previous steps. Select y to download, n to skip. Media will be saved in a folder titled with the current date, time and coordinates of extraction within the _"Snapchat"_ folder previously identified above. 

### Log reporting
Currently log reporting has not been implremented in 0.5.0-b. To save a log of the extraction method use the _"export text as"_ function built in to the terminal.

Finalise the extraction process as above and then quit SnapScraper by selecting "q". The terminal session will end but the window will remain open as shown.

![alt text](https://live.staticflickr.com/65535/51658934712_98376e0b4a_c.jpg)

To save a log of activity navigate to _Shell-> Export Text as..._ A save box will open. Navigate to the _Snapchat_ folder within users _Downloads_ folder and find the recent URL listing that has been saved (if used from previous steps). Click on this file and change the save as file name by removing the prefix word _listing_ to _log_. This will save a text file contianing the contents of the terminal window and show all activity that was contducted while SnapScraper was run.

### Other options

SnapScraper has a fully functional menu. Other options include displaying the MIT license, publication information associated with the current release of the tool, information to support the continued development and maintenance and the current development log. To access enter the relevant option keys followed by the enter key.

## Contributing
SnapScraper was born out of a discussion in 2017 while in Tallinn Estonia. In the spirit of that initial collaboration I'd love for you to help bring this project to its full vision. The wiki contains a road map for the codebase including a wishlist of future functionality.

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Dontations

Dontations are appreciated to help support the continued development, maintenance and upkeep of this product.

Dontate using Monero:
41hZLF5Mhh7gDeiTLLws8dXMsi9NpyM6cWUQJoTJNAWkbx4YccDagRMWYED4cyHw481VjYyiEgkEh9mxHR1tJeNy7ce9yNp

Funding goals include:
- Server hosting for a web hosted version of SnapScraper.
- Support for Windows file system.
- Filtering of downloaded media to flag for NSFW content (triage).
- Automated scraping by geofence and time.
- Long term data storage, enabling historical, sociological and other areas of research (Internet Archive, but for Snapmap).

## Credits

### Project Lead 
- Richard Matthews

### Automated Content Moderation Team
- Matthew Sorell
- Sanjana Tanuku
- Siyu Wang
- Liyu Xu

### Acknowledgements
- Ben Agnew - Thanks for the Developer mode discussions during CSRB in 2019!
- Kieren Lovell - Minesweeper extraordinaire.
- Matthew Sorell - Forensics and more.

### Repos used
- Alamofire - https://github.com/Alamofire/Alamofire

### Publications
1. Richard Matthews, Kieren Lovell, Matthew Sorell. "Ghost protocol – Snapchat as a method of surveillance", Forensic Science International: Digital Investigation, Volume 36, Supplement, 2021, 301112, ISSN 2666-2817, https://doi.org/10.1016/j.fsidi.2021.301112.
2. Richard Matthews. "Snapchat Disclosed on HackerOne: CreatorID Leaked from Public Content Posted to SnapMaps", May 7, 2020. Accessed November 06, 2021. https://hackerone.com/reports/867521.

## License
MIT (c) 2020 Dr Richard Matthews

## Disclaimer

This project is in no way affiliated, associated, authorised or endorsed by the education institutions of those indicated in the credits section of this repo. This includes but is not limited to The University of Adelaide, Australia and TalTech (Tallinn University of Technology).

This project is not affiliated, associated, authorized, endorsed by, or in any way officially connected with the application Snapchat, Snap inc. or any of its subsidiaries or its affiliates. The official Snapchat website can be found at http://www.snapchat.com.

The names Snap, Snap Map, and Snapchat as well as related names, marks, emblems and images are registered trademarks of their respective owners.

All names, logos, images and brands are property of their respective owners.

This tool is provided as is for instructional purposes only without any warranty. Any use is not authorised or implied. 
