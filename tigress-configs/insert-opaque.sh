tigress \
   --Environment=x86_64:Linux:Gcc:4.6 \
   -D_Float128=double \
   -I $CSMITH_RUNTIME \
   -w \
   --Transform=InitEntropy \
   --Transform=InitOpaque \
      --Functions=main \
      --InitOpaqueCount=1 \
      --InitOpaqueStructs=list,array,env \
   --Transform=AddOpaque \
      --Functions=$3 \
      --AddOpaqueKinds=junk \
      --AddOpaqueCount=1 \
   $1 --out=$2
