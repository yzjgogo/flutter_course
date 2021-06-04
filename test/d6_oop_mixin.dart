import "package:test/test.dart";

main() {
  //Mixin
  test("ysjkkk", () {
    SuperMan superMan = SuperMan();
    superMan.name = "超人";
    // print(
    //     "${superMan is Runner},${superMan is Flyer},${superMan is Eatter},${superMan is Person}"); //true,true,true,true
    superMan.run();
    superMan.fly();
    superMan.eat();
    superMan.hit();
    print("${superMan.name}");
    print("${superMan is Runner},${superMan is Flyer},${superMan is Eatter}");
  });
}

mixin Runner{
  run() {
    print("在奔跑");
  }
}

mixin Flyer {
  fly() {
    print("在飞翔");
  }
}

///mixin修饰的类也可以有抽象方法，‘with’了它的类必须实现该抽象方法
mixin Eatter {
  String? name;

  eat() {
    print("吃东西");
  }
  hit();
}

///背景：通过implements实现某个类时，类中所有的方法都必须被重新实现(无论这个类原来是否已经实现过该方法)
///但是某些情况下，一个类可能希望直接复用之前类的原有实现方案，怎么做呢?
///使用继承吗？但是Dart只支持单继承，那么意味着你只能复用一个类的实现。
///Dart提供了另外一种方案: Mixin混入的方式
///通过mixin定义的类用于被其他类混入使用，通过with关键字来进行混入
class SuperMan extends Person with Runner, Flyer, Eatter {
  @override
  eat() {
    print("超人吃东西");
    super.eat();//mixin也可以通过‘super’关键字调用父类的方法，这点与'extends'类似，与'implements'不同
  }

  @override
  hit() {
    print("超人打架");
  }
}

class Person {}
