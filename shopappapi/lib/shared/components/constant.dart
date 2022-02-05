import 'package:shopappapi/modules/login/shop_login_screen.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/network/local/cache_helper.dart';

void signOut(context) {
  Cachehelper.removeData(
    'token',
  ).then((value) {
    if (value) {
      navigateAndfinish(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = '';
