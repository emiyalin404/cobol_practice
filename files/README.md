
##### isCOBOL release 2023 R2 build#1105.15-20240219-37724 ######
##### Copyright (c) 2005 - 2023 Veryant. ######

----------
**This sample shows data access against a specific data system.**

**If no iscobol.properties with the iscobol.file.index property exists**
**then it runs by default against the JISAM data system.**
 
**To setup access to a different data system please follow the documentation about**
**Data Access Guides to understand what runtime properties and special setup**
**is required for every data system supported by isCOBOL.**

----------
 - 1 Import the "files" project from 
     [isCOBOL IDE installation folder]\sample\data-access\files

 - 2 Compile the programs in the IDE: Right-click the "files" project name 
     and select the menu option Build project

 - 3 If Isam files are in c-tree format, change the iscobol.properties file located in 
     the "resources" folder of the project as described within the file

 - 4 Run the INDEXED program 
     (either using the Run Menu option or the Run push-button)

 - 5 Run the SEQUENTIAL program 
     (either using the Run Menu option or the Run push-button)

 - 6 Run the LINESEQUENTIAL program 
     (either using the Run Menu option or the Run push-button)

 - 7 Run the RELATIVE program 
    (either using the Run Menu option or the Run push-button)

 - 8 Run the SORT program 
    (either using the Run Menu option or the Run push-button)

 - 9 Run the XML program 
    (either using the Run Menu option or the Run push-button)

 **NOTE:**

    To run this demo in debug mode:
    1 Set the IDE's current compiler mode to "Debug mode" and recompile.
    2 Debug the choosed program program 
      (either using the Debug Menu option or the Debug push-button)
