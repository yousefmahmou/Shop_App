import 'package:test_projects/models/search_model/search_model.dart';

abstract class SearchStatus {}

class ShopSearchInitialStatus extends SearchStatus {}

class ShopLodingSearchStatus extends SearchStatus {}

class ShopSuccessSearchStatus extends SearchStatus {
  final SearchModel searchModel;

  ShopSuccessSearchStatus(this.searchModel);
}

class ShopErrorSearchStatus extends SearchStatus {}
