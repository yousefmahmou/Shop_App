import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:login_test/shared/cubit/cubit.dart';

//هنعمل ويدجيت فيه الزرار لاننا هنستخدمه كتير
//هنحط اسم الزرار وفيه الكونتينر كله
//وهنعمل بارميترز في الديفولت بوتون فيه وعشان بنستخدمهم كتير ف هنعمل داتا تيب للويدث والكولور
//والاستخدم الاكتر بعمله انيشيال فاليو والاقل استخدام بعمله ريكويرد
//والدوسه بتاعت الزرار اللي هي اون بريسد دي بتتغير من زرار للتاني
//ف هنعملها داتا تيب اسمها فانكشن
//وبرضه للتيكست نعملها ك داتا تيب
//ونبعت الديفولت بوتون ده لسكرينه اللوجين مكانها ونحط القيم فيها واللي مش هستخدمه كتير محطوش او اللي مش ريكويرد
Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 10.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
//اي حاجه فيهااننوس ميثود بتاخد فانكشن لانها فانكشن
Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onsubmit,
  Function? onchange,
  Function? onTap,
  bool ispassword = false,
  FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixpressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: (value) {
        onsubmit!(value);
      },
      onChanged: (value) {
        onchange!(value);
      },
      onTap: () {
        onTap!();
      },
      validator: validate,
      obscureText: ispassword,
      enabled: isClickable,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixpressed!();
                },
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
//دي مهام عشان تتكرر
Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: Text(
                '${model['time']}',
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'Done',
                  id: model['id'],
                );
              },
              icon: Icon(Icons.check_circle_outline),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: Icon(Icons.archive),
              color: Colors.grey,
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(
          id: model['id'],
        );
      },
    );
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20,
      ),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget buildArticleItem(article, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget articleBuilder(list, context) => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: 10,
    );
Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTaskItem(tasks[index], context);
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
