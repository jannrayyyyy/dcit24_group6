// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PrulifeEntity extends Equatable {
  String? uid;
  final String fundName;
  final String bondFund;
  final String managedFund;
  final String growthFund;
  final String equityFund;
  final String proactivefund;
  final String moneyMarketFund;

  PrulifeEntity({
    this.uid,
    required this.fundName,
    required this.bondFund,
    required this.managedFund,
    required this.growthFund,
    required this.equityFund,
    required this.proactivefund,
    required this.moneyMarketFund,
  });
  @override
  List<Object?> get props => [uid];
}
