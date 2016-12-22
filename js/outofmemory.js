const os = require('os')

console.log('\n*************************************');
console.log('内存示例');
console.log('*************************************');

var showMem = function(){
  var mem = process.memoryUsage()
  var format = function(bytes){
    if (bytes >= 1024 * 1024 * 1024) {
      return (bytes /1024 /1024/1024).toFixed(2) + "GB"
    }else if (bytes >= 1024 * 1024) {
      return (bytes /1024 /1024).toFixed(2) + "MB"
    }else if (bytes >= 1024) {
      return (bytes  /1024).toFixed(2) + "KB"
    }else{
      return bytes
    }
  }

  console.log('process: heapTotal ' + format(mem.heapTotal) + ' heapUsed ' +
  format(mem.heapUsed) + ' rss '  + format(mem.rss))
  console.log('system mem ' + format(os.totalmem()) + ' system free meme ' + format(os.freemem()))

  console.log('*************************************');
}


//堆内内存，受v8的内存大小影响
/*
var useMem = function(){
  var size = 20 * 1024 * 1024
  var arr = new Array(size)
  for (var i = 0; i < size; i++) {
    arr[i] = 0
  }
  return arr
}
*/

//堆外内存，不受v8的内存大小影响
var useMem = function(){
  var size = 200 * 1024 * 1024
  var buffer = new Buffer(size)
  for (var i = 0; i < size; i++) {
    buffer[i] = 0
  }
  return buffer
}

var total = []
for (var i = 0; i < 15; i++) {
  showMem()
  total.push(useMem())
}
