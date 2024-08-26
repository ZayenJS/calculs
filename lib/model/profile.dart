import 'package:calculs/model/timestamps.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

const profilesTable = SqfEntityTable(
  tableName: 'profiles',
  primaryKeyName: 'id',
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  useSoftDeleting: false,
  modelName: "Profile",
  fields: [
    SqfEntityField('name', DbType.text, isNotNull: true),
    SqfEntityField('picture', DbType.text),
    SqfEntityField(
      'additions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'correct_additions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'subtractions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'correct_subtractions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'multiplications',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'correct_multiplications',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'divisions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    SqfEntityField(
      'correct_divisions',
      DbType.integer,
      isNotNull: true,
      defaultValue: 0,
    ),
    ...timestamps,
  ],
);
