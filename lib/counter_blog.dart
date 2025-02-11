import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/counter_event.dart';
import 'package:learning_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<Increment>((event, emit) {
      emit(CounterUpdated(state.value + 1));
    });

    on<Decrement>((event, emit) {
      emit(CounterUpdated(state.value - 1));
    });
  }
}
