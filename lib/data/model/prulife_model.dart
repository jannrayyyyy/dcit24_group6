// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dcit24/domain/entities/prulife_entity.dart';

// ignore: must_be_immutable
class PrulifeModel extends PrulifeEntity {
  PrulifeModel({
    super.uid,
    required super.fundName,
    required super.bondFund,
    required super.managedFund,
    required super.growthFund,
    required super.equityFund,
    required super.proactivefund,
    required super.moneyMarketFund,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fundName': fundName,
      'bondFund': bondFund,
      'managedFund': managedFund,
      'growthFund': growthFund,
      'equityFund': equityFund,
      'proactivefund': proactivefund,
      'moneyMarketFund': moneyMarketFund,
    };
  }

  factory PrulifeModel.fromEntity(PrulifeEntity prulife) {
    return PrulifeModel(
      fundName: prulife.fundName,
      bondFund: prulife.bondFund,
      managedFund: prulife.managedFund,
      growthFund: prulife.growthFund,
      equityFund: prulife.equityFund,
      proactivefund: prulife.proactivefund,
      moneyMarketFund: prulife.moneyMarketFund,
    );
  }

  factory PrulifeModel.fromMap(Map<String, dynamic> map) {
    return PrulifeModel(
      uid: map['uid'],
      fundName: map['fundName'] as String,
      bondFund: map['bondFund'] as String,
      managedFund: map['managedFund'] as String,
      growthFund: map['growthFund'] as String,
      equityFund: map['equityFund'] as String,
      proactivefund: map['proactivefund'] as String,
      moneyMarketFund: map['moneyMarketFund'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PrulifeModel.fromJson(String source) =>
      PrulifeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
