// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeResponseModelAdapter extends TypeAdapter<RecipeResponseModel> {
  @override
  final int typeId = 0;

  @override
  RecipeResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeResponseModel(
      news: (fields[1] as List).cast<RecipeModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeResponseModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.news);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 1;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      id: fields[1] as String,
      title: fields[2] as String?,
      text: fields[3] as String?,
      image: fields[4] as String?,
      steps: (fields[5] as List?)?.cast<RecipeStepModel>(),
      prepTime: fields[6] as String?,
      energy: (fields[7] as List?)?.cast<EnergyValueModel>(),
      ingredientsOne: (fields[8] as List?)?.cast<IngredientModel>(),
      ingredientsTwo: (fields[9] as List?)?.cast<IngredientModel>(),
      dateAdded: fields[10] as String?,
      link: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.steps)
      ..writeByte(6)
      ..write(obj.prepTime)
      ..writeByte(7)
      ..write(obj.energy)
      ..writeByte(8)
      ..write(obj.ingredientsOne)
      ..writeByte(9)
      ..write(obj.ingredientsTwo)
      ..writeByte(10)
      ..write(obj.dateAdded)
      ..writeByte(11)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecipeStepModelAdapter extends TypeAdapter<RecipeStepModel> {
  @override
  final int typeId = 2;

  @override
  RecipeStepModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeStepModel(
      text: fields[1] as String?,
      image1: fields[2] as String?,
      image2: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RecipeStepModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.image1)
      ..writeByte(3)
      ..write(obj.image2);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeStepModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EnergyValueModelAdapter extends TypeAdapter<EnergyValueModel> {
  @override
  final int typeId = 3;

  @override
  EnergyValueModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnergyValueModel(
      title: fields[1] as String?,
      text: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EnergyValueModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnergyValueModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class IngredientModelAdapter extends TypeAdapter<IngredientModel> {
  @override
  final int typeId = 4;

  @override
  IngredientModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IngredientModel(
      title: fields[1] as String?,
      text: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IngredientModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IngredientModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeResponseModelImpl _$$RecipeResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeResponseModelImpl(
      news: (json['news'] as List<dynamic>)
          .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecipeResponseModelImplToJson(
        _$RecipeResponseModelImpl instance) =>
    <String, dynamic>{
      'news': instance.news,
    };

_$RecipeModelImpl _$$RecipeModelImplFromJson(Map<String, dynamic> json) =>
    _$RecipeModelImpl(
      id: json['id'] as String,
      title: json['title'] as String?,
      text: json['text'] as String?,
      image: json['image'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => RecipeStepModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      prepTime: json['prep_time'] as String?,
      energy: (json['energy'] as List<dynamic>?)
          ?.map((e) => EnergyValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientsOne: (json['ingredients_one'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredientsTwo: (json['ingredients_two'] as List<dynamic>?)
          ?.map((e) => IngredientModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateAdded: json['date_added'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$RecipeModelImplToJson(_$RecipeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'image': instance.image,
      'steps': instance.steps,
      'prep_time': instance.prepTime,
      'energy': instance.energy,
      'ingredients_one': instance.ingredientsOne,
      'ingredients_two': instance.ingredientsTwo,
      'date_added': instance.dateAdded,
      'link': instance.link,
    };

_$RecipeStepModelImpl _$$RecipeStepModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecipeStepModelImpl(
      text: json['text'] as String?,
      image1: json['image1'] as String?,
      image2: json['image2'] as String?,
    );

Map<String, dynamic> _$$RecipeStepModelImplToJson(
        _$RecipeStepModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'image1': instance.image1,
      'image2': instance.image2,
    };

_$EnergyValueModelImpl _$$EnergyValueModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EnergyValueModelImpl(
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$EnergyValueModelImplToJson(
        _$EnergyValueModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
    };

_$IngredientModelImpl _$$IngredientModelImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientModelImpl(
      title: json['title'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$IngredientModelImplToJson(
        _$IngredientModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
    };
