import 'package:backend/hash_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'list_repository.g.dart';

@visibleForTesting
Map<String, TaskList> listDb = {};

@JsonSerializable()
class TaskList extends Equatable {
  const TaskList({required this.id, required this.name});

  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);

  final String id;
  final String name;
  Map<String, dynamic> toJson() => _$TaskListToJson(this);
  TaskList copyWith({
    String? id,
    String? name,
  }) {
    return TaskList(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}

class TaskListRepository {
  Future<TaskList> listById(String id) async {
    return listDb[id]!;
  }

  Map<String, dynamic> getAllLists() {
    final formattedLists = <String, dynamic>{};
    if (listDb.isNotEmpty) {
      listDb.forEach(
        (String id) {
          final currentList = listDb[id];
          formattedLists[id] = currentList!.toJson();
        } as void Function(String, TaskList),
      );
    }
    return formattedLists;
  }

  String createList({required String name}) {
    final id = name.hashValue;
    final list = TaskList(id: id, name: name);
    listDb[id] = list;
    return id;
  }

  void deleteList(String id) {
    listDb.remove(id);
  }

  Future<void> updateList({required String id, required String name}) async {
    final currentList = listDb[id];
    if (currentList == null) {
      return Future.error(Exception('List not found'));
    }
    listDb[id] = TaskList(id: id, name: name);
  }
}
