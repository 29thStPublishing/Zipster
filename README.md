# reference
this app is a ziparchive (http://code.google.com/p/ziparchive/wiki/PageName) proof of concept.  it's packaged with a .zip file, then it unzips it and shows an image from the zipped directory. (i already know the file names so I cheat -- i'm just trying to unzip something successfully.)

# things i did to a new project to get zipster to work

0. Started a new project with one view

1. Added the ZipArchive files

2. added libz.1.1.3.dylib framework

3. added things to the xib, followed the sample code for ziparchive in viewDidLoad, loaded the img file into the xib, and, voila, a rapping lady flipping the bird!