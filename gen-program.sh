./csmith-gen.sh output/test.c
gcc -I $CSMITH_RUNTIME output/test.c -o output/test
tigress \
--Environment=x86_64:Linux:Gcc:4.6 \
--Transform=Virtualize \
--Functions=main \
--VirtualizeDispatch=direct \
-I $CSMITH_RUNTIME \
-D_Float128=double \
--out=output/test-obfuscated.c output/test.c
gcc output/test-obfuscated.c -o output/test-obfuscated
