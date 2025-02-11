import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/casinums/casinum_event.dart';
import 'package:learning_bloc/casinums/casinum_state.dart';
import 'package:learning_bloc/models/casinum.dart';

class CasinumBloc extends Bloc<CasinumsEvent, CasinumsState> {
  CasinumBloc():super(CasinumsInit([
    Casinum(key: 1, name: "name1", delFlg: false, deafaultBet: 2, initDate: DateTime.now()),
    Casinum(key: 2, name: "name2", delFlg: false, deafaultBet: 2, initDate: DateTime.now()),
    Casinum(key: 3, name: "name3", delFlg: false, deafaultBet: 2, initDate: DateTime.now()),
    Casinum(key: 4, name: "name4", delFlg: false, deafaultBet: 2, initDate: DateTime.now()),
  ])) {
    on<CasinumsAdd> ((event, emit) {
      state.casinums.add(event.addedItem);
      state.itemSelecteds.add(false);
      emit(CasinumsUpdate(state.casinums, state.itemSelecteds, state.selectedNumber));
    },);
    
    on<CasinumDelete> ((event, emit) {
      for(int i = state.itemSelecteds.length-1; i >= 0; i--){
        if(state.itemSelecteds[i]){
          state.itemSelecteds.removeAt(i);
          state.casinums.removeAt(i);
        }
      }
      emit(CasinumsUpdate(state.casinums, state.itemSelecteds, 0));
    },);
    
    on<CasinumsSelected> ((event, emit) {
      state.itemSelecteds[event.seletedIndex] = !state.itemSelecteds[event.seletedIndex];
      int changedValue = state.itemSelecteds[event.seletedIndex] ? 1 : -1;
      emit(CasinumsUpdate(state.casinums, state.itemSelecteds, state.selectedNumber + changedValue));
    },);

    on<CasinumsUnSelectedAll> ((event, emit) {
      // ignore: unused_local_variable
      for (var item in state.itemSelecteds) {
        item = false;
      }
      emit(CasinumsUpdate(state.casinums, state.itemSelecteds, 0));
    },);
  }
}