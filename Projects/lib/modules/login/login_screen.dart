import 'package:flutter/material.dart';
import 'package:login_test/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ElHamdulilah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            //عشان اعمل فاليديت هراب الكولمن ب فورم والفورم بياخد كيي ك اسم ليها  عشان هستخدمه تحت
            //هنعمل في التيكس فروم فيلد فاليديتور
            //الفاليديتور هنعمله اننوس ميثود هنعملها حاله ايف فاليو ب از ايميبتي لو فاضيه يحصل ايه؟
            //هعمل ريتورن للماسيج اللي مفروض تظهر لو فاضي ولو مش فاضي هعمل ريتورن نول
            //واكررها في الباسورد واعمل داتا تيب للكي من النوع فار فورم كيي بيساوي جلوبال كي بياخد جينيريت من نوع فورم ستيت
            //واحط الداتا تيب فورم كي في الكي
            //وعشان اشغل الفاليداتور اللي هو ادوس علي الزرار انزل عند الديفولت بوتون
            //واعمل في الفانكشن حاله ايف لو كان الفورم كي دوت كرنت ستيت اللي هو بيشوف من نفسه لو فاضي او لا ودوت فالديت وقوسين
            //ولو اتحقق نطبع الايميل والباسورد ولو لا هو من نفسه هيجيب الكلام اللي حطيته
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'email must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                    controller: passwordController,
                    label: 'password',
                    prefix: Icons.lock,
                    suffix:
                        ispassword ? Icons.visibility : Icons.visibility_off,
                    ispassword: ispassword,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    suffixpressed: () {
                      setState(() {
                        ispassword = !ispassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'login',
                    function: () {
                      if (formkey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    text: 'ReGIster',
                    function: () {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t Have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now !',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
