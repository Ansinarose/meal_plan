// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecipeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 0;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      title: fields[0] as String,
      preparationTime: fields[1] as String,
      cookingTime: fields[2] as String,
      category: fields[3] as String,
      ingredients: fields[4] as String,
      description: fields[5] as String,
      nutrition: fields[6] as String,
      image: fields[7] as String? ?? '',
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.preparationTime)
      ..writeByte(2)
      ..write(obj.cookingTime)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.ingredients)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.nutrition)
      ..writeByte(7)
      ..write(obj.image);
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
