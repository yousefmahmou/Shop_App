// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/cubit/cubit_search/cubit_shop_search.dart';
import 'package:shopappapi/shared/cubit/cubit_search/states_shop_search.dart';

class SearchScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopSearchCubit(),
      child: BlocConsumer<ShopSearchCubit, ShopSearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultTextFormField(
                      controller: searchController,
                      type: TextInputType.text,
                      onsubmit: (String text) {
                        ShopSearchCubit.get(context).search(text);
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email is to Short';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is ShopSearchLoadingState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is ShopSearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => buildListProduct(
                            ShopSearchCubit.get(context)
                                .model!
                                .data!
                                .data[index],
                            context,
                            isOldPrice: false,
                          ),
                          separatorBuilder: (context, index) => myDivider(),
                          itemCount: ShopSearchCubit.get(context)
                              .model!
                              .data!
                              .data
                              .length,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
