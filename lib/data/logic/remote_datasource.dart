import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dcit24/data/model/prulife_model.dart';

abstract class RemoteDataSource {
  Future<void> addToPrulife(PrulifeModel prulife);
  Stream<List<PrulifeModel>> fetchPrulife();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final db = FirebaseFirestore.instance;
  @override
  Future<void> addToPrulife(PrulifeModel prulife) async {
    final pruLife = db.collection('prulife').doc();
    prulife.uid = pruLife.id;
    await pruLife.set(prulife.toMap());
  }

  @override
  Stream<List<PrulifeModel>> fetchPrulife() {
    return db
        .collection('prulife')
        .orderBy('bondFund', descending: false)
        .snapshots()
        .map((event) =>
            event.docs.map((e) => PrulifeModel.fromMap(e.data())).toList());
  }
}
