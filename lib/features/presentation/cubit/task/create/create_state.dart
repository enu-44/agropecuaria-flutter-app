part of 'create_cubit.dart';

@immutable
abstract class TaskCreateState extends Equatable {
  const TaskCreateState();
}

class TaskCreateInitial extends TaskCreateState {
  @override
  List<Object> get props => [];
}

class TaskCreateLoading extends TaskCreateState {
  @override
  List<Object> get props => [];
}


class TaskCreateuccess extends TaskCreateState {
  @override
  List<Object> get props => [];
}


class TaskCreateFailure extends TaskCreateState {
  @override
  List<Object> get props => [];
}
