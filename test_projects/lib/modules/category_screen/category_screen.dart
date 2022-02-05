import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_projects/shared/components/components.dart';
import 'package:test_projects/shared/components/constant.dart';
import 'package:test_projects/shared/cubit/appcubit_search_cubit/appcubit.dart';
import 'package:test_projects/shared/cubit/appcubit_search_cubit/states_shop.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopAppcubit, ShopStatus>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = ShopAppcubit.get(context);
        return cubit.categoryModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildCategoriesItem(
                    cubit.categoryModel!.data!.data[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: cubit.categoryModel!.data!.data.length);
      },
    );
  }
}
