// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, missing_required_param, avoid_print, dead_code, avoid_unnecessary_containers



import 'package:agropecuariosapp/consts.dart';
import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';
import 'package:agropecuariosapp/features/presentation/pages/main/components/list_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class MainScreen extends StatefulWidget {
  final String uid;

  const MainScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String? _selectedStatus;
  TaskRequestEntity taskForm = TaskRequestEntity(
    title: '',
    description: '',
    expiration: '',
    status: ''
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateTaskForm(TaskRequestEntity newTaskForm) {
  setState(() {
    taskForm = newTaskForm;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownButtonFormField<String>(
              value: _selectedStatus,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedStatus = newValue;
                });
              },
              items: <String>['Todos', 'PENDIENTE', 'COMPLETADO', 'EN PROGRESO', 'CANCELADO']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Expanded(
              child: ListTask(udi: widget.uid, selectedStatus: _selectedStatus ?? '') 
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, PageConst.TaskPage, (route) => false);
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


