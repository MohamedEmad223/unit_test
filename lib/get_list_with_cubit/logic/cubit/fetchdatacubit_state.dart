part of 'fetchdatacubit_cubit.dart';

sealed class FetchdatacubitState extends Equatable {
  const FetchdatacubitState();

  @override
  List<Object> get props => [];
}

final class FetchdatacubitInitial extends FetchdatacubitState {}

final class FetchdatacubitLoading extends FetchdatacubitState {}

final class FetchdatacubitLoaded extends FetchdatacubitState {
  final List<PostsModel> posts;
  const FetchdatacubitLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

final class FetchdatacubitError extends FetchdatacubitState {
  final String message;
  const FetchdatacubitError(this.message);

  @override
  List<Object> get props => [message];
}
