import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:learning_bloc/casinums/casinum_event.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';
import 'package:learning_bloc/models/casinum.dart';
import 'package:learning_bloc/models/db_name.dart';

class CasinumBloc extends Bloc<CasinumsEvent, CasinumsState> {

  static final _casinumBox = Hive.box<Casinum>(DbName.getCasinumBaseName());

  CasinumBloc():super(CasinumsInit(
    _casinumBox.values.where((item) => !item.delFlg).toList()
  )) {

    on<CasinumsAdd> ((event, emit) async {
      await _casinumBox.put(event.addedItem.id, event.addedItem);
      state.casinums.add(event.addedItem);
      emit(CasinumsInit(state.casinums));
    },);
    
    on<CasinumDelete> ((event, emit) async {
      var casinums = state.casinums;
      for(int i = state.itemSelecteds.length - 1; i >= 0; i--){
        if(state.itemSelecteds[i]) {
          // get casinum data
          var tempCasi = casinums[i]..delFlg = true;
          await _casinumBox.put(tempCasi.id, tempCasi);
          casinums.removeAt(i);
        }
      }
      emit(CasinumsInit(casinums));
    },);
    
    on<CasinumsSelected> ((event, emit) {
      state.itemSelecteds[event.seletedIndex] = !state.itemSelecteds[event.seletedIndex];
      int changedValue = state.itemSelecteds[event.seletedIndex] ? 1 : -1;
      emit(CasinumsUpdate(state.casinums, state.itemSelecteds, state.selectedNumber + changedValue));
    },);

    on<CasinumRefresh> ((event, emit) {
      emit(CasinumsInit(_casinumBox.values.where((item) => !item.delFlg).toList()));
    },);
  }
}