// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MovieRouterTearOff {
  const _$MovieRouterTearOff();

  _Popular popular() {
    return const _Popular();
  }
}

/// @nodoc
const $MovieRouter = _$MovieRouterTearOff();

/// @nodoc
mixin _$MovieRouter {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() popular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? popular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? popular,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Popular value) popular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Popular value)? popular,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Popular value)? popular,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieRouterCopyWith<$Res> {
  factory $MovieRouterCopyWith(
          MovieRouter value, $Res Function(MovieRouter) then) =
      _$MovieRouterCopyWithImpl<$Res>;
}

/// @nodoc
class _$MovieRouterCopyWithImpl<$Res> implements $MovieRouterCopyWith<$Res> {
  _$MovieRouterCopyWithImpl(this._value, this._then);

  final MovieRouter _value;
  // ignore: unused_field
  final $Res Function(MovieRouter) _then;
}

/// @nodoc
abstract class _$PopularCopyWith<$Res> {
  factory _$PopularCopyWith(_Popular value, $Res Function(_Popular) then) =
      __$PopularCopyWithImpl<$Res>;
}

/// @nodoc
class __$PopularCopyWithImpl<$Res> extends _$MovieRouterCopyWithImpl<$Res>
    implements _$PopularCopyWith<$Res> {
  __$PopularCopyWithImpl(_Popular _value, $Res Function(_Popular) _then)
      : super(_value, (v) => _then(v as _Popular));

  @override
  _Popular get _value => super._value as _Popular;
}

/// @nodoc

class _$_Popular extends _Popular {
  const _$_Popular() : super._();

  @override
  String toString() {
    return 'MovieRouter.popular()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Popular);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() popular,
  }) {
    return popular();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? popular,
  }) {
    return popular?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? popular,
    required TResult orElse(),
  }) {
    if (popular != null) {
      return popular();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Popular value) popular,
  }) {
    return popular(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Popular value)? popular,
  }) {
    return popular?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Popular value)? popular,
    required TResult orElse(),
  }) {
    if (popular != null) {
      return popular(this);
    }
    return orElse();
  }
}

abstract class _Popular extends MovieRouter {
  const factory _Popular() = _$_Popular;
  const _Popular._() : super._();
}
