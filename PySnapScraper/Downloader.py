#!/usr/bin/env python3

import console
import ApiCalls
from datetime import datetime
import os
import requests
import urllib.request
import sys

class Downloader:
    def SCDownloader(self, latitude, longitude, zoom):
        epoch = ApiCalls.SCApiCalls.getEpoch(latitude, longitude, zoom)
        (mediaURLS, mediaDictionary) = ApiCalls.SCApiCalls.getPlaylist(latitude, longitude, zoom, epoch, True)
        Downloader.downloadFiles(latitude, longitude, mediaURLS, mediaDictionary)

    def downloadFiles(latitude, longitude, urlArray, urlDictionary):
        dateTime = datetime.now()

        urlArray = urlArray
        urlDictionary = urlDictionary

        urlLen = (len(urlArray))
        lenDict = (len(urlDictionary))
        directory = "snapchatTemps"

        if urlLen == lenDict:
            if not os.path.exists(directory):
                os.makedirs(directory)
                os.chdir(directory)
            elif os.path.exists(directory):
                os.chdir(directory)

        if urlLen != 0:
            s3Url = urlArray.pop()

            split = s3Url.split('/')

            if split[5] == "media.mp4":
                timestamp = urlDictionary[s3Url]
                filename = ("Snapchat:" + str(dateTime) + "-@lat" + str(latitude) + "-@lon" + str(longitude) + str(timestamp) + str(split[3]) + ".mp4")
                urllib.request.urlretrieve(s3Url, filename)
            else:
                timestamp = urlDictionary[s3Url]
                filename = ("Snapchat:" + str(dateTime) + "-@lat" + str(latitude) + "-@lon" + str(longitude) + str(timestamp) + str(split[3]) + ".jpeg")
                urllib.request.urlretrieve(s3Url, filename)

            Downloader.downloadFiles(latitude, longitude, urlArray, urlDictionary)

    # def downloadConsole(value):
    #     dateTime = datetime.now()

    #     if value == True:
    #         with open("Snapchat:" + str(dateTime)) as f:
    #             sys.stdout = f
    #             sys.stdout = original_stdout



# choice = Downloader()
# choice.SCMapDownloader(-34.92213325074112, 138.60354497409344, 14.155615560199017)
