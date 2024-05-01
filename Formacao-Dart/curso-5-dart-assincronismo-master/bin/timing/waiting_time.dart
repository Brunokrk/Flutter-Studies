class BotClock{
  Future clock(int secs){
    return Future.delayed(Duration(seconds: secs));
  }

  Stream kakoBotStream(int interval, [int? maxCount]) async*{
        int i = 1;
        while(i != maxCount){
            //print("Counting: $i");
            await Future.delayed(Duration(seconds: interval));
            yield i++;
        }
        print('A Stream terminou.');
    }

}