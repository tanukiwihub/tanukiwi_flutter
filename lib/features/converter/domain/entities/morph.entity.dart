import 'package:equatable/equatable.dart';

class MorphToken extends Equatable {
  final String origin;
  final String phoneticRomaji;

  const MorphToken({
    required this.origin,
    required this.phoneticRomaji,
  });

  @override
  List<Object?> get props => [
        origin,
        phoneticRomaji,
      ];

  MorphToken copyWith({
    String? origin,
    String? phoneticRomaji,
  }) {
    return MorphToken(
      origin: origin ?? this.origin,
      phoneticRomaji: phoneticRomaji ?? this.phoneticRomaji,
    );
  }
}
