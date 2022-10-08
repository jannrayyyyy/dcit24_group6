// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dcit24/domain/entities/prulife_entity.dart';
import 'package:dcit24/domain/repository/repository.dart';

class AddPrulife {
  final Repository repo;
  AddPrulife({required this.repo});
  Future<void> call(PrulifeEntity prulife) async {
    await repo.addToPrulife(prulife);
  }
}
