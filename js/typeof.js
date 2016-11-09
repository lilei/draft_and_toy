
var arr = [12,3.14,Infinity,NaN,"","bla",true,false,Symbol('foo'),undefined,{a:1},[1,2,4],new Date(),function(){},null,/s/]

for (var i = 0; i < arr.length; i++) {
  console.log("typeof " + String(arr[i]) + " is " + typeof arr[i])
}
