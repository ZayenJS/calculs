import 'dart:convert';
import 'package:calculs/model/profile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

part 'model.g.dart';

const seqIdentity = SqfEntitySequence(
  sequenceName: 'identity',
);

@SqfEntityBuilder(dbModel)
const dbModel = SqfEntityModel(
  databaseName: 'calculs.db',
  databaseTables: [
    profilesTable,
  ],
  sequences: [seqIdentity],
  bundledDatabasePath: null,
);
