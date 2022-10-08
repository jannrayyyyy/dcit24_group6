import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class SalesmanModel {
  final int salesmanId;
  final String name;
  final String city;
  final String commission;
  SalesmanModel({
    required this.salesmanId,
    required this.name,
    required this.city,
    required this.commission,
  });
  factory SalesmanModel.fromMap(Map<String, dynamic> map) {
    return SalesmanModel(
      salesmanId: map['salesmanId'],
      name: map['name'],
      city: map['city'],
      commission: map['commission'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'salesmanId': salesmanId,
      'name': name,
      'city': city,
      'commission': commission,
    };
  }
}

class SalesmanOrder {
  final int orderNumber;
  final String puchasedAmount;
  final String orderDate;
  final int customerId;
  final int salesmanId;
  SalesmanOrder({
    required this.orderNumber,
    required this.puchasedAmount,
    required this.orderDate,
    required this.customerId,
    required this.salesmanId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderNumber': orderNumber,
      'puchasedAmount': puchasedAmount,
      'orderDate': orderDate,
      'customerId': customerId,
      'SalesmanId': salesmanId,
    };
  }

  factory SalesmanOrder.fromMap(Map<String, dynamic> map) {
    return SalesmanOrder(
      orderNumber: map['orderNumber'],
      puchasedAmount: map['puchasedAmount'],
      orderDate: map['orderDate'],
      customerId: map['customerId'],
      salesmanId: map['SalesmanId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SalesmanOrder.fromJson(String source) =>
      SalesmanOrder.fromMap(json.decode(source) as Map<String, dynamic>);
}

abstract class Salesman {
  Stream<List<SalesmanModel>> fetchSalesman();
  Stream<List<SalesmanModel>> fetchSalesmanlabel(String label);
  Stream<List<SalesmanModel>> fetchOrder(String label);
}

class SalesmanImpl implements Salesman {
  final db = FirebaseFirestore.instance;

  @override
  Stream<List<SalesmanModel>> fetchSalesman() {
    return db.collection('salesman').snapshots().map((event) =>
        event.docs.map((e) => SalesmanModel.fromMap(e.data())).toList());
  }

  @override
  Stream<List<SalesmanModel>> fetchSalesmanlabel(String label) {
    return db
        .collection('salesman')
        .where(label, isEqualTo: label)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => SalesmanModel.fromMap(e.data())).toList());
  }

  @override
  Stream<List<SalesmanModel>> fetchOrder(String label) {
    return db
        .collection('order')
        .where(label, isEqualTo: label)
        .orderBy('orderDate')
        .orderBy('salesmanId')
        .orderBy('orderNumber')
        .orderBy('purchasedAmount')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => SalesmanModel.fromMap(e.data())).toList());
  }
}
