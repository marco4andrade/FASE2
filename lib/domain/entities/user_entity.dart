import 'package:meta/meta.dart';

@immutable
class User {
  final int id;
  final String email;
  final String username;

  const User({
    required this.id,
    required this.email,
    required this.username,
  });
}