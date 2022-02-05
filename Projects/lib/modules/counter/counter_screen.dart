import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_test/modules/counter/cubit/cubit.dart';
import 'package:login_test/modules/counter/cubit/states.dart';
// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget
//هنعمل الاسكرينه ستيتفل ونديزاين الشكل هنعمل تيكست بوتون فيه تيكست واون بريسد
//واحد للمينوس والتاني للبلس ونعمل تيسكت للرقم
//هنعمل كونستراكتور فيه انيت ستيت ونستدعيها بالسوبر دوت انيت ستيت
//ونعمل فاريبل كوانتر بيساوي فاليو بواحد ونحط في الاون بريسد سيت ستيت واحد مينس مينس والتاني بلس بلس وبرينت
//وفي الرقم نحط الفاريبل كوانتر عشان يحصل التغير
//نراب السكافولد ببلوك بروفيدر ونعمل كرييت بتديني بيلد كونتكست بيعود علي البلوك بوفيدر ونكريت من الكونتر كيوبت اوبجكت
//هراب السكوفولد برضو ببلوك كونسيومر بتاخد جينيرك تيب(اوف) ده بيخليني اقدر اسمع التغيرات اللي هتحصل يعني هياخد الكونتر كيبوبت
//وكونتر ستيت عشان يقدر يعرف و هيعمل انهي ستيت يعني الكيونسيمر هو اللي بيشغل البلوك  وبيسمع التغيرات ف هيبدء
//يبلد المكان المعين وبياخد ليسنر وفيها كونتيسكت وستيت والبيلدر نفس الكلام وكمان هنشيل السكافولد ونعمل ريتورن في البيلدر
//هحط في الاون بريسد الميثود اللي عملناه في اسكرينه الكيوبت واستدعيها هنا اكتب كونتر كيوبت دوت جيت دوت مينس او بلس
//لو عايز اتاكد انهي ستيت ف هعمل حاله ايف في الليسن لو الستيت از واسم الستيت برينت كذا وابعت القيمه بستيت دوت كونتر

//في حاجه اسمها البلوك اوبسيرفر هيبقي في باكيج البلوك هعمله كوبي واعمله اسكرينه في الشير وانسخه
class CounterScreen extends StatelessWidget {
  // 1. constructor
  // 2. init state
  // 3. build
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => counterCubit(),
      child: BlocConsumer<counterCubit, counterStates>(
        listener: (context, state) {
          if (state is counterPlusState) {
            print('plus state ${state.counterr}');
          }
          if (state is counterMinusState) {
            print('minus state ${state.counterr}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      counterCubit.get(context).minus();
                    },
                    child: Text(
                      'MINUS',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${counterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      counterCubit.get(context).plus();
                    },
                    child: Text(
                      'PLUS',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
