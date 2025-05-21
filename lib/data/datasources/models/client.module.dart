import 'package:transporte_uci_checking/data/datasources/models/address.module.dart';

class ClientModel {
  final int? id;
  final String name;
  final String acronym;
  final List<Address>? addresses;

  ClientModel({
    this.id,
    required this.name,
    required this.acronym,
    this.addresses,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    List<Address>? addressList;
    if (json['addresses'] != null) {
      addressList =
          (json['addresses'] as List)
              .map((address) => Address.fromJson(address))
              .toList();
    }

    return ClientModel(
      id: json['id'],
      name: json['name'],
      acronym: json['acronym'],
      addresses: addressList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'acronym': acronym,
      'addresses': addresses?.map((address) => address.toJson()).toList(),
    };
  }

  ClientModel copyWith({
    int? id,
    String? name,
    String? acronym,
    List<Address>? addresses,
  }) {
    return ClientModel(
      id: id ?? this.id,
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      addresses: addresses ?? this.addresses,
    );
  }
}
