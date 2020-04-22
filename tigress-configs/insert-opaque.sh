tigress \
   --Environment=x86_64:Linux:Gcc:4.6 \
   -D_Float128=double \
   -I $CSMITH_RUNTIME \
   --Transform=InitEntropy \
   --Transform=InitOpaque \
      --Functions=main \
      --InitOpaqueCount=1 \
      --InitOpaqueStructs=list,array,env \
   --Transform=AddOpaque \
      --Functions=/func_/ \
      --AddOpaqueKinds=call \
      --AddOpaqueCount=100 \
   $1 --out=$2
