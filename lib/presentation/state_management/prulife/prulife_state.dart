// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'prulife_cubit.dart';

abstract class PrulifeState extends Equatable {
  const PrulifeState();

  @override
  List<Object> get props => [];
}

class PrulifeInitial extends PrulifeState {}

class PrulifeLoading extends PrulifeState {}

class PrulifeLoaded extends PrulifeState {
  final List<PrulifeEntity> prulife;
  const PrulifeLoaded({
    required this.prulife,
  });
}

class PrulifeEmpty extends PrulifeState {}
