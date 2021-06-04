import "package:test/test.dart";

main() {
  /// 明确声明变量的类型，一旦声明，后面都不可再赋值其它类型的值给他，这个和以前的经验一样
  test("定义变量1", () {
    //变量类型 变量名称 = 赋值;
    String name = 'coderwhy';
    int age = 18;
    double height = 1.88;
    // float ad = 1.1;//dart没有float?
    // height = "";报错，字符串值不能赋值给double类型的变量
    print(
        '$name:${name.runtimeType}; $age:${age.runtimeType}; $height:${height.runtimeType}');
  });

  ///类型推导
  ///类型推导声明变量的方式, 格式如下:var/dynamic/const/final 变量名称 = 赋值;
  ///这个变量具体是什么类型，根据赋值给它的“值决定”
  test("定义变量2", () {
    print('------var的使用--------');
    var name = 'coderwhy'; //决定了name的类型是String类型，且不再改变
    name = 'kobe';
    print(name.runtimeType); // String
    // name = 18;错误，因为name是String类型，不能给它赋值其它类型的值

    print('\n------dynamic的使用--------');
    //在开发中, 通常情况下不使用dynamic, 因为类型的变量会带来潜在的危险
    dynamic name1 = 'coderwhy'; //此时name1是String类型，但是后面可以给它赋值其它类型的值，随便改变它的类型
    print(name1.runtimeType); // String
    name1 = 18; //name1又变成了int类型
    print(name1.runtimeType); // int
  });

  ///final和const用于定义常量
  ///const在赋值时, 赋值的内容必须是在编译期间就确定下来的；
  ///final在赋值时, 可以动态获取, 比如赋值一个函数；也可以是在编译期间确定下来的；
  test("定义变量2", () {
    final name1 = 'coderwhy'; //编译期间决定值
    final name2 = getName(); //运行期间决定值
    // name2 = "";//常量只能赋值一次

    const name3 = "jack"; //编译期间决定值
    // name3 = "";//常量只能赋值一次
    // const name4 = getName();//错误,运行期间不行
  });

  ///数据类型-数字类型
  ///整数用int，浮点数用double;
  ///int和double都继承自num，因此num也算是一个类型
  ///Dart中的int和double可表示的范围并不是固定的，它取决于运行Dart的平台。
  test("数据类型1", () {
    print("------整数类型------");
    // 1.整数类型int
    int age = 18;
    int hexAge = 0x12;
    print(age);
    print(hexAge);

    print("\n------浮点类型------");
// 2.浮点类型double
    double height = 1.88;
    print(height);

    print("\n------字符串转数字------");
    // 字符串和数字转化
// 1.字符串转数字
    var one = int.parse('111');
    var two = double.parse('12.22');
    print('${one} ${one.runtimeType}'); // 111 int
    print('${two} ${two.runtimeType}'); // 12.22 double

    print("\n------数字转字符串------");
// 2.数字转字符串
    var num1 = 123;
    var num2 = 123.456;
    var num1Str = num1.toString();
    var num2Str = num2.toString();
    var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
    print('${num1Str} ${num1Str.runtimeType}'); // 123 String
    print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
    print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
  });

  /// 布尔类型
  test("数据类型2", () {
    // 布尔类型
    var isFlag = true;
    print('$isFlag ${isFlag.runtimeType}'); //true bool

    bool isGet = false;
  });

  /// 字符串类型-和kotlin类似
  test("数据类型3", () {
    // 布尔类型
    //单引号
    var s1 = 'Hello World';
    print("$s1");
    var s2 = 'Hello\'Fullter';
    print("$s2");

    //双引号
    var s3 = "Hello s3";
    print("$s3");
    var s4 = "Hello\"s4";
    print("$s4");

    //三个单引号或者三个双引号
    String a = '''a
    b
    c
    ''';
    print("$a");
  });

  ///List  Set  Map
  test("集合类型1", () {
    print("\n--------List--------");
// List定义
// 1.使用类型推导定义
    var letters = ['a', 'b', 'c', 'd'];
    print('$letters ${letters.runtimeType}'); //[a, b, c, d] List<String>

// 2.明确指定类型
    List<int> numbers = [1, 2, 3, 4];
    print('$numbers ${numbers.runtimeType}'); //[1, 2, 3, 4] List<int>

    print("\n--------Set--------");

    // Set的定义--Set和List最大的两个不同就是：Set是无序的，并且元素是不重复的。
// 1.使用类型推导定义
    var lettersSet = {'a', 'b', 'c', 'd'};
    print(
        '$lettersSet ${lettersSet.runtimeType}'); //{a, b, c, d} _CompactLinkedHashSet<String>

// 2.明确指定类型
    Set<int> numbersSet = {1, 2, 3, 4};
    print(
        '$numbersSet ${numbersSet.runtimeType}'); //{1, 2, 3, 4} _CompactLinkedHashSet<int>

    print("\n--------Map--------");

    // Map的定义
// 1.使用类型推导定义
    var infoMap1 = {'name': 'why', 'age': 18};
    print(
        '$infoMap1 ${infoMap1.runtimeType}'); //{name: why, age: 18} _InternalLinkedHashMap<String, Object>

// 2.明确指定类型
    Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
    print(
        '$infoMap2 ${infoMap2.runtimeType}'); //{height: 1.88, address: 北京市} _InternalLinkedHashMap<String, Object>

    //length-元素的个数
    //add()
    //remove()
    //contains()
    //removeAt()

    print("\n--------Map-方法--------");
// Map的操作
// 1.根据key获取value
    print(infoMap1['name']); // why

    // 2.获取所有的entries
    print(
        '${infoMap1.entries} ---- ${infoMap1.entries.runtimeType}'); // (MapEntry(name: why), MapEntry(age: 18)) ---- MappedIterable<String, MapEntry<String, Object>>

    // 3.获取所有的keys
    print(
        '${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

    // 4.获取所有的values
    print(
        '${infoMap1.values} ${infoMap1.values.runtimeType}'); // (why, 18) _CompactIterable<Object>// 5.判断是否包含某个key或者value

    print(
        '${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

    // 6.根据key删除元素
    infoMap1.remove('age');
    print('${infoMap1}'); // {name: why}
  });

  //函数的定义
  test("函数1", () {
    print("普通函数的定义");
    var result1 = sum1(1, 2);
    print("$result1");

    print("不指定函数的参数类型和返回值类型");
    var result2 = sum2(1, "2");
    print("$result2,${result2.runtimeType}"); //1-2,String
    print("-----------");
    var result3 = sum2(1, null);
    print("$result3,${result3.runtimeType}"); //1-null,String

    print("如果函数中只有一个表达式, 那么可以使用箭头语法");
    var s3Result = sum3(null, "something");
    print("$s3Result , ${s3Result.runtimeType}"); //null-something , String
    print("----------------");
    var s4Result = sum4(null, "something");
    print("$s4Result , ${s4Result.runtimeType}"); //null , Null
    print("void的特点");
    var result5 = sum5();
    // print("${result5.runtimeType}");//编译时错误,因为sum5()是void，所以result5.runtimeType错误，不该去获取类型
  });

  ///可选参数
  test("函数2", () {
    print("命名可选参数");
    printInfo1('why', address: '成都'); // name=why age=null height=null
    printInfo1('why', age: 18, address: '成都'); // name=why age=18 height=null
    printInfo1('why',
        age: 18, address: '成都', height: 1.88); // name=why age=18 height=1.88
    printInfo1('why',
        address: '成都', height: 1.88); // name=why age=null height=1.88

    print("位置可选参数");
    printInfo2('why'); // name=why age=null height=null
    printInfo2('why', 18); // name=why age=18 height=null
    printInfo2('why', 18, 1.88); // name=why age=18 height=1.88
  });

  ///函数是一等公民：函数也是一个对象，可以赋值给其它变量，可以作为其它函数的参数或返回值
  test("函数3", () {
    print("1.将函数赋值给一个变量");
    var result = foo;
    print(
        "${result.runtimeType} , ${foo.runtimeType} , ${foo is Function}"); //(String) => dynamic , (String) => dynamic , true，因为foo我们比没有写返回值类型所以是dynamic
    result("郭德纲");

    print("\n2.将函数作为另一个函数的参数");
    doSomething(foo); //传入的name:coderwhy

    print("\n3.将函数作为另一个函数的返回值");
    var resultF = getFunc();
    print("${resultF.runtimeType}"); //(String) => dynamic
    resultF("张学友"); //传入的name:张学友

    print("Function是所有函数的超类，但是看不出这个函数有没有参数，有没有返回值");
    //错误的示范，不严谨的用法
    // doParams(tParams);

    print("明确参数和返回值的用法，但是可读性稍差");
    doParams2(tParams);

    print("明确参数和返回值的用法，通过'typedef'提高可读性");
    doParams3(tParams);
  });

  ///匿名函数;函数里可以定义函数
  ///匿名函数：相当于完整的函数去掉函数名
  test("函数4", () {
    mmm();
  });

  ///作用域
  ///是根据代码的结构({})来决定作用域范围的
  ///优先使用自己作用域中的变量，如果没有找到，则一层层向外查找。
  test("函数5", () {
    region();
  });

  test("测试assert",(){
    bool a = false;
    assert(a);
    print("断言后面");
  });
}
// -----------------------------------------------------------------------------------------------------------------------

var name = 'global';

region() {
  // var name = 'region';
  void foo() {
    // var name = 'foo';
    print(name);
  }

  foo();
}

mmm() {
  printElement(item) {
    print(item);
  }

  print(
      "printElement的类型：${printElement.runtimeType}"); //printElement的类型：(dynamic) => Null

  // 1.定义数组
  var movies = ['盗梦空间', '星际穿越', '少年派', '大话西游'];

  // 2.使用forEach遍历: 有名字的函数
  //forEach()接收一个函数A，这个函数A用于处理遍历出来的每一个元素,A的参数应该只有一个，且类型是dynamic或者具体的元素类型？
  movies.forEach(printElement);

  print("--------------------");
  // 3.1 使用forEach遍历: 匿名函数，相当于前面的printElement整个函数体去掉"printElement"这几个字符
  movies.forEach((item) {
    print(item);
  });

  print("*********************");
  // 3.2 使用forEach遍历: 匿名函数表达式，更简洁的写法
  movies.forEach((item) => print(item));
}

// 1.定义一个函数
foo(String name) {
  print('传入的name:$name');
}
int fooo(String name) {
  print('传入的name:$name');
  return  12;
}

// 2.将函数作为另外一个函数的参数
doSomething(Function func) {
  func('coderwhy');
}

// 3.将函数作为另一个函数的返回值
getFunc() {
  return foo;
}
// 4.解决Function看不出有没有参数，有没有返回值的问题
void tParams(int a){
  print("输出$a");
  // return "a";
}

doParams(Function function){
  // function();//会运行时报错，因为doParams(tParams)中，tParams有一个参数，所以function(int a)也要有对应的参数
  //可见，单纯的从Function无法看出有没有参数，有没有返回值
  function(10);
}

//很明显doParams2要求传入的参数类型是，有一个int类型的参数且没有返回值的函数
doParams2(void doTest(int a)){
  doTest(10);
}

//对doParams2中的参数，进行重新定义，提高可读性
typedef DoTest = void Function(int a);
doParams3(DoTest doTest){
  doTest(1122);
}

/// 命名可选参数,
/// 如果某个参数必须传，则用required修饰
/// 用{}包裹参数
/// 传参时需要指定参数名称，因此顺序不重要
printInfo1(String name,
    {int age = 0, double height = 0.0, required String address}) {
  print('name=$name age=$age height=$height address=$address');
}

/// 定义位置可选参数
/// 参数用[]包裹
///传参时不用指定参数名称，因此顺序很重要，要一一对应，后面的参数可以不传，不传就使用默认值；
printInfo2(String name, [int age = 0, double height = 0.0]) {
  print('name=$name age=$age height=$height');
}

//普通函数的定义
int sum1(int num1, int num2) {
  return num1 + num2;
}

///函数的参数和返回值可以不指定类型，传入什么类型的数据，就是什么类型；返回什么类型的数据就是什么类型；
///如果传入null，类型就是Null；如果返回null或者没有返回，则返回值仍然是null，返回值类型是Null;
sum2(num1, num2) {
  print("${num1.runtimeType},${num2.runtimeType}");
  return "$num1-$num2";
}

///如果函数中只有一个表达式, 那么可以使用箭头语法(arrow syntax)
sum3(p1, p2) => "$p1-$p2"; //有返回值，返回值类型是String,返回值是"$p1-$p2"

sum4(p1, p2) => print("$p1-$p2"); //有返回值，返回值类型是Null,返回值是null

 void sum5(){

}

String getName() {
  return 'coderwhy';
}
