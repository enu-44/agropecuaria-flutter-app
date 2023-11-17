part of 'delete_cubit.dart';

@immutable
abstract class TaskDeleteState extends Equatable {
  const TaskDeleteState();
}

class TaskDeleteInitial extends TaskDeleteState {
  @override
  List<Object> get props => [];
}

class TaskDeleteLoading extends TaskDeleteState {
  @override
  List<Object> get props => [];
}


class TaskDeleteuccess extends TaskDeleteState {
  @override
  List<Object> get props => [];
}


class TaskDeleteFailure extends TaskDeleteState {
  @override
  List<Object> get props => [];
}
