class DeletedCasinumEvent {}

class DeletedCasinumRestore extends DeletedCasinumEvent{}

class DeletedCasinumRemove extends DeletedCasinumEvent{}

class DeletedCasinumSelect extends DeletedCasinumEvent{
  
  final int position;
  
  DeletedCasinumSelect(this.position);
}