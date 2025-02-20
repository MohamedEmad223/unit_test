import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test/get_list_with_cubit/data/repos/fetch_data_repo.dart';
import 'package:unit_test/get_list_with_cubit/logic/cubit/fetchdatacubit_cubit.dart';

class MocNetworkService extends Mock implements FetchDataRepo {}

void main() {
  late FetchdatacubitCubit fetchdatacubitCubit;
  late MocNetworkService mocNetworkService;

  setUp(() {
    mocNetworkService = MocNetworkService();
    fetchdatacubitCubit = FetchdatacubitCubit(mocNetworkService);
  });

  tearDown(() {
    fetchdatacubitCubit.close();
  });

  test('this is init states', () {
    expect(fetchdatacubitCubit.state, FetchdatacubitInitial());
  });

  blocTest<FetchdatacubitCubit, FetchdatacubitState>(
    'emit state dataLoading and state dataLoaded',
    build: () {
      when(mocNetworkService.fetchList())
          .thenAnswer((_) async => 'test title has been Loaded');
      return fetchdatacubitCubit;
    },
    act: (cubit) => cubit.fetchData(),
    expect: () => [
      FetchdatacubitLoading(),
      FetchdatacubitLoaded('test title has been Loaded')
    ],
  );

  blocTest('emit dataFaliureState',
      build: () {
        when(mocNetworkService.fetchList()).thenThrow(Exception('error'));
        return fetchdatacubitCubit;
      },
      act: (cubit) => cubit.fetchData(),
      expect: () => {FetchdatacubitError('error')});
}
