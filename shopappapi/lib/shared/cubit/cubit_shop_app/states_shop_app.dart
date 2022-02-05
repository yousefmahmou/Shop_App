import 'package:shopappapi/models/change_favorites_model/change_favorites_model.dart';
import 'package:shopappapi/models/login_model/login_model.dart';

abstract class ShopStates {}

class shopInitialeState extends ShopStates {}

class shopChangeBottomNavState extends ShopStates {}

class shopLoadingHomeDataState extends ShopStates {}

class shopSuccessHomeDataState extends ShopStates {}

class shopErrorHomeDataState extends ShopStates {}

class shopSuccessCategoriesState extends ShopStates {}

class shopErrorCategoriesState extends ShopStates {}

class shopChangeFavoritesState extends ShopStates {}

class shopSuccessChangeFavoritesState extends ShopStates {
  late final ChangeFavoritesModel model;
  shopSuccessChangeFavoritesState(this.model);
}

class shopErrorChangeFavoritesState extends ShopStates {}

class shopLoadingGetFavoritesState extends ShopStates {}

class shopSuccessGetFavoritesState extends ShopStates {}

class shopErrorGetFavoritesState extends ShopStates {}

class shopLoadingUserDataState extends ShopStates {}

class shopSuccessUserDataState extends ShopStates {
  final LoginModel loginModel;
  shopSuccessUserDataState(this.loginModel);
}

class shopErrorUserDataState extends ShopStates {}

class shopLoadingUpdateUserState extends ShopStates {}

class shopSuccessUpdateUserState extends ShopStates {
  final LoginModel loginModel;
  shopSuccessUpdateUserState(this.loginModel);
}

class shopErrorUpdateUserState extends ShopStates {}
