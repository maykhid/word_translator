part of 'from_to_bloc.dart';

class FromToState extends Equatable {
  const FromToState._({this.from, this.to});

  final String? from;
  final String? to;

  const FromToState.initial() : this._();

  const FromToState.fromLoaded({
    required String? from,
    String? to
  }) : this._(from: from);

  const FromToState.toLoaded({
    required String? from,
    String? to,
  }) : this._(from: from, to: to);

  @override
  List<Object?> get props => [from, to];
}

// class FromToInitial extends FromToState {
//   final String? from;
//   final String? to;

//   const FromToInitial({this.from, this.to});
//   @override
//   List<Object?> get props => [from, to];
// }

// class FromLoadedState extends FromToState {
//   final String? newfrom;
//   // final String? to;

//   const FromLoadedState({this.newfrom});
//   @override
//   List<Object?> get props => [newfrom];
// }

// class ToLoadedState extends FromToState {
//   final String? newto;
//   // final String? to;

//   const ToLoadedState({this.newto});
//   @override
//   List<Object?> get props => [newto];
// }

// class FromToErrorState extends FromToState {}
