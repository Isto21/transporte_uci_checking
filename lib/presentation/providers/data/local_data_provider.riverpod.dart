import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/database/database.dart';

final localDataProvider = StateProvider<Database>((ref) {
  return Database.instance;
});
