// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dcit24/domain/entities/prulife_entity.dart';
import 'package:dcit24/domain/repository/repository.dart';

class FetchPrulife {
  final Repository repo;
  FetchPrulife({required this.repo});
  Stream<List<PrulifeEntity>> call() {
    return repo.fetchPrulife();
  }
}
