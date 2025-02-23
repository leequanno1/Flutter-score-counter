import 'package:learning_bloc/models/casinum.dart';

class DeletedCasinumState {
  final List<Casinum> casinums;
  final List<bool> isSelecteds;

  DeletedCasinumState(this.casinums, this.isSelecteds);
}

class DeletedCasinumInit extends DeletedCasinumState {
  DeletedCasinumInit(List<Casinum> casinums): super(casinums, List.generate(casinums.length, (item)=>false));
}

class DeletedCasinumUpdate extends DeletedCasinumState {
  DeletedCasinumUpdate(super.casinums, super.isSelecteds);
}