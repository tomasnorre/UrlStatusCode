# UrlStatusCode
This script will visit a number of urls given in input file and return their status codes (e.g. 200, 301, 404)

## Usage
    ./getUrlStatusCode.sh -i ~/Desktop/input.txt -o ~/Desktop/Test/StatusCodes

Can result in file structed like:
    
    .
    |____StatusCodes
    | |____200.txt
    | |____404.txt

Where the files respectively will contain urls that resulted in the given status-code.
