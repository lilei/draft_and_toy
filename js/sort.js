//高阶函数示例
var points = [2,4,1,5,7]
points.sort(function(a,b){
  return b - a
})
for (var i = 0; i < points.length; i++) {
  console.log(points[i])
}
