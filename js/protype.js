console.log('*************************************');
console.log('使用普通语法创见对象');
console.log('*************************************');

//对象继承Object.property的所有属性
//o ------> Object.property ----> null
var a = {a:1,b:2}

//数组继承于Array.property
//o ------>Array.property -----> Object.property ----> null
var b = [1,2,'haha'];

//函数继承于function.property
//o ------>Function.property -----> Object.property ----> null
function f(){
  return 2;
}

console.log(a.hasOwnProperty);
console.log(b.hasOwnProperty);
console.log(f.hasOwnProperty);
console.log(b.indexOf);
console.log(b.forEach);
console.log(b.map);
console.log(b.reduceRight);
console.log(b.filter);
console.log(b.every);
console.log(b.some);
console.log(a.some);
console.log(f.some);
console.log(f.call);

console.log('\n*************************************');
console.log('使用构造器创见对象（new 操作符）');
console.log('*************************************');
function Graph(){
  this.vertexes = []
  this.edges = []
}

Graph.prototype = {
  addVertext: function(v){
    this.vertexes.push(v)
  }
}

var g = new Graph()
console.log(g.vertexes);
console.log(g.edges);
console.log(g.addVertext);
console.log(Graph.addVertext);
console.log(Graph.prototype.addVertext);

console.log('\n*************************************');
console.log('使用Object.create创建对象');
console.log('*************************************');
var o = {
  a: 2,
  m: function(){
    return this.a + 1
  }
}

console.log(o.m())

var p = Object.create(o)

//property shadowing
p.a = 12;
console.log(p.m());

//hasOwnProperty只会
console.log(p.hasOwnProperty('a'));
console.log(o.hasOwnProperty('m'));
console.log(p.hasOwnProperty('m'));

var o = {a:1,b:2}

console.log(o.a);

//property shadowing
console.log(o.b);

console.log(o.c);

console.log(o.d);


console.log('\n*************************************');
console.log('使用class关键字创建对象');
console.log('*************************************');

"use strict"
class Polygon {
  constructor(height,width) {
    this.height = height
    this.width = width
  }
}

class Square extends Polygon{
  constructor(sideLength) {
    super(sideLength,sideLength)
  }
  get area(){
    return this.height * this.width
  }
  set sideLength(newLength){
    this.height = newLength
    this.width = newLength
  }
}
var square = new Square(2)
console.log(square.height);
console.log(square.width);
square.sideLength(3)
//console.log(square.width);
