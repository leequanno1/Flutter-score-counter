import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_event.dart';
import 'package:learning_bloc/deleted_casinum/deleted_casinum_state.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/models/db_name.dart';

class DeletedCasinumBloc extends Bloc<DeletedCasinumEvent, DeletedCasinumState> {
  static final Box<Casinum> _casiBox = Hive.box<Casinum>(DbName.getCasinumBaseName());
  DeletedCasinumBloc():super(DeletedCasinumInit(
    _casiBox.values.where((item) => item.delFlg).toList()
  )){
    on<DeletedCasinumRestore>((event, emit) {
      final tempCasis = List<Casinum>.from(state.casinums);
      final isSelecteds = List<bool>.from(state.isSelecteds);
      // duyệt mãng
      for(int i = tempCasis.length - 1; i >= 0; i--) {
        if(isSelecteds[i]) {
          // cập nhật delFlag
          final tempCasi = tempCasis[i]..delFlg = false;
          _casiBox.put(tempCasi.id, tempCasi);
          // xóa khỏi mãng
          tempCasis.removeAt(i);
        }
      }
      emit(DeletedCasinumInit(tempCasis));
    } ,);
    
    on<DeletedCasinumRemove>((event, emit) {
      final tempCasis = List<Casinum>.from(state.casinums);
      final isSelecteds = List<bool>.from(state.isSelecteds);
      // duyệt mãng
      for(int i = tempCasis.length - 1; i >= 0; i--) {
        if(isSelecteds[i]) {
          // xóa khỏi db
          _casiBox.delete(tempCasis[i].id);
          // xóa box player và logger khỏi disk
          Hive.deleteBoxFromDisk(DbName.getPlayerBaseName(tempCasis[i].id));
          Hive.deleteBoxFromDisk(DbName.getLoggerBaseName(tempCasis[i].id));
          // xóa khỏi mãng
          tempCasis.removeAt(i);
        }
      }
      emit(DeletedCasinumInit(tempCasis));
    } ,);
    
    on<DeletedCasinumSelect>((event, emit) {
      // toggle cờ is selected tại position
      final tempCasis = List<Casinum>.from(state.casinums);
      final isSelecteds = List<bool>.from(state.isSelecteds);
      isSelecteds[event.position] = !isSelecteds[event.position];
      emit(DeletedCasinumUpdate(tempCasis, isSelecteds));
    } ,);
  }
}