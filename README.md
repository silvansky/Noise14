# Noise 14 Generator

## Dependencies

Designed for `*nix` systems. Tested on macOS only.

This code uses `gcc` compiler, `sox` utility to generate sound and `ffmpeg` to generate video.

## Usage

Just call `./generate_video.sh`.

## Results

See this youtube video: https://youtu.be/8aTE2qBm_YM

## Hacking

Some points of modification in `Noise14.c`:

`12` stands for circle size.

`0.5` is base frequency.

`1000000.` modifies time when real noise comes in.

`wave1(t)`, `wave2(t)`, `wave3(t)` and `wave4(t)` are harmonics on base frequency. Feel free to try them out!

Some points of modification in `generate_video.sh`:

`SOX_BITRATE` is resulting audio bitrate. Set to `8k` to get more 8-bit sound.

`showspectrum` is described here: https://ffmpeg.org/ffmpeg-filters.html#showspectrum-1

`avectorscope` is described here: https://ffmpeg.org/ffmpeg-filters.html#avectorscope
