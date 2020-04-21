# Building

## Dependencies 

You'll need Docker installed, as well as `make`

You will need to download Tigress from here:

https://tigress.wtf/download.html

The Dockerfile expects `tigress-3.1-bin.zip` to be in the root of this project's directory

## Building

`make build` will construct an image named `autofuscator:dev`

## Running

`make run` will run a container that generates a random program, as well as an obfuscated version of it, in `./output/`. This will clobber existing output.
