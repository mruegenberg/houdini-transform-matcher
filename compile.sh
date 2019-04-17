#! /bin/bash
if [ -z "$HFS" ]; then
    export HFS=/opt/hfs17.5
    export PATH=$HFS\bin:$PATH
    export CUR=`pwd`
    cd $HFS
    source houdini_setup
    cd $CUR
fi

# note: for Houdini 15.5-16, you need GCC 4.8!
# for H17.5, GCC 6.3 (6.5 seems to work as well)
export CC=gcc-6
export CXX=g++-6

export HCUSTOM_CFLAGS="-fopenmp" # much faster
export HCUSTOM_LDFLAGS="-fopenmp" # much faster. Important to pass openMP during both compilation and linking!


# hcustom -e -i ./dso SOP_xfomatcher.C -I eigen -I libigl/include
hcustom -e -i ./dso -g SOP_xfomatcher.C -I eigen -I libigl/include

