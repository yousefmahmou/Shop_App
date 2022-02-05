import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopappapi/models/categories_model/categories_model.dart';
import 'package:shopappapi/shared/components/components.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/cubit_shop_app.dart';
import 'package:shopappapi/shared/cubit/cubit_shop_app/states_shop_app.dart';

class CateogriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //لو مرنش نشيل البلوك كونسيمر
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) => ListView.separated(
        itemBuilder: (context, index) => buildCatItem(
            ShopCubit.get(context).categoriesModel!.data!.data[index]),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: ShopCubit.get(context).categoriesModel!.data!.data.length,
      ),
    );
  }

  Widget buildCatItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image!),
              height: 80,
              width: 80,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              model.name!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_back_ios,
            ),
          ],
        ),
      );
}
