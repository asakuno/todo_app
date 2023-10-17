import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item_request.freezed.dart';
part 'todo_item_request.g.dart';

@freezed
class TodoItemRequest with _$TodoItemRequest {
  const factory TodoItemRequest({
    required int id,
    required String title,
    @Default(false) bool done,
  }) = _TodoItemRequest;

  factory TodoItemRequest.fromJson(Map<String, dynamic> json) => _$TodoItemRequestFromJson(json);
}

@freezed
class TodoDataListRequest with _$TodoDataListRequest {
  const factory TodoDataListRequest({
    required List<TodoItemRequest> data,
  }) = _TodoDataListRequest;

  factory TodoDataListRequest.fromJson(Map<String, dynamic> json) => _$TodoDataListRequestFromJson(json);
}