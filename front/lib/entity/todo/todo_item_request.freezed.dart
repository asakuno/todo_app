// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoItemRequest _$TodoItemRequestFromJson(Map<String, dynamic> json) {
  return _TodoItemRequest.fromJson(json);
}

/// @nodoc
mixin _$TodoItemRequest {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemRequestCopyWith<TodoItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemRequestCopyWith<$Res> {
  factory $TodoItemRequestCopyWith(
          TodoItemRequest value, $Res Function(TodoItemRequest) then) =
      _$TodoItemRequestCopyWithImpl<$Res, TodoItemRequest>;
  @useResult
  $Res call({int id, String title, bool done});
}

/// @nodoc
class _$TodoItemRequestCopyWithImpl<$Res, $Val extends TodoItemRequest>
    implements $TodoItemRequestCopyWith<$Res> {
  _$TodoItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodoItemRequestCopyWith<$Res>
    implements $TodoItemRequestCopyWith<$Res> {
  factory _$$_TodoItemRequestCopyWith(
          _$_TodoItemRequest value, $Res Function(_$_TodoItemRequest) then) =
      __$$_TodoItemRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, bool done});
}

/// @nodoc
class __$$_TodoItemRequestCopyWithImpl<$Res>
    extends _$TodoItemRequestCopyWithImpl<$Res, _$_TodoItemRequest>
    implements _$$_TodoItemRequestCopyWith<$Res> {
  __$$_TodoItemRequestCopyWithImpl(
      _$_TodoItemRequest _value, $Res Function(_$_TodoItemRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? done = null,
  }) {
    return _then(_$_TodoItemRequest(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoItemRequest implements _TodoItemRequest {
  const _$_TodoItemRequest(
      {required this.id, required this.title, this.done = false});

  factory _$_TodoItemRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TodoItemRequestFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString() {
    return 'TodoItemRequest(id: $id, title: $title, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoItemRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodoItemRequestCopyWith<_$_TodoItemRequest> get copyWith =>
      __$$_TodoItemRequestCopyWithImpl<_$_TodoItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoItemRequestToJson(
      this,
    );
  }
}

abstract class _TodoItemRequest implements TodoItemRequest {
  const factory _TodoItemRequest(
      {required final int id,
      required final String title,
      final bool done}) = _$_TodoItemRequest;

  factory _TodoItemRequest.fromJson(Map<String, dynamic> json) =
      _$_TodoItemRequest.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$_TodoItemRequestCopyWith<_$_TodoItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
