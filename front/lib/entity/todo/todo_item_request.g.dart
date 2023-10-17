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

_$_TodoDataListRequest _$$_TodoDataListRequestFromJson(
        Map<String, dynamic> json) =>
    _$_TodoDataListRequest(
      data: (json['data'] as List<dynamic>)
          .map((e) => TodoItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TodoDataListRequestToJson(
        _$_TodoDataListRequest instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
