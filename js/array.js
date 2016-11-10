//数组示例

var arr= [12,3.14,Infinity,NaN,"","bla",true,false,Symbol('foo'),undefined,{a:1},[1,2,4],new Date(),function(){},null,/s/]

console.log()
console.log(arr.toString())

array.foreach(function(value,index,array){
    console.log(value);
    console.log(index);
    console.log(array);
    console.log("**********************");
})
