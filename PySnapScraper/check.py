#!/usr/bin/env python3
from datetime import datetime
import console
import ApiCalls
import Downloader 
import sys

class checking:
	def save_console(self, latitude, longitude, zoom):
		print("")
		print("Would you like to save the terminal output to a text file? y/n")
		saveLinks = console.userInput()

		print("Would you like to print the links? y/n")
		printLinks = console.userInput()

		if saveLinks and printLinks == "y" or saveLinks and printLinks == "Y" or saveLinks and printLinks == "yes":
			dateTime = datetime.now()
			filename = "SnapScraperConsole-" + str(dateTime) + '.txt'

			with open(filename, 'w') as f:
				sys.stdout = f

				def intializer(latitude, longitude, zoom):
					epoch = ApiCalls.SCApiCalls.getEpoch(latitude, longitude, zoom)
					(mediaURLS, mediaDictionary) = ApiCalls.SCApiCalls.getPlaylist(latitude, longitude, zoom, epoch, True)

					checker(longitude, latitude, mediaURLS, mediaDictionary)

					Downloader.Downloader.downloadFiles(latitude, longitude, mediaURLS, mediaDictionary)
				
				def checker(longitude, latitude, urlArray, urlDictionary): 	
					print("")
					print("Would you like to print the links? y/n")
					printLinks = 'y'

					if len(urlArray) == 0:
						print("No Media URLs exist.")
					elif printLinks == "y" or printLinks == "Y" or printLinks == "yes":
						print("")
						for item in urlArray:
							print(item)

				intializer(latitude, longitude, zoom)

				console.finish()
				#sys.stdout.close()

		elif (saveLinks == "y" or saveLinks == "Y" or saveLinks == "yes") and (printLinks == 'n' or printLinks == "N" or printLinks == "no"):
			dateTime = datetime.now()
			filename = "SnapScraperConsole-" + str(dateTime) + '.txt'

			with open(filename, 'w') as f:
				sys.stdout = f

				def intializer(latitude, longitude, zoom):
					epoch = ApiCalls.SCApiCalls.getEpoch(latitude, longitude, zoom)
					(mediaURLS, mediaDictionary) = ApiCalls.SCApiCalls.getPlaylist(latitude, longitude, zoom, epoch, True)
					
					Downloader.Downloader.downloadFiles(latitude, longitude, mediaURLS, mediaDictionary)

				intializer(latitude, longitude, zoom)

				console.finish()
				#sys.stdout.close()

		else:
			def intializer(latitude, longitude, zoom):
					epoch = ApiCalls.SCApiCalls.getEpoch(latitude, longitude, zoom)
					(mediaURLS, mediaDictionary) = ApiCalls.SCApiCalls.getPlaylist(latitude, longitude, zoom, epoch, True)

					checker(longitude, latitude, mediaURLS, mediaDictionary)

					Downloader.Downloader.downloadFiles(latitude, longitude, mediaURLS, mediaDictionary)

				
			def checker(longitude, latitude, urlArray, urlDictionary): 
				print("")
				printLinks = 'y'

				if len(urlArray) == 0:
					print("No Media URLs exist.")
				elif printLinks == "y" or printLinks == "Y" or printLinks == "yes":
					print("")
					for item in urlArray:
						print(item)

			intializer(latitude, longitude, zoom)
			console.finish()


	#sys.stdout.close()		


# choice = checking()
# choice.save_console(-34.92220775250722, 138.60374304787342, 14.743706116624152)

#intializer(-34.92220775250722, 138.60374304787342, 14.743706116624152)

#https://stackabuse.com/writing-to-a-file-with-pythons-print-function/