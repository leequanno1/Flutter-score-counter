abstract class CounterState {
  final int value;
  CounterState(this.value);
}

class CounterInitial extends CounterState {
  CounterInitial() : super(0);
}

class CounterUpdated extends CounterState {
  CounterUpdated(super.value);
}
