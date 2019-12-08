import os
import re
import argparse

#python3 LocalizationsKeyGeneration.py --input_strings_directory /USER/directory/

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input_strings_directory", type=str)
    #Optional
    parser.add_argument("--output_key_path", type=str)

    args = parser.parse_args()

    cwd = os.getcwd()
    directoryPath = args.input_strings_directory

    listOfFiles = []
    for path, subdir, files in os.walk(directoryPath):
        print(subdir)
        for file in files:
            if file.find(".strings") != -1:
                listOfFiles.append(path + "/" + file)

    regularExp = []
    for filePath in listOfFiles:
        fileStrings = open(filePath, "r+")
        regularExp = set(regularExp + re.findall("\"[\\w+\\W+]?[^=]*\"\\s*?=\\s*?\"[\\w+\\W+]?[^=]*\";", fileStrings.read()))
    
    keysList = []
    for string in regularExp:
        stringSplit = string.split("=")
        key = find_between(stringSplit[0], "\"", "\"")
        #value = find_between(stringSplit[1], "\"", "\"")
        keysList.append("%s" % key)

    keyPath = "" 
    if not args.output_key_path:
        keyPath = "%s/LocalizationKeys.swift" % cwd
    else: 
        keyPath = args.output_key_path

    fileStrings = open(keyPath, "r+")
    fileStrings.truncate(0)

    newString = "import Foundation\n\nenum LocalizationKeys:String {\n"

    for value in keysList:
        newString += ("\t\tcase " + value + "\n")

    newString += "}"
    fileStrings.write(newString)
        
        
    
def find_between( s, first, last ):
    try:
        start = s.index( first ) + len( first )
        end = s.index( last, start )
        return s[start:end]
    except ValueError:
        return ""

if __name__ == "__main__":
    main()