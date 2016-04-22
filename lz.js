var LZString = require("./lz-string-1.3.3.js")

var decompressFromBase64 = LZString['decompressFromBase64']

var data = process.argv[2]

console.log(decompressFromBase64(data))
