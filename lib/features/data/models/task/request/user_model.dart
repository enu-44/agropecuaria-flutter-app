

import 'package:agropecuariosapp/features/domain/entities/task/request/task.request.entity.dart';

class TaskRequestModel extends TaskRequestEntity{
  final String? id;
  final String title;
  final String description;
  final String expiration;
  final String status;



   TaskRequestModel({
    this.id,
    required this.title,
    required this.description,
    required this.expiration,
    required this.status,
  }) : super(
    id: id,
    title: title,
    description: description,
    expiration: expiration,
    status: status,
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "expiration": expiration,
    "status": status,
  };
  
}