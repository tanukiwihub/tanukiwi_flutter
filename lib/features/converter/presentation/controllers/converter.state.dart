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
  const ConverterInitial();
}

class ConverterActive extends ConverterState {
  const ConverterActive();
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
