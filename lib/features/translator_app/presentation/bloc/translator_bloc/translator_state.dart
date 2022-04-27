part of 'translator_bloc.dart';

abstract class TranslatorState extends Equatable {
  const TranslatorState();

  @override
  List<Object?> get props => [];
}

// Initial state
class EmptyState extends TranslatorState {}

// Loading state
class LoadingState extends TranslatorState {}

// Loaded state (Has data)
class LoadedState extends TranslatorState {
  final TranslationResult? result;

  const LoadedState({this.result = const TranslationResult()});

  @override
  List<Object?> get props => [result];
}

// Error state
class ErrorState extends TranslatorState {
  final String message;
  const ErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
