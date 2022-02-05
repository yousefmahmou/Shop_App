import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:shopappapi/models/Favorites_model/favorites_model.dart';
import 'package:shopappapi/models/categories_model/categories_model.dart';
import 'package:shopappapi/models/change_favorites_model/change_favorites_model.dart';
import 'package:shopappapi/models/home_model/home_model.dart';
import 'package:shopappapi/models/login_model/login_model.dart';

import 'package:shopappapi/modules/cateogries/cateogries_screen.dart';
import 'package:shopappapi/modules/favorites/favorites_screen.dart';
import 'package:shopappapi/modules/products/products.dart';
import 'package:shopappapi/modules/settings/settings_screen.dart';
import 'package:shopappapi/shared/components/constant.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/states_shop_app.dart';
import 'package:shopappapi/shared/network/end_points.dart';
import 'package:shopappapi/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(shopInitialeState());

  static ShopCubit get(context) => BlocProvider.of(context);
  int cuurentIndex = 0;
  List<Widget> bootomScreen = [
    ProductsScreen(),
    CateogriesScreen(),
    favoritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    cuurentIndex = index;
    emit(shopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(shopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners[0].image);
      // print(homeModel.status);
      //هيلف يتاكد فيه فافوريت ولا لا ويملي
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id!: element.in_favorite!,
        });
      });

      emit(shopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(shopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(shopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(shopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;
  void changeFavorites(int product_id) {
    //عشان تنور وتطفي لحظيا
    favorites[product_id] = !favorites[product_id]!;
    emit(shopChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': product_id,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);
      if (changeFavoritesModel!.status == false) {
        favorites[product_id] = !favorites[product_id]!;
      } else {
        getFavorites();
      }
      emit(shopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((eror) {
      favorites[product_id] = !favorites[product_id]!;
      emit(shopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(shopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // printFullText(value.data.toString());
      emit(shopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(shopErrorGetFavoritesState());
    });
  }

  LoginModel? userModel;
  void getUserData() {
    emit(shopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      // printFullText(userModel.data!.name);
      emit(shopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(shopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(shopLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATEPROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);
      //printFullText(userModel.data!.name);
      emit(shopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(shopErrorUpdateUserState());
    });
  }
}
