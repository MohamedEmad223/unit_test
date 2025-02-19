import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test/bloc/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });


  // function that call after test
    tearDown(() {
      counterCubit.close();
    });

    test('the initial state for the CounterCubit is 0', () {
      expect(counterCubit.state, 0);
    });

    test('the CounterCubit state is incremented when the increment function is called', () {
      counterCubit.increment();
      expect(counterCubit.state, 1);
    });

    test('the CounterCubit state is decremented when the decrement function is called', () {
      counterCubit.decrement();
      expect(counterCubit.state, -1);
    });
  });
}
