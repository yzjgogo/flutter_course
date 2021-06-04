
import "package:test/test.dart";

main() {
  //继承
  test("extends", () {
    var person = Person("",10);
    person.name = "中国人";
    person.age = 100;
    person.run();
    //类型判断
    print("${person is Person},${person is Animal}");
    //强制类型转换
    Animal animal = person;
    Person p = (animal as Person);
  });
}

class Animal {
  int? age;
  Animal(this.age);
  run() {
    print("动物在奔跑ing");
  }
}

///1:子类不可以集成父类的构造方法；
///2：子类可以集成父类的所有成员变量和方法；
///3：子类可以对父类的方法重写
///4：子类的构造方法在执行前，将隐含调用父类的无参默认构造方法（没有参数且与类同名的构造方法）。
///5：如果父类没有无参默认构造方法，则子类的构造方法必须在初始化列表中通过super显式调用父类的某个构造方法。
class Person extends Animal {
  String? name;

  // Person(this.name,int age):super(age);//也可以
  Person(String name,int age):name = name,super(age);

  @override
  run() {
    // return super.run();
    super.run();
    print("$name在奔跑");
  }
}
