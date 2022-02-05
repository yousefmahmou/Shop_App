import 'package:flutter/material.dart';

class MessengerListViewScreen extends StatelessWidget {
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
        //عشان نسكرول الشاشه كلها
        //هنعمل للكولمن الكبير سنجل سكرول
        //ونعمل لليست فيو بتاعت الشات والاستورى مش ضروري شيرنك راب ب ترو
        //ونحذف الايكسبنديد من ليست الشات
        //ونوقف سكرول ليست شات ب فيزيكس ونيفر سكرول فيزيكس
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            // هنعمل ليست فيو دوت سيباريدت عشان يعمل فواصل بين الاستوريز او الشات
            //في الايتم بيلدر الكونتست والايندكس وبرا الايتم ببلدر نعمله الايتم كاونت ونحط العدد
            //ونعمل ريتورن للويدجيت جوا الايتم بيلدر
            //ونعمل سيبارتور بيلدر كونتكست وايندكس وفيه سيز بوكس بعرض
            //ونعمل سكرول ديركشن واكسيز راسي عشان الاتجاه السكرول
            //وهنحاوطها بكونتينر طوله يكون الحد الاقصي للاستوري وهو 100

            Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildStoryItem();
                },
                separatorBuilder: (context, index) => SizedBox(
                  width: 15,
                ),
                itemCount: 10,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //نفس خطوات ليست فيو للاستوري ماعدا نبدل الكونتينر ب ايكسبينديد
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildChatItem();
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: 10),
          ]),
        ),
      ),
    );
  }
//عملنا 2 ميثود للشات والاستوري جبناها بدون سكرول ولا ايكسبنديد

  Widget buildChatItem() => Row(
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
      );
  Widget buildStoryItem() => Container(
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
      );
}
