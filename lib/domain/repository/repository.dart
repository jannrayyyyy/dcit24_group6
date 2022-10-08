import 'package:dcit24/domain/entities/prulife_entity.dart';

abstract class Repository {
  Future<void> addToPrulife(PrulifeEntity prulife);
  Stream<List<PrulifeEntity>> fetchPrulife();
}
