// import 'dart:html';

import 'package:flutter/material.dart';
import 'accesories.dart';
import 'dart:math';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => new _FirstPageState();
}

nav_button(c, context) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new MaterialButton(
          child: new Icon(Icons.navigate_before),
          onPressed: () {
            //c.animateTo(MediaQuery.of(context).size.width, duration: new Duration(seconds: 1), curve: Curves.easeIn);
            c.jumpTo(0.0);
          }),
      new FloatingActionButton(
          backgroundColor: main_color,
          child: new Icon(Icons.navigate_next),
          onPressed: () {
            c.animateTo(MediaQuery.of(context).size.width,
                duration: new Duration(milliseconds: 500),
                curve: Curves.easeIn);
          }),
    ],
  );
}

class _FirstPageState extends State<FirstPage> {
  ScrollController c;

  @override
  void initState() {
    super.initState();
    c = new PageController();
  }

  nav_button() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new MaterialButton(
            child: new Icon(Icons.navigate_before),
            onPressed: () {
              //c.animateTo(MediaQuery.of(context).size.width, duration: new Duration(seconds: 1), curve: Curves.easeIn);
              c.jumpTo(0.0);
            }),
        new FloatingActionButton(
            backgroundColor: main_color,
            child: new Icon(Icons.navigate_next),
            onPressed: () {
              c.animateTo(MediaQuery.of(context).size.width,
                  duration: new Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }),
      ],
    );
  }

  floating_button() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 80), child: nav_button());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: floating_button(),
      appBar: new AppBar(title: new Text("First Page")),
      body: MaterialButton(
          color: Colors.amber,
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    height_weight(),
                transitionDuration: Duration.zero,
              ),
            );
          }),

      // body: new IgnorePointer(
      //   child: new PageView(
      //     controller: c,
      //     children: <Widget>[
      //       height_weight(c, context),
      //       new Container(child: new Text("Second Item")),
      //     ],
      //   ),
      // ),
    );
  }
}

//height and weight

class height_weight extends StatefulWidget {
  // height_weight({Key? key}) : super(key: key);

  @override
  _height_weightState createState() => _height_weightState();
}

class _height_weightState extends State<height_weight> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("tite"),
      ),

      body: Center(
        child: Row(
          children: [
            
          ],
        ),
      )
    );
  }
}

//ideal weight

//wahts your biological sex

//wahts your agee

//tada were good

//lifestyle

//reason to lose weight

//wanan lose muscle or lose fat or soemmhting

//how often do you eat

//any back issues

//liek deases or somthing

//doabeties

//sports player ot nah?

//city or urabn or soemother shit

//ta dad ta now we liek so great demografic thing complte liek broo

//ask for email

//based on your thing this is the page and liek a graph thingy

//any life event? marriage or breakup or something bullshit

//how long sinc eit you been your ideal waeight

//anyother plan like ww or somthing

//Have you attempted any of the following in the past to help lose weight? paid mealplans, gym ,wakging

//“I know what I should be doing to lose weight, but I need a way to do it that fits into MY life.”

//oh like we help on we so great tf bitch

//Has your weight ever affected your ability to socialize or engage with friends and family?

//“I need some outside motivation. When I am feeling overwhelmed, it can be easy to give up.

//Noom's tools and curriculum give you motivation when you need it, and forgiveness when you start trying to blame yourself.

//“I have been thinking about weight loss for a while, but life is so busy I find myself putting convenience first.”

//it just takes 10mina day

//The most successful Noomers spend 5 minutes a day reading our lessons. When will you read your daily lesson?

//What area do you want to focus on first in your plan?Nutrition,Physical activity,Building good habits

//Do you relate to the following statement: “I am looking for a weight loss plan that does not involve working out"

//Do you have any physical limitations?

//Do you have any dietary restrictions or food allergies?

//noom based on physcology loading, we gonan help we so like good ands hit like shutup

//Noom uses behavioral therapy to help you achieve sustained weight loss. When it comes to Cognitive Behavioral Therapy you are:

//skipped some i was bored af

//“Food often provides me emotional comfort.” rate quetion

//“I’ve been able to eat healthier or exercise for a week or two but then I fall back to my old habits.”

//“The people around me can make it difficult to maintain healthier habits.”

//“I am usually multitasking while I eat (like watching tv or scrolling on my phone).”

//“I usually clear my plate even if I’m already feeling full.”

//“I have felt like a failure because of one unhealthy decision. This often leads me to make even more unhealthy decisions.”

//How busy are you on an average day?

//Is it common for you to have one or more alcoholic beverages at the end of the day?

//How do you usually prepare your meals?

//This is your plan, designed to work at your pace. So knowing you, as only you can, which pace would you prefer?

//In addition to your weight loss goal, what’s a goal you would like to achieve with your program?,Run a 5kBe able to do outdoor activitiesFeel comfortable and confident in my body

//Articles in several medical journals describe the results that Noom users have achieved.

//annalysicing fake loading

//asking questiosn in middle, you roughly can eat sam emeal everyday? are you on your feet or somthing

//youre going to lose this much this soon

//welp it takes liek this much to like do this much liek blablabla

//timer your personalized plan ends in 15mins count down
