image_size() {
  for f in $*
  do
    identify "$f" | cut -d ' ' -f 3
  done
}

# crop transparent borders from image: convert -trim +repage in.png out.png

# extend image and center to a size
# src, size, dest
center-image() {
  if [ $# -lt 3 ]
  then
    echo 'Usage: center-image path.png 320x240 output.png'
    return
  fi
  # -trim opcional para remover bordas transparentes
  convert $1 -trim -resize $2 -gravity center -background transparent -extent $2 +repage $3
  #convert $1 -gravity center -background transparent -extent $2 $3
}

# sox file.mp3 trim 0 05:59
trim-silence() {
  sox $1 $2 silence 1 0.1 1% reverse silence 1 0.1 1% reverse
}
