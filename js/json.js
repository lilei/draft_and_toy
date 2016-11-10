//js类型与JSON的区别

console.log('\n*************************************');
console.log('js属性名称必须被引号包裹,最后一个属性后不能有逗号');
console.log('*************************************');

var a = [1,02,3,4.]
var o = {
  a: 1.,
  b: 02,
}

console.log(a)
console.log(o)

console.log('\n*************************************');
console.log('js属性名称必须被引号包裹,最后一个属性后不能有逗号');
console.log('数字不能使用前导0，否则parse会报错，stringify会省略');
console.log('*************************************');
var s = '{"a": 1,"b": 2}'
var j = JSON.parse(s)
console.log(j)

j.c = 03
j.d = 4.
var s1 = JSON.stringify(j)
console.log(s1);
