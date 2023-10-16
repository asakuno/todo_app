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

// @freezed
// class TodoDataRequest with _$TodoDataRequest {
//   const factory TodoDataRequest({
//     required List<TodoItemRequest> data,
//   }) = _TodoDataRequest;

//   factory TodoDataRequest.fromJson(Map<String, dynamic> json) => _$TodoDataRequestFromJson(json);
// }