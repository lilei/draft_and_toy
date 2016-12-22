var http = require('http')
var heapdump = require('heapdump')

var leakArray = []
var leak = function(){
  leakArray.push('leak ' + Math.random())
}

http.createServer(function(req,res){
  leak()
  res.writeHead(200,{'Content-Type' : 'text/plain'})
  res.end('Hello Wrold\n')
  console.log('service once');
}).listen(1234)
console.log('server running on port 1234');
