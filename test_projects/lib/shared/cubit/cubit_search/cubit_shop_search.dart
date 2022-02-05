import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_projects/models/search_model/search_model.dart';
import 'package:test_projects/shared/components/constant.dart';
import 'package:test_projects/shared/cubit/cubit_search/states_shop_search.dart';
import 'package:test_projects/shared/network/end_points.dart';
import 'package:test_projects/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStatus> {
  SearchCubit() : super(ShopSearchInitialStatus());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void getSearchData(String searchText) {
    emit(ShopLodingSearchStatus());
    Diohelper.PostData(url: productssearch, Token: token, data: {
      'text': '$searchText',
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print('Search ' + searchModel!.status.toString());
      emit(ShopSuccessSearchStatus(searchModel!));
    }).catchError((error) {
      emit(ShopErrorSearchStatus());
      print(error.toString());
    });
  }
}
