import 'package:flutter/material.dart';
import 'package:login_test/models/user/user_model.dart';

//عشان نعمل ليست للداتا
//نعمل كلاس فيه العناصر اللي عندي1-
//2-نحط فيه الكونستراكتور بنفس الاسم
//بعدين نعمل الليست اوف اسم الكلاس ونسمي الليست
//ونحط الداتا اللي عايزنها
//ونحط اسم الليست دوت لينث في الايتم كونتر
// ونحط في الايتم بيلدر اسم الليست اوف ايندكس عشان يجيب الداتا من الليست
//ونحط في الويدجيت اسم الكلاس ونديله اسم كمان
//ونحط في مكان الاسم والرقم $(اسم اللي سمناه دوت العنصر)

class UsersModelScreen extends StatelessWidget {
  List<UsersModel> users = [
    UsersModel(
      id: 1,
      name: 'yousef',
      phone: '01111',
    ),
    UsersModel(
      id: 2,
      name: 'yousefl',
      phone: '011122',
    ),
    UsersModel(
      id: 3,
      name: 'yousefmm',
      phone: '01152',
    ),
    UsersModel(
      id: 4,
      name: 'yousefm',
      phone: '011155',
    ),
    UsersModel(
      id: 4,
      name: 'yousefm',
      phone: '011155',
    ),
    UsersModel(
      id: 4,
      name: 'yousefm',
      phone: '011155',
    ),
    UsersModel(
      id: 4,
      name: 'yousefm',
      phone: '011155',
    ),
    UsersModel(
      id: 4,
      name: 'yousefm',
      phone: '011155',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //نفس خطوات الليست فيو الشات ماعدا الكونتينر في السيبارتور بيلدرلعمل فاصل بين كل رقم
      //ونحاوط الكونتينر ب بادينج دياركشنل اونلي دوت ستارت
      body: ListView.separated(
        itemBuilder: (context, index) => buildUsersItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 15,
          ),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUsersItem(UsersModel user) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
