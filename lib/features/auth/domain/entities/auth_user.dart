class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
  });

  final String id;
  final String email;
  final String name;
  final String? profileImageUrl;
}
