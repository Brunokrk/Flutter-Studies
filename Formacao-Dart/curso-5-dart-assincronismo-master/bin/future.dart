void main(){

  //Future myFuture = Future((){
  //  print("Going Back to the Future");
  //  return 21;
  //}).then((value) => print('The value is $value'));
  
  //Future<int> myFutureFunc()async{
  //  print("I have a function in the future");
  //  await Future.delayed(Duration(seconds: 5));
  //  print("teste");
  //  return 12;
  //}

  //myFutureFunc()
  //  .then((value) => print("My function value is $value"))
  //  .onError((error, stackTrace) => print('An Error Occured'))
  //  .whenComplete(() => print("The Future is over!"));
  
  Future<int> myFutureErrorFunc(int a, int b)async{
    try{
      if (a>b){
        throw Exception();
      }
      print("I have a functional function");
      await Future.delayed(Duration(seconds: 5));
      return 42;
    }catch(e){
      print("An error occured: $e");
      return 42;
    }finally{
      print('The Future is finally over!!');
    }
  }
  
  myFutureErrorFunc(2, 1).then((value) => print('The Value is $value'));

  print("Done with main");
}