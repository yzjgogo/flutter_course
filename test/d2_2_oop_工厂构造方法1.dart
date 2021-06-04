import "package:test/test.dart";

///http://www.javashuo.com/article/p-esarbdyd-hu.html
main() {
  //工厂构造方法的特点
  test("工厂构造方法2", () {
    doFactory();
  });

  //抽象类实例化:依靠工厂构造方法返回一个'implements'了这个抽象类的类的示例A，A肯定也是这个抽象类的类型，'extends'不可以(参考Shape的注释)
  test("抽象类实例化1", () {
    doAbstractInstance();
  });

  ///抽象类实例化:Map和List的实例化
  ///Map()内部源码是：external factory Map();
  ///1：可见这是一个工厂构造方法，猜测他返回的对象是'implements'了Map的某个类的对象，(其实是LinkedHashMap)
  ///2：external:能够将方法的生命与实现分离开； 能够由外部来帮咱们完成具体的方法实现，那外部如何才能关联到该
  ///声明的方法呢？这里就须要用到注解 @patch，使外部的方法实现与该声明的方法绑定，好处是能够针对不一样的平台作不一样的实现
  ///3：external factory Map();只负责声明方法，具体的实现在// flutter/bin/cache/dart-sdk/lib/collection/linked_hash_map.dart里:
  ///  @patch
  ///   factory Map() => new LinkedHashMap<K, V>();
  test("抽象类实例化2", () {
    var map = Map();

    //List也是同样的道理
    // var list = List.filled(2, null, growable: false);
  });
}

void doAbstractInstance() {
  Shape shape = Shape();
  print("$shape , ${shape is Rect}"); //Instance of 'Rect' , true
}

void doFactory() {
  Circle circle = Circle("我的key", 3.0);
  print("$circle , ${circle is Oval}"); //Instance of 'Oval' , true
}

///如果在一个类(无论这个类是不是抽象类)中定义了工厂构造方法，
///1：则使用‘extends’继承它的子类A也只能有工厂构造方法,不可以有其它构造方法，子类A的工厂构造方法执行时不会调用父类的那个工厂构造方法；
///2：而使用'implements'实现这个类的子类B，则可以有任意的构造方法，不受限制；
///http://www.javashuo.com/article/p-esarbdyd-hu.html
abstract class Shape {
  getArea();

  factory Shape() {
    print("Shape的工厂构造方法");
    return Rect();
  }

// Shape.other();
}

///因为Shape中定义了工厂构造方法且Circle使用‘extends’继承Shape，所以Circle只能有工厂构造方法
class Circle extends Shape {
// class Circle {
  double r = 10;
  static final Map<String, Circle> _cache = <String, Circle>{};

  factory Circle(String key, double r) {
    if (_cache.containsKey(key)) {
      return _cache[key] ?? Oval(r); //这里不能Circle(key,r)，因为是无限递归了
    } else {
      final p = Oval(r); //这里不能Circle(key,r)，因为是无限递归了
      _cache[key] = p;
      return p;
    }
  }

  // Circle.name(String key);//不可以有这种构造方法
  // Circle(this.r);//不可以有这种构造方法

  // @override
  getArea() {
    return r * r * 3.14;
  }
}

///虽然Circle里定义了工厂构造方法，但是Oval是使用'implements'实现Circle，所以Oval可以有自己的各种构造器不受限制；
class Oval implements Circle {
  @override
  double r;

  Oval(this.r);

  @override
  getArea() {
    // TODO: implement getArea
    throw UnimplementedError();
  }
}

class Rect implements Shape {
  @override
  getArea() {
    // TODO: implement getArea
    throw UnimplementedError();
  }
}
