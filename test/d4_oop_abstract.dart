import "package:test/test.dart";

main() {
  //抽象类和抽象方法
  test("abstract", () {});
}

///抽象类
///1：抽象类不能实例化(但是可以通过工厂方法实例化，参考d2_2_oop_工厂构造方法1)
///2：抽象类中的抽象方法必须被子类实现, 抽象类中的已经被实现方法, 可以不被子类重写
abstract class Shape {
  // abstract getArea();//错误写法
  //抽象方法
  getArea();

  //非抽象方法
  doSomething(){
    print("doSomething");
  }
}

class Circle extends Shape {
  double? r;

  Circle(this.r);

  @override
  getArea() {
    return r! * r! * 3.14;
  }
}

class Reactangle extends Shape {
  double? w;
  double? h;

  Reactangle(this.w, this.h);

  @override
  getArea() {
    return w! * h!;
  }
}
