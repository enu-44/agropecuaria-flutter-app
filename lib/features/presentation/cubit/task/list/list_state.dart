part of 'list_cubit.dart';

@immutable
abstract class TaskListState extends Equatable {
  const TaskListState();
}

class TaskListInitial extends TaskListState {
  @override
  List<Object> get props => [];
}

class TaskListLoading extends TaskListState {
  @override
  List<Object> get props => [];
}


class TaskListuccess extends TaskListState {
  @override
  List<Object> get props => [];
}

class TaskListLoaded extends TaskListState {
  final List<TaskEntity> taskList;

  TaskListLoaded({required this.taskList});
  @override
  List<Object> get props => [taskList];
}


class TaskListFailure extends TaskListState {
  @override
  List<Object> get props => [];
}
