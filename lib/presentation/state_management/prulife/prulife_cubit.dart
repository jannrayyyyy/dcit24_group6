import 'package:bloc/bloc.dart';
import 'package:dcit24/domain/entities/prulife_entity.dart';
import 'package:dcit24/domain/usecases/add_prulife.dart';
import 'package:dcit24/domain/usecases/fetch_prulife.dart';
import 'package:equatable/equatable.dart';

part 'prulife_state.dart';

class PrulifeCubit extends Cubit<PrulifeState> {
  final AddPrulife _add;
  final FetchPrulife _fetch;
  PrulifeCubit(this._add, this._fetch) : super(PrulifeInitial());

  void addPrulife(PrulifeEntity prulife) async {
    await _add(prulife);
  }

  void fetchPrulife() {
    emit(PrulifeLoading());
    final prulife = _fetch();
    prulife.listen((event) {
      if (event.isEmpty) {
        emit(PrulifeEmpty());
      } else {
        emit(PrulifeLoaded(prulife: event));
      }
    });
  }
}
