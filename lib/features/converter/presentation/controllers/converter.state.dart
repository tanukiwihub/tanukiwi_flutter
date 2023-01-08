import 'package:equatable/equatable.dart';
import 'package:tanukiwi/features/converter/domain/entities/morph.entity.dart';

abstract class ConverterState with EquatableMixin {
  const ConverterState();

  @override
  List<Object> get props {
    return [];
  }
}

class ConverterInitial extends ConverterState {
  final Future<bool> hasClipboardString;

  const ConverterInitial({required this.hasClipboardString});

  @override
  List<Object> get props => super.props..addAll([hasClipboardString]);
}

class ConverterLoaded extends ConverterState {
  final List<MorphToken> morphTokens;

  ConverterLoaded({required this.morphTokens});

  @override
  List<Object> get props => super.props..addAll([morphTokens]);
}

class ConverterError extends ConverterState {
  const ConverterError();
}
