console.log('\n*************************************');
console.log('偏函数实例');
console.log('*************************************');
var toString = Object.prototype.toString;
/*
var isString = function (obj) {
return toString.call(obj) == '[object String]';
};
var isFunction = function (obj) {
return toString.call(obj) == '[object Function]';
};
*/



console.log('*************************************');
var isType = function(type){
  return function(obj){
    return toString.call(obj) == '[object ' + type + ']'
  }
}
var isString = isType('String');
var isFunction = isType('Function')
var isNumber = isType('Number')
var isBoolen = isType('Boolen')


console.log(isString(''));
console.log(isFunction(function(){}));
console.log(isNumber(1));
var n = 1;
console.log(n.toString());
console.log(toString.call(n));

var s = 'sss'
console.log(s.toString());
console.log(toString.call(s));

var a = [1,2,3]
console.log(a.toString());
console.log(toString.call(a));

var o = {
  a: 1,
  b: 2
}

console.log(o.toString());
console.log(toString.call(o));
