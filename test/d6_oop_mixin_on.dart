import "package:test/test.dart";

main() {
  //Mixin
  test("mixin_on", () {
    SuperMan superMan = SuperMan();
    superMan.say();
    superMan.run();
  });
}

///因为Runner用on修饰，限制了只有Person的子类可以with Runner，Person自己都不可以
///IronMan 不是Person的子类，所以不能with Runner
mixin Runner on Person{
  run() {
    print("在奔跑");
  }
}


class SuperMan extends Person with Runner{

}

// class IronMan with Runner{
//
// }

class Person {
  say(){
    print("说话");
  }
}
