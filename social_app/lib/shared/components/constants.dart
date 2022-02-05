import 'package:social_app/modules/social_login/social_login_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';

void signOut(context) {
  Cachehelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndfinish(context, SocialLoginScreen());
    }
  });
}

void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';
