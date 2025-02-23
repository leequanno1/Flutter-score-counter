import 'package:learning_bloc/models/casinum.dart';

abstract class CasinumsEvent {}

class CasinumsSelected extends CasinumsEvent {
  final int seletedIndex;

  CasinumsSelected(this.seletedIndex);
}

class CasinumsUnSelectedAll extends CasinumsEvent {}

class CasinumsAdd extends CasinumsEvent {
  final Casinum addedItem;
  
  CasinumsAdd(this.addedItem);
}

class CasinumDelete extends CasinumsEvent {}

class CasinumRefresh extends CasinumsEvent {}