import 'package:equatable/equatable.dart';

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

class ConverterLoaded extends ConverterState {
  const ConverterLoaded();
}

class ConverterError extends ConverterState {
  const ConverterError();
}
