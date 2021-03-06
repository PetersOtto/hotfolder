# Info
# In order to use this "function" need to set convert_pictures for the FUNCTION variabel in line 5 of the hotfolder.sh file
# You need to have ImageMagick installed on your system. (http://www.imagemagick.org/)

# choose one of the 200+ formats ImageMagick supports (http://www.imagemagick.org/script/formats.php)
OUTPUTFORMAT=jpg
# choose desired width of the image (in pixel) if you don't want to resize or only resize height leave blank (usefull for panorama's)
IMAGEWIDTH=2200
# choose desired height of the image (in pixel) if you don't want to resize or only resize width leave blank
IMAGEHEIGHT=2200


# ------------------------ code ---------------------------------------------


if hash mogrify 2>/dev/null; then
	# generate date and time variabel for the output folders
	NOW=$(date +"%Y-%m-%d %H:%M")

	# the ImageMagick convert code
	mogrify -verbose -format "$OUTPUTFORMAT" -resize ''$IMAGEWIDTH'x'$IMAGEHEIGHT'>' *

	# make a new dir for the files to be safed in
	mkdir ../out/Conversion-"$NOW"
	# move all the files of your choosen output filetype into that folder
	mv *."$OUTPUTFORMAT" ../out/Conversion-"$NOW"/
	# delete the rest (former files is imageformat was changed) // cleanup the process folder
	rm *
	
else
	echo ERROR: Could not find ImageMagick >&2
	echo ImageMagick needs to installed and in standardpath for convert_pictures to work >&2
fi



