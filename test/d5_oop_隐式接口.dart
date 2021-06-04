import "package:test/test.dart";

main() {
  //隐式接口
  test("ysjk", () {
    SuperMan superMan = SuperMan();
    superMan.name = "超人";
    print(
        "${superMan is Runner},${superMan is Flyer},${superMan is Eatter},${superMan is Person}"); //true,true,true,true
    superMan.run();
    superMan.fly();
    superMan.eat();
  });
}

abstract class Runner {
  run();
}

abstract class Flyer {
  fly();
}

class Eatter {
  String? name;

  // String? get getName{
  //   return name;
  // }
  // set setName(String name){
  //   this.name = name;
  // }
  eat() {
    print("吃东西");
  }
}

///Singer和Eatter有相同的属性或方法，则某个类如果实现他俩的话，不需要重复实现；
class Singer {
  String? name;

  // String? get getName{
  //   return name;
  // }
  // set setName(String name){
  //   this.name = name;
  // }
  eat() {
    print("Singer也吃东西");
  }
  sing(){

  }
}

///因为Dart中，没有类似java的interface这种关键字来定义接口，而是在Dart中所有的类都隐含来说是一个接口,这个类里
///的所有属性和方法都‘必须’被‘implements’它的子类来重新实现，(如果这个类有具体实现的方法，则我们也把他当成是接口的抽象方法,把具体的实现干掉)，作为接口时，子类不可以用super关键字来调用这个具体实现的方法，必须是重写它；
///但是，习惯上，我们一般把抽象类作为接口使用，毕竟它们有共同点；
class SuperMan extends Person implements Runner, Flyer, Eatter,Singer {
  @override
  run() {
    print('超人在奔跑');
  }

  @override
  fly() {
    print('超人在飞');
  }

  @override
  String? name;

  @override
  eat() {
    // super.eat();//错误，因为此时Eatter是作为接口，只有抽象方法，因此不能super
    print("$name吃东西");
  }

  @override
  sing() {

  }
}

class Person{

}
