// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItemRequest _$$_TodoItemRequestFromJson(Map<String, dynamic> json) =>
    _$_TodoItemRequest(
      id: json['id'] as int,
      title: json['title'] as String,
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoItemRequestToJson(_$_TodoItemRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'done': instance.done,
    };
