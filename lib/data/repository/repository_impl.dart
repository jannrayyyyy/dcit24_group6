// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dcit24/data/logic/remote_datasource.dart';
import 'package:dcit24/data/model/prulife_model.dart';
import 'package:dcit24/domain/entities/prulife_entity.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remote;
  RepositoryImpl({
    required this.remote,
  });
  @override
  Future<void> addToPrulife(PrulifeEntity prulife) async {
    try {
      await remote.addToPrulife(PrulifeModel.fromEntity(prulife));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<PrulifeEntity>> fetchPrulife() {
    try {
      return remote.fetchPrulife();
    } catch (e) {
      rethrow;
    }
  }
}
