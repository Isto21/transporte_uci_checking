// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:transporte_uci_checking/domain/entities/client.dart';
import 'package:transporte_uci_checking/domain/repositories/remote/usecases/auth_remote_repository.dart';
import 'package:transporte_uci_checking/presentation/providers/data/api_provider.riverpod.dart';

final meDataProvider = StateNotifierProvider<MeDataNotifier, MeDataClass>((
  ref,
) {
  return MeDataNotifier(ref.read(apiProvider).auth);
});

class MeDataNotifier extends StateNotifier<MeDataClass> {
  AuthRemoteRepository authRemoteRepository;
  MeDataNotifier(this.authRemoteRepository) : super(MeDataClass()) {
    getMeData();
  }

  Future<void> getMeData() async {
    try {
      if (state.user != null) return;
      state = state.copyWith(isLoading: true);
      final ClientEntity user = await authRemoteRepository.me();
      state = state.copyWith(isLoading: false, user: user);
    } catch (e) {
      rethrow;
    }
  }
}

class MeDataClass {
  ClientEntity? user;
  bool isLoading;
  String? errorCode;
  MeDataClass({this.user, this.isLoading = false, this.errorCode});
  MeDataClass copyWith({
    ClientEntity? user,
    bool? isLoading,
    String? errorCode,
  }) {
    return MeDataClass(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}
