#!/usr/bin/env python3


def printUsage():
	print('\n********************************************************************************')
	#print('\nHELP:')

	#Program Description
	print('This program downloads any public snaps uploaded to the Snap Map from a set of \nlatitude, longitude and zoom co-ordinates. These co-ordinates are of the \nform 123.456789 123.456789 1.23. Zoom ranges from 2.00 - 16.99 where 2.00 is a \ncircle of radius 1,170km and 16.99 is a circle of radius 42m.')

	#The legend
	print('Usage: ')
	print('[-c Check] lattitude longitude zoom')
	print('[-h Help]')
	print('[-q Quit]')

	print('Report bugs to: bugs@drmatthews.science')
	print('\n********************************************************************************')

#This function takes in the user input and chooses which option they have selected.
def userInput():
	value = input('')
	return value

def finish():
	print("\nThank you for using SnapScraper. All of the the snaps from the location specified have been downloaded into you current directory->snapchatTemps.") 
	print("If you would like to Scrape another location, please run the script again!")
