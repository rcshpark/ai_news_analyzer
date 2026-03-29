import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppCOnfigConst {
  static final String googleClientId = dotenv.get('GOOGLE_CLIENT_ID');
}
