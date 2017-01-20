#!/bin/bash


########################################################################
# Declarations
########################################################################
declare Fortune

#create tempfile (for unsplash image)
#create tempfile2  (for text image )
TempDir=$(mktemp -d)

################################################################################
# Wherein things get told to happen
################################################################################
main() {
	curl https://unsplash.it/1024/512/?random -o $TempDir/unsplash.jpg
	convert $TempDir/unsplash.jpg -blur 0x3 $TempDir/unsplash_blur.jpg
	Fortune=$(fortune twitter)
	convert -background none -fill white -stroke black -strokewidth 3 -gravity Center -font Interstate -size 1024x512 \
          caption:"$Fortune" \
          $TempDir/TextImage.png

composite -gravity center $TempDir/TextImage.png $TempDir/unsplash_blur.jpg output.jpg

	exit 0
}

main
