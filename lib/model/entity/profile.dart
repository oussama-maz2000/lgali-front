import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile(
      {required String id,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String type}) = _Profile;
}
