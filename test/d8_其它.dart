import "package:test/test.dart";

main() {
  ///空安全,基本和kotlin一样
  test("空安全", () {
    String? abc = "abc";
    // print("${abc is String},${abc is String?}");//abc is String? 写法错误
    print("${abc is String}"); //true
  });

  /*
  test("扩展操作符", () {
    //扩展操作符
    var list1 = [1, 2, 3];
    var list2 = [0, ...list1];
    print("扩展操作符:${list2}");

    //空感知扩展操作符
    var list3 = null;
    var list4 = [0, ...?list3];
    print("空感知1：${list4}");
    list4 = [0, ...?list1];
    print("空感知2：${list4}");
  });
  */

  test("集合元素", () {
    ///如果promoActive为true，则nav会包含元素Outlet；否则不会
    bool promoActive = true;
    var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
    print("if判断元素：$nav");

    ///通过for循环，将listOfInts的每一个元素分别处理成想要的结果，后依次加入到现在listOfStrings里
    var listOfInts = [1, 2, 3];
    var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
    print("for判断元素：$listOfStrings");

  });

  test("for循环",(){
    var callbacks = [];
    for (var i = 0; i < 2; i++) {
      //这里add的参数是一个函数，说明callbacks的数据类型List<Function>,每一个元素都是函数，且都捕获了当前元素的索引值；
      callbacks.add(() => print(i));
    }
    print("输出集合:$callbacks");//输出集合:[Closure: () => void, Closure: () => void]
    //forEach的参数也是一个函数，这个函数有一个参数c，会随着遍历，c依次接收callbacks的每一个元素，而每一个元素都是函数类型() => print(i),且已经捕获了i值，所以
    //执行c()就是执行print(i)
    callbacks.forEach((c) => c());//0 1
  });
}
