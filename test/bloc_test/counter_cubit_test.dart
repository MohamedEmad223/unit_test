import 'package:bloc_test/bloc_test.dart';
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

    blocTest(
        'the cubit should emit a CounterState of 1 when the increment function is called',
        build: () => counterCubit,
        act: (cubit) => cubit.increment(),
        expect: () => [1]);

    blocTest(
      'the cubit should emit a CounterState of -1 when the increment function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [-1],
    );
  });
}
