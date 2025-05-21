import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transporte_uci_checking/data/datasources/api.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/language/locale_provider.dart';

final apiProvider = StateProvider<RemoteRepository>((ref) {
  return ApiConsumer.getInstance(
    language: ref.read(localeProvider).locale.languageCode,
  );
});
