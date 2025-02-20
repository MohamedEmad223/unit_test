import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unit_test/get_list/model/posts_model.dart';
import 'package:unit_test/get_list_with_cubit/data/repos/fetch_data_repo.dart';

part 'fetchdatacubit_state.dart';

class FetchdatacubitCubit extends Cubit<FetchdatacubitState> {
  FetchdatacubitCubit(this._fetchDataRepo) : super(FetchdatacubitInitial());

  final FetchDataRepo _fetchDataRepo;

  Future<void> fetchData() async {
    emit(FetchdatacubitLoading());
    try {
      final posts = await _fetchDataRepo.fetchList();
      emit(FetchdatacubitLoaded(posts));
    } catch (e) {
      emit(FetchdatacubitError(e.toString()));
    }
  }

}
