// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecipeResponseModel _$RecipeResponseModelFromJson(Map<String, dynamic> json) {
  return _RecipeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeResponseModel {
  @HiveField(1)
  List<RecipeModel> get news => throw _privateConstructorUsedError;

  /// Serializes this RecipeResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeResponseModelCopyWith<RecipeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeResponseModelCopyWith<$Res> {
  factory $RecipeResponseModelCopyWith(
          RecipeResponseModel value, $Res Function(RecipeResponseModel) then) =
      _$RecipeResponseModelCopyWithImpl<$Res, RecipeResponseModel>;
  @useResult
  $Res call({@HiveField(1) List<RecipeModel> news});
}

/// @nodoc
class _$RecipeResponseModelCopyWithImpl<$Res, $Val extends RecipeResponseModel>
    implements $RecipeResponseModelCopyWith<$Res> {
  _$RecipeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_value.copyWith(
      news: null == news
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeResponseModelImplCopyWith<$Res>
    implements $RecipeResponseModelCopyWith<$Res> {
  factory _$$RecipeResponseModelImplCopyWith(_$RecipeResponseModelImpl value,
          $Res Function(_$RecipeResponseModelImpl) then) =
      __$$RecipeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(1) List<RecipeModel> news});
}

/// @nodoc
class __$$RecipeResponseModelImplCopyWithImpl<$Res>
    extends _$RecipeResponseModelCopyWithImpl<$Res, _$RecipeResponseModelImpl>
    implements _$$RecipeResponseModelImplCopyWith<$Res> {
  __$$RecipeResponseModelImplCopyWithImpl(_$RecipeResponseModelImpl _value,
      $Res Function(_$RecipeResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? news = null,
  }) {
    return _then(_$RecipeResponseModelImpl(
      news: null == news
          ? _value._news
          : news // ignore: cast_nullable_to_non_nullable
              as List<RecipeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(1)
class _$RecipeResponseModelImpl implements _RecipeResponseModel {
  _$RecipeResponseModelImpl(
      {@HiveField(1) required final List<RecipeModel> news})
      : _news = news;

  factory _$RecipeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeResponseModelImplFromJson(json);

  final List<RecipeModel> _news;
  @override
  @HiveField(1)
  List<RecipeModel> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'RecipeResponseModel(news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeResponseModelImpl &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_news));

  /// Create a copy of RecipeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeResponseModelImplCopyWith<_$RecipeResponseModelImpl> get copyWith =>
      __$$RecipeResponseModelImplCopyWithImpl<_$RecipeResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeResponseModel implements RecipeResponseModel {
  factory _RecipeResponseModel(
          {@HiveField(1) required final List<RecipeModel> news}) =
      _$RecipeResponseModelImpl;

  factory _RecipeResponseModel.fromJson(Map<String, dynamic> json) =
      _$RecipeResponseModelImpl.fromJson;

  @override
  @HiveField(1)
  List<RecipeModel> get news;

  /// Create a copy of RecipeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeResponseModelImplCopyWith<_$RecipeResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) {
  return _RecipeModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeModel {
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get text => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get image => throw _privateConstructorUsedError;
  @HiveField(5)
  List<RecipeStepModel>? get steps => throw _privateConstructorUsedError;
  @JsonKey(name: 'prep_time')
  @HiveField(6)
  String? get prepTime => throw _privateConstructorUsedError;
  @HiveField(7)
  List<EnergyValueModel>? get energy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_one')
  @HiveField(8)
  List<IngredientModel>? get ingredientsOne =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredients_two')
  @HiveField(9)
  List<IngredientModel>? get ingredientsTwo =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'date_added')
  @HiveField(10)
  String? get dateAdded => throw _privateConstructorUsedError;
  @HiveField(11)
  String? get link => throw _privateConstructorUsedError;

  /// Serializes this RecipeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeModelCopyWith<RecipeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeModelCopyWith<$Res> {
  factory $RecipeModelCopyWith(
          RecipeModel value, $Res Function(RecipeModel) then) =
      _$RecipeModelCopyWithImpl<$Res, RecipeModel>;
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String? title,
      @HiveField(3) String? text,
      @HiveField(4) String? image,
      @HiveField(5) List<RecipeStepModel>? steps,
      @JsonKey(name: 'prep_time') @HiveField(6) String? prepTime,
      @HiveField(7) List<EnergyValueModel>? energy,
      @JsonKey(name: 'ingredients_one')
      @HiveField(8)
      List<IngredientModel>? ingredientsOne,
      @JsonKey(name: 'ingredients_two')
      @HiveField(9)
      List<IngredientModel>? ingredientsTwo,
      @JsonKey(name: 'date_added') @HiveField(10) String? dateAdded,
      @HiveField(11) String? link});
}

/// @nodoc
class _$RecipeModelCopyWithImpl<$Res, $Val extends RecipeModel>
    implements $RecipeModelCopyWith<$Res> {
  _$RecipeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? text = freezed,
    Object? image = freezed,
    Object? steps = freezed,
    Object? prepTime = freezed,
    Object? energy = freezed,
    Object? ingredientsOne = freezed,
    Object? ingredientsTwo = freezed,
    Object? dateAdded = freezed,
    Object? link = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStepModel>?,
      prepTime: freezed == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String?,
      energy: freezed == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as List<EnergyValueModel>?,
      ingredientsOne: freezed == ingredientsOne
          ? _value.ingredientsOne
          : ingredientsOne // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      ingredientsTwo: freezed == ingredientsTwo
          ? _value.ingredientsTwo
          : ingredientsTwo // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeModelImplCopyWith<$Res>
    implements $RecipeModelCopyWith<$Res> {
  factory _$$RecipeModelImplCopyWith(
          _$RecipeModelImpl value, $Res Function(_$RecipeModelImpl) then) =
      __$$RecipeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String id,
      @HiveField(2) String? title,
      @HiveField(3) String? text,
      @HiveField(4) String? image,
      @HiveField(5) List<RecipeStepModel>? steps,
      @JsonKey(name: 'prep_time') @HiveField(6) String? prepTime,
      @HiveField(7) List<EnergyValueModel>? energy,
      @JsonKey(name: 'ingredients_one')
      @HiveField(8)
      List<IngredientModel>? ingredientsOne,
      @JsonKey(name: 'ingredients_two')
      @HiveField(9)
      List<IngredientModel>? ingredientsTwo,
      @JsonKey(name: 'date_added') @HiveField(10) String? dateAdded,
      @HiveField(11) String? link});
}

/// @nodoc
class __$$RecipeModelImplCopyWithImpl<$Res>
    extends _$RecipeModelCopyWithImpl<$Res, _$RecipeModelImpl>
    implements _$$RecipeModelImplCopyWith<$Res> {
  __$$RecipeModelImplCopyWithImpl(
      _$RecipeModelImpl _value, $Res Function(_$RecipeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? text = freezed,
    Object? image = freezed,
    Object? steps = freezed,
    Object? prepTime = freezed,
    Object? energy = freezed,
    Object? ingredientsOne = freezed,
    Object? ingredientsTwo = freezed,
    Object? dateAdded = freezed,
    Object? link = freezed,
  }) {
    return _then(_$RecipeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RecipeStepModel>?,
      prepTime: freezed == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String?,
      energy: freezed == energy
          ? _value._energy
          : energy // ignore: cast_nullable_to_non_nullable
              as List<EnergyValueModel>?,
      ingredientsOne: freezed == ingredientsOne
          ? _value._ingredientsOne
          : ingredientsOne // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      ingredientsTwo: freezed == ingredientsTwo
          ? _value._ingredientsTwo
          : ingredientsTwo // ignore: cast_nullable_to_non_nullable
              as List<IngredientModel>?,
      dateAdded: freezed == dateAdded
          ? _value.dateAdded
          : dateAdded // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$RecipeModelImpl implements _RecipeModel {
  _$RecipeModelImpl(
      {@HiveField(1) required this.id,
      @HiveField(2) this.title,
      @HiveField(3) this.text,
      @HiveField(4) this.image,
      @HiveField(5) final List<RecipeStepModel>? steps,
      @JsonKey(name: 'prep_time') @HiveField(6) this.prepTime,
      @HiveField(7) final List<EnergyValueModel>? energy,
      @JsonKey(name: 'ingredients_one')
      @HiveField(8)
      final List<IngredientModel>? ingredientsOne,
      @JsonKey(name: 'ingredients_two')
      @HiveField(9)
      final List<IngredientModel>? ingredientsTwo,
      @JsonKey(name: 'date_added') @HiveField(10) this.dateAdded,
      @HiveField(11) this.link})
      : _steps = steps,
        _energy = energy,
        _ingredientsOne = ingredientsOne,
        _ingredientsTwo = ingredientsTwo;

  factory _$RecipeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeModelImplFromJson(json);

  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String? title;
  @override
  @HiveField(3)
  final String? text;
  @override
  @HiveField(4)
  final String? image;
  final List<RecipeStepModel>? _steps;
  @override
  @HiveField(5)
  List<RecipeStepModel>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'prep_time')
  @HiveField(6)
  final String? prepTime;
  final List<EnergyValueModel>? _energy;
  @override
  @HiveField(7)
  List<EnergyValueModel>? get energy {
    final value = _energy;
    if (value == null) return null;
    if (_energy is EqualUnmodifiableListView) return _energy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientModel>? _ingredientsOne;
  @override
  @JsonKey(name: 'ingredients_one')
  @HiveField(8)
  List<IngredientModel>? get ingredientsOne {
    final value = _ingredientsOne;
    if (value == null) return null;
    if (_ingredientsOne is EqualUnmodifiableListView) return _ingredientsOne;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<IngredientModel>? _ingredientsTwo;
  @override
  @JsonKey(name: 'ingredients_two')
  @HiveField(9)
  List<IngredientModel>? get ingredientsTwo {
    final value = _ingredientsTwo;
    if (value == null) return null;
    if (_ingredientsTwo is EqualUnmodifiableListView) return _ingredientsTwo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'date_added')
  @HiveField(10)
  final String? dateAdded;
  @override
  @HiveField(11)
  final String? link;

  @override
  String toString() {
    return 'RecipeModel(id: $id, title: $title, text: $text, image: $image, steps: $steps, prepTime: $prepTime, energy: $energy, ingredientsOne: $ingredientsOne, ingredientsTwo: $ingredientsTwo, dateAdded: $dateAdded, link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.prepTime, prepTime) ||
                other.prepTime == prepTime) &&
            const DeepCollectionEquality().equals(other._energy, _energy) &&
            const DeepCollectionEquality()
                .equals(other._ingredientsOne, _ingredientsOne) &&
            const DeepCollectionEquality()
                .equals(other._ingredientsTwo, _ingredientsTwo) &&
            (identical(other.dateAdded, dateAdded) ||
                other.dateAdded == dateAdded) &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      text,
      image,
      const DeepCollectionEquality().hash(_steps),
      prepTime,
      const DeepCollectionEquality().hash(_energy),
      const DeepCollectionEquality().hash(_ingredientsOne),
      const DeepCollectionEquality().hash(_ingredientsTwo),
      dateAdded,
      link);

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      __$$RecipeModelImplCopyWithImpl<_$RecipeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeModel implements RecipeModel {
  factory _RecipeModel(
      {@HiveField(1) required final String id,
      @HiveField(2) final String? title,
      @HiveField(3) final String? text,
      @HiveField(4) final String? image,
      @HiveField(5) final List<RecipeStepModel>? steps,
      @JsonKey(name: 'prep_time') @HiveField(6) final String? prepTime,
      @HiveField(7) final List<EnergyValueModel>? energy,
      @JsonKey(name: 'ingredients_one')
      @HiveField(8)
      final List<IngredientModel>? ingredientsOne,
      @JsonKey(name: 'ingredients_two')
      @HiveField(9)
      final List<IngredientModel>? ingredientsTwo,
      @JsonKey(name: 'date_added') @HiveField(10) final String? dateAdded,
      @HiveField(11) final String? link}) = _$RecipeModelImpl;

  factory _RecipeModel.fromJson(Map<String, dynamic> json) =
      _$RecipeModelImpl.fromJson;

  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String? get title;
  @override
  @HiveField(3)
  String? get text;
  @override
  @HiveField(4)
  String? get image;
  @override
  @HiveField(5)
  List<RecipeStepModel>? get steps;
  @override
  @JsonKey(name: 'prep_time')
  @HiveField(6)
  String? get prepTime;
  @override
  @HiveField(7)
  List<EnergyValueModel>? get energy;
  @override
  @JsonKey(name: 'ingredients_one')
  @HiveField(8)
  List<IngredientModel>? get ingredientsOne;
  @override
  @JsonKey(name: 'ingredients_two')
  @HiveField(9)
  List<IngredientModel>? get ingredientsTwo;
  @override
  @JsonKey(name: 'date_added')
  @HiveField(10)
  String? get dateAdded;
  @override
  @HiveField(11)
  String? get link;

  /// Create a copy of RecipeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeModelImplCopyWith<_$RecipeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecipeStepModel _$RecipeStepModelFromJson(Map<String, dynamic> json) {
  return _RecipeStepModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeStepModel {
  @HiveField(1)
  String? get text => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get image1 => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get image2 => throw _privateConstructorUsedError;

  /// Serializes this RecipeStepModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeStepModelCopyWith<RecipeStepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStepModelCopyWith<$Res> {
  factory $RecipeStepModelCopyWith(
          RecipeStepModel value, $Res Function(RecipeStepModel) then) =
      _$RecipeStepModelCopyWithImpl<$Res, RecipeStepModel>;
  @useResult
  $Res call(
      {@HiveField(1) String? text,
      @HiveField(2) String? image1,
      @HiveField(3) String? image2});
}

/// @nodoc
class _$RecipeStepModelCopyWithImpl<$Res, $Val extends RecipeStepModel>
    implements $RecipeStepModelCopyWith<$Res> {
  _$RecipeStepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeStepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeStepModelImplCopyWith<$Res>
    implements $RecipeStepModelCopyWith<$Res> {
  factory _$$RecipeStepModelImplCopyWith(_$RecipeStepModelImpl value,
          $Res Function(_$RecipeStepModelImpl) then) =
      __$$RecipeStepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String? text,
      @HiveField(2) String? image1,
      @HiveField(3) String? image2});
}

/// @nodoc
class __$$RecipeStepModelImplCopyWithImpl<$Res>
    extends _$RecipeStepModelCopyWithImpl<$Res, _$RecipeStepModelImpl>
    implements _$$RecipeStepModelImplCopyWith<$Res> {
  __$$RecipeStepModelImplCopyWithImpl(
      _$RecipeStepModelImpl _value, $Res Function(_$RecipeStepModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeStepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(_$RecipeStepModelImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as String?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$RecipeStepModelImpl implements _RecipeStepModel {
  _$RecipeStepModelImpl(
      {@HiveField(1) this.text,
      @HiveField(2) this.image1,
      @HiveField(3) this.image2});

  factory _$RecipeStepModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeStepModelImplFromJson(json);

  @override
  @HiveField(1)
  final String? text;
  @override
  @HiveField(2)
  final String? image1;
  @override
  @HiveField(3)
  final String? image2;

  @override
  String toString() {
    return 'RecipeStepModel(text: $text, image1: $image1, image2: $image2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeStepModelImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.image1, image1) || other.image1 == image1) &&
            (identical(other.image2, image2) || other.image2 == image2));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, image1, image2);

  /// Create a copy of RecipeStepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeStepModelImplCopyWith<_$RecipeStepModelImpl> get copyWith =>
      __$$RecipeStepModelImplCopyWithImpl<_$RecipeStepModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeStepModelImplToJson(
      this,
    );
  }
}

abstract class _RecipeStepModel implements RecipeStepModel {
  factory _RecipeStepModel(
      {@HiveField(1) final String? text,
      @HiveField(2) final String? image1,
      @HiveField(3) final String? image2}) = _$RecipeStepModelImpl;

  factory _RecipeStepModel.fromJson(Map<String, dynamic> json) =
      _$RecipeStepModelImpl.fromJson;

  @override
  @HiveField(1)
  String? get text;
  @override
  @HiveField(2)
  String? get image1;
  @override
  @HiveField(3)
  String? get image2;

  /// Create a copy of RecipeStepModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeStepModelImplCopyWith<_$RecipeStepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnergyValueModel _$EnergyValueModelFromJson(Map<String, dynamic> json) {
  return _EnergyValueModel.fromJson(json);
}

/// @nodoc
mixin _$EnergyValueModel {
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this EnergyValueModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnergyValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnergyValueModelCopyWith<EnergyValueModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyValueModelCopyWith<$Res> {
  factory $EnergyValueModelCopyWith(
          EnergyValueModel value, $Res Function(EnergyValueModel) then) =
      _$EnergyValueModelCopyWithImpl<$Res, EnergyValueModel>;
  @useResult
  $Res call({@HiveField(1) String? title, @HiveField(2) String? text});
}

/// @nodoc
class _$EnergyValueModelCopyWithImpl<$Res, $Val extends EnergyValueModel>
    implements $EnergyValueModelCopyWith<$Res> {
  _$EnergyValueModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnergyValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyValueModelImplCopyWith<$Res>
    implements $EnergyValueModelCopyWith<$Res> {
  factory _$$EnergyValueModelImplCopyWith(_$EnergyValueModelImpl value,
          $Res Function(_$EnergyValueModelImpl) then) =
      __$$EnergyValueModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(1) String? title, @HiveField(2) String? text});
}

/// @nodoc
class __$$EnergyValueModelImplCopyWithImpl<$Res>
    extends _$EnergyValueModelCopyWithImpl<$Res, _$EnergyValueModelImpl>
    implements _$$EnergyValueModelImplCopyWith<$Res> {
  __$$EnergyValueModelImplCopyWithImpl(_$EnergyValueModelImpl _value,
      $Res Function(_$EnergyValueModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnergyValueModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
  }) {
    return _then(_$EnergyValueModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$EnergyValueModelImpl implements _EnergyValueModel {
  _$EnergyValueModelImpl({@HiveField(1) this.title, @HiveField(2) this.text});

  factory _$EnergyValueModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyValueModelImplFromJson(json);

  @override
  @HiveField(1)
  final String? title;
  @override
  @HiveField(2)
  final String? text;

  @override
  String toString() {
    return 'EnergyValueModel(title: $title, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyValueModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, text);

  /// Create a copy of EnergyValueModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyValueModelImplCopyWith<_$EnergyValueModelImpl> get copyWith =>
      __$$EnergyValueModelImplCopyWithImpl<_$EnergyValueModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyValueModelImplToJson(
      this,
    );
  }
}

abstract class _EnergyValueModel implements EnergyValueModel {
  factory _EnergyValueModel(
      {@HiveField(1) final String? title,
      @HiveField(2) final String? text}) = _$EnergyValueModelImpl;

  factory _EnergyValueModel.fromJson(Map<String, dynamic> json) =
      _$EnergyValueModelImpl.fromJson;

  @override
  @HiveField(1)
  String? get title;
  @override
  @HiveField(2)
  String? get text;

  /// Create a copy of EnergyValueModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnergyValueModelImplCopyWith<_$EnergyValueModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

IngredientModel _$IngredientModelFromJson(Map<String, dynamic> json) {
  return _IngredientModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientModel {
  @HiveField(1)
  String? get title => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get text => throw _privateConstructorUsedError;

  /// Serializes this IngredientModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientModelCopyWith<IngredientModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientModelCopyWith<$Res> {
  factory $IngredientModelCopyWith(
          IngredientModel value, $Res Function(IngredientModel) then) =
      _$IngredientModelCopyWithImpl<$Res, IngredientModel>;
  @useResult
  $Res call({@HiveField(1) String? title, @HiveField(2) String? text});
}

/// @nodoc
class _$IngredientModelCopyWithImpl<$Res, $Val extends IngredientModel>
    implements $IngredientModelCopyWith<$Res> {
  _$IngredientModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientModelImplCopyWith<$Res>
    implements $IngredientModelCopyWith<$Res> {
  factory _$$IngredientModelImplCopyWith(_$IngredientModelImpl value,
          $Res Function(_$IngredientModelImpl) then) =
      __$$IngredientModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(1) String? title, @HiveField(2) String? text});
}

/// @nodoc
class __$$IngredientModelImplCopyWithImpl<$Res>
    extends _$IngredientModelCopyWithImpl<$Res, _$IngredientModelImpl>
    implements _$$IngredientModelImplCopyWith<$Res> {
  __$$IngredientModelImplCopyWithImpl(
      _$IngredientModelImpl _value, $Res Function(_$IngredientModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? text = freezed,
  }) {
    return _then(_$IngredientModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveField(0)
class _$IngredientModelImpl implements _IngredientModel {
  _$IngredientModelImpl({@HiveField(1) this.title, @HiveField(2) this.text});

  factory _$IngredientModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientModelImplFromJson(json);

  @override
  @HiveField(1)
  final String? title;
  @override
  @HiveField(2)
  final String? text;

  @override
  String toString() {
    return 'IngredientModel(title: $title, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, text);

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      __$$IngredientModelImplCopyWithImpl<_$IngredientModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientModel implements IngredientModel {
  factory _IngredientModel(
      {@HiveField(1) final String? title,
      @HiveField(2) final String? text}) = _$IngredientModelImpl;

  factory _IngredientModel.fromJson(Map<String, dynamic> json) =
      _$IngredientModelImpl.fromJson;

  @override
  @HiveField(1)
  String? get title;
  @override
  @HiveField(2)
  String? get text;

  /// Create a copy of IngredientModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientModelImplCopyWith<_$IngredientModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
