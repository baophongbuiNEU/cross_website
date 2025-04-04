// lib/models/list_item.dart
class ListItem {
  final int id;
  final String name;

  ListItem({required this.id, required this.name});

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}