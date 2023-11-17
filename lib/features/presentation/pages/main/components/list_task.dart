// ignore_for_file: prefer_const_constructors

import 'package:agropecuariosapp/features/presentation/cubit/task/list/list_cubit.dart';
import 'package:agropecuariosapp/features/presentation/widgets/cards_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../consts.dart';

import '../../../../../injection_container.dart' as di;

class ListTask extends StatefulWidget {
  final String udi;
  final String selectedStatus;
  const ListTask({ Key? key,  required this.udi, required this.selectedStatus}) : super(key: key);

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskListCubit>(
      create: (context) => di.sl<TaskListCubit>()
        ..list(),
      child: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, taskState) {
          if (taskState is TaskListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (taskState is TaskListFailure) {
            toast("Some Failure occured while creating the post");
          }
          if (taskState is TaskListLoaded) {
            final filteredTasks = widget.selectedStatus == 'Todos' ? taskState.taskList 
            : taskState.taskList.where((task) => task.status == widget.selectedStatus).toList();
            return taskState.taskList.isEmpty
                ? _notaskYetWidget()
                : ListView.builder(
                    itemCount: filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = filteredTasks[index];
                      return BlocProvider(
                        create: (context) => di.sl<TaskListCubit>(),
                        child: cardsTask(task: task),
                      );
                    },
                  );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

   _notaskYetWidget() {
    return Center(child: Text("No Task", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),);
  }
}