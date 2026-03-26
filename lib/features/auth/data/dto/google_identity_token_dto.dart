class GoogleIdentityTokenDto {
  const GoogleIdentityTokenDto({
    required this.idToken,
    this.accessToken,
    this.serverAuthCode,
    this.email,
    this.displayName,
  });

  final String idToken;
  final String? accessToken;
  final String? serverAuthCode;
  final String? email;
  final String? displayName;
}
