import 'package:equatable/equatable.dart';

class TaskRequestEntity extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final String? expiration;
  final String status;

  TaskRequestEntity({
    this.id,
    required this.title,
    required this.description,
    required this.expiration,
    required this.status
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    expiration,
    status
  ];
}