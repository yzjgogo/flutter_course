import 'dart:math';

import "package:test/test.dart";

main() {
  //默认构造器和级联语法
  test("类1", () {
    defaultConstructor();
  });

  //普通构造方法
  test("类2", () {
    normalConstructor();
  });

  //普通构造方法的等价用法
  test("类3", () {
    normalConstructor2();
  });

  //命名构造方法
  test("类4", () {
    namedConstructor();
  });

  //初始化列表
  test("类5", () {
    initList();
  });

  //重定向构造器
  test("类6", () {
    redirectConstructor();
  });

  //常量构造方法
  test("类7", () {
    constConstructor();
  });

  //getter和setter
  test("get_set", () {
    getAndSet();
  });
}

void getAndSet() {
  final bird = Bird("黄色");
  bird.color = "红色";
  print("鸟的颜色:${bird.color}");
  print("--------------------");
  // bird.setColor("蓝色");//错误用法
  bird.setColor = "蓝色";
  String? result = bird.getColor;
  print("最终的颜色:$result");
}
class Bird{
  String? color;
  Bird(this.color);

  //1:不能是getColor()
  //2:前面要加'get'关键字
  String? get getColor{
    print("执行了getColor");
    return this.color;
  }

  //1：必须有参数
  //2：前面要加'set'关键字
  set setColor(String color){
    print("执行了setColor");
    this.color = color;
  }
}
//------------------------------------------------------------------------

///常量构造器
///1：构造器必须用'const'修饰；
///2：创建对象时构造器前必须用'const';
///3：对应类的所有属性必须用'final'修饰；
///4：满足以上三个情况后，如果创建对象时传入的参数相同则就是创建的同一个对象，否则不是；
void constConstructor() {
  var goose1 = const Goose("大鹅", 11);
  var goose2 = const Goose("大鹅", 11);
  print(identical(goose1, goose2));
}

class Goose {
  final String? name;
  final int? age;

  const Goose(this.name, this.age);
}

//------------------------------------------------------------------------

void redirectConstructor() {
  Chicken chicken1 = Chicken.setName("只有名字");
  print("${chicken1.toString()}");
  Chicken chicken2 = Chicken.setAge(100);
  print("${chicken2.toString()}");
}

///有时候类中的构造函数仅用于调用类中其它的构造函数，此时该构造函数没有函数体，只需在函数签名后使用（:）指定需要重定向到的其它构造函数：
///这里的命名构造函数set就重定向到了Chicken(this.name,this.age)
class Chicken {
  String? name;
  int? age;

  Chicken(this.name, this.age);

  Chicken.setName(String name) : this(name, 10);

  Chicken.setAge(int age) : this.set("dd", age);

  Chicken.set(this.name, this.age);

  @override
  String toString() {
    return "重定向构造器：name = $name ; age = $age";
  }
}
//------------------------------------------------------------------------

void initList() {
  var point1 = Point(3, 4);
  print("$point1");
}

class Point {
  num? x;
  num? y;
  num? distance;
  num? z = 0;

  // Point(num x,num y){
  //   this.x = x;
  //   this.y = y;
  //   this.distance = sqrt(x * x + y * y);
  // }

//   Point(this.x, this.y) {
//     distance = sqrt(this.x! * this.x! + this.y! * this.y!);
//   }
  ///初始化列表：执行顺序：1初始化列表；2父类的构造器；3自己的构造器；
  ///从执行顺序可见：
  ///1：在初始化列表中不能用‘this’关键字，因为自己的构造器还没执行；
  ///2：虽然不能用'this'关机键字，但是赋值给成员变量的值确实是自己这个构造器要构造出来的对象的属性值，而不是属于类的static值；
  ///3：初始化列表以‘:’开始，多个参数用‘,’分割；
  Point(this.x, this.y)
      : distance = sqrt(x! * x + y! * y),
        z = 100;

  @override
  String toString() {
    return "x = $x ; y = $y ; distance = $distance ; z = $z";
  }
}
//------------------------------------------------------------------------

void namedConstructor() {
  //1：通过普通构造器创建对象
  Duck duck1 = Duck("鸭子1", 1);
  print("${duck1.toString()}");
  //2.1：通过命名构造器创建对象
  Duck duck2 = Duck.set("鸭子2", 2);
  print("${duck2.toString()}");
  //2.2：通过命名构造器创建对象
  Duck duck3 = Duck.named("鸭子3", 3);
  print("${duck3.toString()}");
}

///因为dart语言不允许方法的重载，所以以类名作为构造器的构造器只允许有一个，不允许有不同参数的多个构造器，如果
///想定义多个构造器则可以通过命名构造器实现
class Duck {
  String? name;
  int? age;

  Duck(this.name, this.age);

  Duck.set(this.name, this.age) {
    print("命名构造器也可以有函数体：${this.name},${this.age}");
  }

  //已经有一个构造器Duck(this.name,this.age)，我想再定义一个构造器，可以这样：
  Duck.named(String name, int age) {
    this.name = name;
    this.age = age;
  }

  //实际案例距离
  // Duck.fromMap(Map<String, Object> map) {
  //   this.name = map!['name'];
  //   this.age = map['age'];
  // }

  @override
  String toString() {
    return "name = $name ; age = $age";
  }
}
//------------------------------------------------------------------------

void normalConstructor2() {
  var cat = new Cat("Tom", 4);
  print("${cat.name},${cat.age}");
}

class Cat {
  String? name;
  int? age;

  //简化写法
  Cat(this.name, this.age);
/*
  与Cat(this.name,this.age)等价
  Cat(String name,int age){
    this.name = name;
    this.age = age;
  }
  */
}

//------------------------------------------------------------------------

void normalConstructor() {
  Dog dog = Dog("旺财", 3);
  print("${dog.name},${dog.age}");
}

class Dog {
  String? name;
  int? age;

  Dog(String name, int age) {
    this.name = name;
    this.age = age;
  }
}

///默认构造方法和级联语法
void defaultConstructor() {
  final geshen = new Person();
  geshen.name = "张学友";
  geshen.age = 50;
  print("打印$geshen");

  var person = Person()
    ..name = "郭德纲"
    ..age = 48
    ..eat()
    ..sing();
  print("${person.toString()}");
}

class Person {
  String? name;
  int? age;

  eat() {
    print("${this.name}吃东西");
  }

  sing() {
    print("$name唱歌中");
  }

  @override
  String toString() {
    return "name=$name;age=$age";
  }
}
