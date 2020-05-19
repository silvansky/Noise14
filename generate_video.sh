#!/bin/sh

FILE="Noise14"
SRC="${FILE}.c"
SOUND="${FILE}.wav"
VIDEO="${FILE}.mov"
TIMEOUT=400

SOX_BITRATE="44100"
SOX_CHANNELS=2
SOX_BITS=16
SOX_OPTS="-b ${SOX_BITS} -r ${SOX_BITRATE} -t raw -c ${SOX_CHANNELS} -e signed-integer -v 0.3"

echo "Compiling ${SRC}..."

gcc -w -o "${FILE}" "${SRC}"

echo "Recording sound to ${SOUND}..."

./"${FILE}" | sox ${SOX_OPTS}  - "${SOUND}" trim 0 0:$TIMEOUT

echo "Generating video to ${VIDEO}..."

ffmpeg -y -i "${SOUND}" -filter_complex "
[0:a]showspectrum=s=1280x720:mode=separate:win_func=hann:color=fiery:slide=scroll:legend=0:scale=sqrt:saturation=5:gain=2:fscale=lin,format=yuv420p[v1];
[0:a]avectorscope=draw=line:s=1280x720:scale=log:zoom=1.5[v2];
[v1][v2]overlay[v]
" -map "[v]" -map 0:a -b:v 700k -b:a 360k "${VIDEO}"

echo "Done!"
