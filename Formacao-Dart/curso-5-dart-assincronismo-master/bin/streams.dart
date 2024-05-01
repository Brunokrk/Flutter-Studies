import 'dart:async';

void main() async{
    Stream myStream(int interval, [int? maxCount]) async*{
        
        int i = 1;
        while(i != maxCount){
            print("Counting: $i");
            await Future.delayed(Duration(seconds: interval));
            yield i++;
        }
        print('The Stream is finished');
    }

    var kakoStream = myStream(1).asBroadcastStream();
    StreamSubscription mySubscriber = kakoStream.listen((event){
      if (event.isEven){
        print('This number is even!');
      }
    }, onError: (e){
      print('An error happend and can be manipulated');
      }, onDone: (){
        print("Subscriber is Done!");
      });

    kakoStream.map((event) => 'Subscriber 2 watching: $event').listen(print);  

    await Future.delayed(Duration(seconds:3));
    mySubscriber.pause();
    print('Stream Paused');
    await Future.delayed(Duration(seconds:3));
    mySubscriber.resume();
    print('Stream Resumed');
    await Future.delayed(Duration(seconds:3));
    mySubscriber.cancel();
    print('Stream Canceled');


    //myStream(1,10);
    print('Main is finished');
}
