#!/bin/bash -e

# Comment 1
# Comment 2

# Check if Curl is installed, exit if not.
CURL=`which curl`
if [ -z "$CURL" ]; then
    echo "Please install Curl"
    exit
fi

AWK=`which awk`
if [ -z "$AWK" ]; then
    echo "Please install Awk"
    exit
fi


# Check that parameters are set.
if [ $# -lt 2 ]; then
    echo "Not all arguments are provided"
    echo "-i /path/to/inputfile"
    echo "-o /path/to/outputdirectory"
    exit 1
fi

########################################################################
#   Assign command line arguments to local variables
while getopts ':i:o:h:' OPTION ; do
    case "${OPTION}" in
        i)
            FILE="${OPTARG}"
            ;;
        o)
            OUTPUTDIR="${OPTARG}"
            if [ -d "$OUTPUTDIR" ]; then
                rm $OUTPUTDIR/*
            fi
            mkdir -p $OUTPUTDIR
            ;;
    esac
done

for url in `cat $FILE` ; do
    CODE=`curl -s -I $url | grep 'HTTP/1.1' | awk '{print $2;}'`
    echo $url >> $OUTPUTDIR/$CODE.txt
done




