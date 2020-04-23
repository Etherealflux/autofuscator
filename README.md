# Building

## Dependencies 

You'll need Docker installed, as well as `make`

You will need to download Tigress from here:

https://tigress.wtf/download.html

The Dockerfile expects `tigress-3.1-bin.zip` to be in the root of this project's directory

## Building

`make build` will construct an image named `autofuscator:dev`

## Running

Currently, four files are written to `/output`:

- `test.c`, the unbofuscated source
- `test`, the unobfuscated binary
- `test-obfuscated.c`, the obfuscated source
- `test-obfuscated`, the obfuscated binary

`make run-hello` will read a basic hello-world program, `/sample-programs/hello-world.c`, and generate an obfuscated version.
`make run-gen` will use CSmith to generate a random program.
