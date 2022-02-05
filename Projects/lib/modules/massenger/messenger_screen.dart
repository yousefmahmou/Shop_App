import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            //التيتل عباره عن روو وفيها سيركل افاتار وفيها التيكست وبينهم سيز بوكس عرض
            CircleAvatar(
              radius: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          // عملنا في الاكشنز ايقون بوتون ونحاوط الايكون ب سيركل افاتار وسيز ولون ابيض
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //عملنا خانه السيرش كولمن وفيه كونتينر متحاوط بالبادينج
            //وعملنا كونتينر لانه هنعمل دييكوراشن يحاوط السيرش وعشان مينفعش الا كونتينر للديكوراشن

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //عملنا الاستوريز روو جواه كونتينر حجمه 60 والاستورى الواحده كولمن
            // فيه ستاك عشان ينظم ويعمل محازاه لسيركل افاتار الخضرا في مكان البوتوم ايند
            //اول سيركل افاتار للصوره
            //تاني سيركل افاتار عباره عن دايره صغيره فاضيه بيضه كباك جراوند للدايره الصغيره
            //والسركل افاتار الاخيره هي العلامه الخضرا ونعملها بادينج ايدج انسرت ديركشنلي دوت اونلي وفيه بوتوم وايند3
            //ونكرر الاستورى ونعملهم سكرول رأسي
            //وفيها سيزبوكس عشان المسافات للارتفاع
            //ونعمل التيكست جوا الكولمن فيه مكس لينز واوفر فلو عشان الايرور
            //ونعمل سيز بوكس عشان المسافات
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 60,
                    child: Column(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Yousef Mahmoud',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            //الشات كله كولمن معموله ايكسبنديد في الاخر عشان نحجمه وميمعملش اوفرفلو
            //جوا الكولمن هنعمل روو فيها ستاك فيها 3 سيركل افاتار زي الاستوري
            //ونعمل للتيكست اللي جمب الصوره كولمن معموله كروس الاينمنت ستارت
            //ونعمل للاسم مكس لاينز 1 واوفر فلو تيكست اوفر فلو دوت اليبسز
            //ونعمل روو للرساله والدوت اللي في النص والتاريخ
            //الرساله مكس لاينز 2 واوفر فلو ونحاوطها هي بس ب ايكسبنديد عشان نحجمها
            //الدوت بكونتينر له ويدث وهايت وديكوراشن بوكس ديكوراشن فيه اللون وشيب(الشكل) بوكس شيب دوت سيركل
            //والدوت بكونتينر معمول ببادينج سيمرتك (راسي قيمة 8)
            //والتاريخ تيكست عادي
            //ونكرر الخطوه عادي وسيز بوكس بين كل شات

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                bottom: 3,
                                end: 3,
                              ),
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yousef Mahmoud ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'messagess',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                    ),
                                    child: Container(
                                      width: 7,
                                      height: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '02.00 pm',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
