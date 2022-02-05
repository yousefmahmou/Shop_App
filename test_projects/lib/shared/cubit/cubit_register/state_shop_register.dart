import 'package:test_projects/models/shop_login_model/shop_login_model.dart';

abstract class ShopRegisterStatus {}

class ShopRegisterInitialStatus extends ShopRegisterStatus {}

class ShopRegisterLodingStatus extends ShopRegisterStatus {}

class ShopRegisterSuccessStatus extends ShopRegisterStatus {
  final ShopLoginModel userRegisterModel;

  ShopRegisterSuccessStatus(this.userRegisterModel);
}

class ShopRegisterErrorStatus extends ShopRegisterStatus {
  final String error;

  ShopRegisterErrorStatus(this.error);
}

class IseyeRegisterShow extends ShopRegisterStatus {}
