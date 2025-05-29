import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/database/database.dart';
import 'package:transporte_uci_checking/data/database/local_database.dart';

final localDataProvider = StateProvider<Database>((ref) {
  return Database.instance;
});

final localDatabaseProvider = StateProvider<IsarService>((ref) {
  return IsarService();
});
