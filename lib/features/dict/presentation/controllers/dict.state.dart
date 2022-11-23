import 'package:equatable/equatable.dart';

abstract class DictState with EquatableMixin {
  const DictState();

  @override
  List<Object> get props {
    return [];
  }
}

class DictInitial extends DictState {
  const DictInitial();
}
