class GoogleSignInRequestDto {
  const GoogleSignInRequestDto({
    required this.idToken,
    this.accessToken,
    this.serverAuthCode,
    this.devicePlatform,
  });

  final String idToken;
  final String? accessToken;
  final String? serverAuthCode;
  final String? devicePlatform;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'idToken': idToken,
      'accessToken': accessToken,
      'serverAuthCode': serverAuthCode,
      'devicePlatform': devicePlatform,
    };
  }
}
