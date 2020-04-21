./csmith-gen.sh output/test.c
gcc -I $CSMITH_RUNTIME output/test.c -o output/test

# The -D_Float128=double is needed because Tigress is having problems
# with _Float128. It causes an error in mathcalls-helper-functions.h .
# This will probably break anything that actually uses quad-size floats,
# but I'm not sure anything really does...

tigress \
--Environment=x86_64:Linux:Gcc:4.6 \
--Transform=Virtualize \
--Functions=main \
--VirtualizeDispatch=direct \
-I $CSMITH_RUNTIME \
-D_Float128=double \
--out=output/test-obfuscated.c output/test.c
gcc output/test-obfuscated.c -o output/test-obfuscated
