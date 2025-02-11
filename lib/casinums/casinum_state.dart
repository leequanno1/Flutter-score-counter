import 'package:learning_bloc/models/casinum.dart';

class CasinumsState {
  final List<Casinum> casinums;
  final List<bool> itemSelecteds;
  final int selectedNumber;
  CasinumsState(this.casinums, this.itemSelecteds, this.selectedNumber);
}

class CasinumsInit extends CasinumsState {
  CasinumsInit(List<Casinum> casinums)
    :super(casinums, List.generate(casinums.length, (index) => false, growable: false), 0);
}

class CasinumsUpdate extends CasinumsState {
  CasinumsUpdate(super.casinums, super.itemSelecteds, super.selectedNumber);
}