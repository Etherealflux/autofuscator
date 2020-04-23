i=0
iterations=$6

if [ -z $iterations ]
then
    iterations=1
fi

chown $ORIG_UID:$ORIG_GID output/

while [ $i -lt $iterations ]
do
    iterDir=$i
    rm -rf output/$iterDir/
    mkdir output/$iterDir
    ./sources/$1 $(echo $2) output/$iterDir/clear.c

    # Makes sure that Tigress has what it needs for things like
    # entropy-based opaque predicates

    mv output/$iterDir/clear.c output/$iterDir/clear.c.tmp
    echo -e "#include <time.h>\n#include <pthread.h>\n\n" > output/$iterDir/clear.c
    cat output/$iterDir/clear.c.tmp >> output/$iterDir/clear.c
    rm output/$iterDir/clear.c.tmp

    gcc -w -I $CSMITH_RUNTIME -O0 output/$iterDir/clear.c -o output/$iterDir/clear

    # The -D_Float128=double is needed because Tigress is having problems
    # with _Float128. It causes an error in mathcalls-helper-functions.h .
    # This will probably break anything that actually uses quad-size floats,
    # but I'm not sure anything really does...

    ./tigress-configs/$3.sh output/$iterDir/clear.c output/$iterDir/obfuscated.c $(./pickers/$4 output/$iterDir/clear $5)
    gcc -w output/$iterDir/obfuscated.c -o output/$iterDir/obfuscated

    chown -R $ORIG_UID:$ORIG_GID output/$iterDir/
    i=$((i + 1))
done
