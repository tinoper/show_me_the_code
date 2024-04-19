// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  GenerateStatus get generateStatus => throw _privateConstructorUsedError;
  Uint8List? get file => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  String? get geminiApiKey => throw _privateConstructorUsedError;
  String get generatedCode => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {GenerateStatus generateStatus,
      Uint8List? file,
      String? mimeType,
      String? geminiApiKey,
      String generatedCode,
      String? errorMessage});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generateStatus = null,
    Object? file = freezed,
    Object? mimeType = freezed,
    Object? geminiApiKey = freezed,
    Object? generatedCode = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      generateStatus: null == generateStatus
          ? _value.generateStatus
          : generateStatus // ignore: cast_nullable_to_non_nullable
              as GenerateStatus,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      geminiApiKey: freezed == geminiApiKey
          ? _value.geminiApiKey
          : geminiApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedCode: null == generatedCode
          ? _value.generatedCode
          : generatedCode // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenerateStatus generateStatus,
      Uint8List? file,
      String? mimeType,
      String? geminiApiKey,
      String generatedCode,
      String? errorMessage});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generateStatus = null,
    Object? file = freezed,
    Object? mimeType = freezed,
    Object? geminiApiKey = freezed,
    Object? generatedCode = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$HomePageStateImpl(
      generateStatus: null == generateStatus
          ? _value.generateStatus
          : generateStatus // ignore: cast_nullable_to_non_nullable
              as GenerateStatus,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      geminiApiKey: freezed == geminiApiKey
          ? _value.geminiApiKey
          : geminiApiKey // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedCode: null == generatedCode
          ? _value.generatedCode
          : generatedCode // ignore: cast_nullable_to_non_nullable
              as String,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  const _$HomePageStateImpl(
      {this.generateStatus = GenerateStatus.loading,
      this.file,
      this.mimeType,
      this.geminiApiKey,
      this.generatedCode = '',
      this.errorMessage});

  @override
  @JsonKey()
  final GenerateStatus generateStatus;
  @override
  final Uint8List? file;
  @override
  final String? mimeType;
  @override
  final String? geminiApiKey;
  @override
  @JsonKey()
  final String generatedCode;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HomePageState(generateStatus: $generateStatus, file: $file, mimeType: $mimeType, geminiApiKey: $geminiApiKey, generatedCode: $generatedCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            (identical(other.generateStatus, generateStatus) ||
                other.generateStatus == generateStatus) &&
            const DeepCollectionEquality().equals(other.file, file) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.geminiApiKey, geminiApiKey) ||
                other.geminiApiKey == geminiApiKey) &&
            (identical(other.generatedCode, generatedCode) ||
                other.generatedCode == generatedCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      generateStatus,
      const DeepCollectionEquality().hash(file),
      mimeType,
      geminiApiKey,
      generatedCode,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  const factory _HomePageState(
      {final GenerateStatus generateStatus,
      final Uint8List? file,
      final String? mimeType,
      final String? geminiApiKey,
      final String generatedCode,
      final String? errorMessage}) = _$HomePageStateImpl;

  @override
  GenerateStatus get generateStatus;
  @override
  Uint8List? get file;
  @override
  String? get mimeType;
  @override
  String? get geminiApiKey;
  @override
  String get generatedCode;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
