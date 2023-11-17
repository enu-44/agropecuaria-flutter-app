// ignore_for_file: camel_case_types, prefer_const_constructors, unnecessary_new, avoid_print

import 'package:agropecuariosapp/features/domain/entities/task/task.entity.dart';
import 'package:agropecuariosapp/features/presentation/cubit/task/delete/delete_cubit.dart';
import 'package:agropecuariosapp/features/presentation/pages/task/task.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../consts.dart';
import 'hextorgba_color.dart';

class cardsTask extends StatefulWidget {
  final TaskEntity task;
  const cardsTask({ Key? key, required this.task}) : super(key: key);

  @override
  State<cardsTask> createState() => _cardsTaskState();
}

class _cardsTaskState extends State<cardsTask> {
  bool isHover = false;
  Offset mousPos = Offset(0, 0);

   // Función para mostrar el diálogo de confirmación de eliminación
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar esta tarea?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _delete();
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 5,
        child: GestureDetector(
          onLongPress: () {
            _showDeleteConfirmationDialog(context);
          },
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskScreen(task: widget.task, title: 'EDITAR TAREA'),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: hexOrRGBToColor(
                        widget.task.status == 'PENDIENTE'
                            ? '#DE9307'
                            : widget.task.status == 'COMPLETADO'
                                ? '#98CF68'
                                : widget.task.status == 'EN PROGRESO'
                                    ? '#68CFAB'
                                    : '#CC183E')
                    .withOpacity(.2),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${widget.task.title}",
                    style: TextStyle(fontSize: 25, color: hexOrRGBToColor('#000000'), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "${widget.task.description}",
                    style: TextStyle(fontSize: 16, color: hexOrRGBToColor('#000000')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _delete() async {
      BlocProvider.of<TaskDeleteCubit>(context).delete(
          params: int.parse(widget.task.id!)
      ).then((value) => Navigator.pushNamedAndRemoveUntil(context, PageConst.HomePage, (route) => false));
  }
}