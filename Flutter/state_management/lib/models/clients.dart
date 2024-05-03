import 'package:flutter/foundation.dart';

import 'client.dart';

class Clients extends ChangeNotifier{
  List<Client> clients;

  Clients({
    required this.clients});

  void add(Client client){
    clients.add(client);
    notifyListeners();
  }

  void removeAt(int index){
    clients.removeAt(index);
    notifyListeners();
  }

}