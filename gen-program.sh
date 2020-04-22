rm output/test.c
./sources/$1 $(echo $2) output/test.c

# Makes sure that Tigress has what it needs for things like
# entropy-based opaque predicates

mv output/test.c output/test.c.tmp
echo -e "#include <time.h>\n#include <pthread.h>\n\n" > output/test.c
cat output/test.c.tmp >> output/test.c
rm output/test.c.tmp


gcc -w -I $CSMITH_RUNTIME -O0 output/test.c -o output/test

# The -D_Float128=double is needed because Tigress is having problems
# with _Float128. It causes an error in mathcalls-helper-functions.h .
# This will probably break anything that actually uses quad-size floats,
# but I'm not sure anything really does...

./tigress-configs/$3.sh output/test.c output/test-obfuscated.c $(./pickers/$4 output/test $5)
gcc -w output/test-obfuscated.c -o output/test-obfuscated

chown $ORIG_UID:$ORIG_GID output/*

echo `ls -la output`
