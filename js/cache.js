console.log('\n*************************************');
console.log('缓存对象示例');
console.log('*************************************');

var cache = {}
var get = function(key){
  if (cache[key]) {
    return cache[key]
  }else{
    
  }
}
var set = function(key,value){
  cache[key] = value
}
