//لكيبوت ممكن يعمل ستيت واحده بس ف عشان نعمل اكتر من ستيت هنعمل اسكرينه ستيتس ابستراكت كلاس
//ونحطها في اسكرينه الكيوبت عشان نعرف نعمل عدد الستيت اللي عايزنها

//نعمل الاستيت المتفرعه من الستيت الرئيسيه ف هنعمل كلاس تاني بتايكستند الكلاس ابستراكت
//ونعمل كلاس تاني للتغير بايكستند برضو اكلاس الرئيسيه وبكده قدرنا نعمل اتنين ستيت
//عشان ابعت قيمه مع كل دوسه هعمل فاريبل في كل كلاس من بلس ومينس وانادي علي الكونستراكتور ب زيس دوت كونتر
abstract class counterStates {}

class counterInitialState extends counterStates {}

class counterPlusState extends counterStates {
  final int counterr;
  counterPlusState(this.counterr);
}

class counterMinusState extends counterStates {
  final int counterr;
  counterMinusState(this.counterr);
}
