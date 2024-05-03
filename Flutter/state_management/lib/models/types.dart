import 'package:flutter/foundation.dart';
import 'package:state_management/models/client_type.dart';

class Types extends ChangeNotifier{
  List<ClientType> types;

  Types({
    required this.types});

  void add(ClientType type){
    types.add(type);
    notifyListeners();
  }

  void removeAt(int index){
    types.removeAt(index);
    notifyListeners();
  }

}