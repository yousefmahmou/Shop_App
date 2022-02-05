import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  @override
  _BmiCalculatorScreen createState() => _BmiCalculatorScreen();
}

class _BmiCalculatorScreen extends State<BmiCalculatorScreen> {
  bool isMale = true;
  double height = 50;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          //عملنا روو فيهم 2 كولمن والكولمن فيه الايكون والتيكست وهنعمل مينالاينمينت دوت سينتر
          //وهنحطها جوا بوكس ديكوراشن وده لازمله كونتينر
          //ونحجمه في اكسبينديد ونعمل الجزء اللي جنبه نفس الكلام ونعملهم باديمج للروو كله
          //ونعمل بينهم سيزبوكس بنفس العرض للبادينج
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    //عشان لما نختار بين الميل والفيميل فيتغير لونهم من الازرق والعادي
                    //نراب الكونتينر بجستورديتيكتور عشان نعرف ندوس عليه
                    //نعمل فاريبل بوول ونسميه ونحط قيمه تروو
                    //نيجي عند لون الكونتينر ونعمل لو كان الكولور بترو يبقي ازرق غير كده يبقي لونه الطبيعي
                    //ونعمل في الجيستورديتيكتور اون تاب وسيت ستات ونعمل الميل بتروو والعكس عند الفيميل
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: isMale ? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.ac_unit),
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: !isMale ? Colors.blue : Colors.grey[300],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.ac_unit),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //هنعمل كولمن فيه تيكست وبعدين روو فيه رقم وتيكست
          //هنعمل للروو مين دوت سينتر وكروس دوت بيزلاين تحته تيكست بيزلاين ودبيزلاين دوت الفابيتك
          //وبين التيكستين بوكس سيز وهنعمل للكولمن اكسبيندسد ده في الاول
          //وبعدين نعمل للكولمن بادينج بسميترسك راسي عشان نعمل الجناب بس
          //وهنعمل تحت الروو سلايدر نحط الفاليو ونحط الماكس والمين
          //وفي الاون تشانجد هنعمل ميثود بقيمه فاليو ةفي البراكتس هنحط البرينت فاليو
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          //هنعمل اسم المتغير كده عشان يظهر علي الشاشه
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    //عشان نعرف نغير السلايدر هنعمل متغير بقيمه ابتدائيه
                    //ونحط اسم المتغير في الفاليو ونعمل سيت ستيت بيساوي الفاليو
                    Slider(
                        value: height,
                        max: 100,
                        min: 0,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        }),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${weight}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${age}',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                mini: true,
                                child: Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
