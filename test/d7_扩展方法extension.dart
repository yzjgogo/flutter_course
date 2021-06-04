import "package:test/test.dart";

main() {
  test("扩展函数", () {
    // dynamic abc = "abcd"; //dynamic类型不可以
    // var abc = "abcd";可以
    // const abc = "abcd";可以
    // final abc = "abcd";可以
    String abc = "abcd";
    yzj(abc).mLog();//也可以，当用多个扩展函数有相同的mLog()方法时，可以这样限制，避免冲突
    abc.mLog();//也可以
    // print("yzj的类型：${yzj.runtimeType}");//报错
  });
}
///定义一个String的扩展函数
extension yzj on String{
  mLog(){
    print("log-->$this");
  }
}