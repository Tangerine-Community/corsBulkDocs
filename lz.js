var LZString = require("./lz-string/libs/lz-string-1.3.3.js")

var decompressFromBase64 = LZString['decompressFromBase64']
var compress = LZString['compress']

var fs = require('fs')

var data = process.argv[3]

if (process.argv[2] == "-d") {
  console.log(decompressFromBase64(data))
} else if (process.argv[2] == "-c") {
  console.log(compress(data))
}
