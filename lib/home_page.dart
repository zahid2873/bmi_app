import 'package:flutter/material.dart';
import 'result_page.dart';
class BMIHomePage extends StatefulWidget {
  const BMIHomePage({Key? key}) : super(key: key);

  @override
  State<BMIHomePage> createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  Color bgColor = Color(0xFF1A1F38);
  Color cardColor = Color(0xFF0A0E21);
  int height = 160;
  int weight = 60;
  int age  = 25;
  bool  isMale = true;
  double heightSquare=0;
  double bmi =0;
  double h =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Expanded(flex:10,child: Row(
            children: [
              Expanded(flex:10,child: GestureDetector(
                onTap: (){
                  setState(() {
                    isMale = true;
                  });
                },
                child: Card(color: isMale==true? Colors.teal:cardColor,child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Male",style: TextStyle(color: Colors.white12,fontSize: 20),),
                    SizedBox(height: 5,),
                    Icon(Icons.male, color: isMale==true?Colors.red:Colors.white12,size: 45)
                  ],
                ),),
              )),
              Expanded(flex:10,child: GestureDetector(
                onTap: (){
                  setState(() {
                    isMale = false;
                  });
                },
                child: Card(color: isMale!=true?Colors.teal:cardColor,child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Female",style: TextStyle(color: Colors.white12,fontSize: 20),),
                    SizedBox(height: 5,),
                    Icon(Icons.female, color: isMale!=true?Colors.red:Colors.white12,size: 45)
                  ],
                ),),
              ),),

            ],
          )),
          Expanded(flex:10,child: Card(
            color: cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",style: TextStyle(color: Colors.white12,fontSize: 40),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("$height",style: TextStyle(color: Colors.white12,fontSize: 40),),
                    Text("CM",style: TextStyle(color: Colors.white12,fontSize: 20),),
                  ],
                ),
                Slider(
                    min: 100,
                    max: 300,
                    inactiveColor: Colors.grey,
                    activeColor: Colors.green,
                    thumbColor: Colors.red,
                    value: height.toDouble(), onChanged: (value){
                  setState(() {
                    height = value.toInt();
                  });
                })

              ],
            ),

          )),
          Expanded(flex:10,child: Row(
            children: [
              Expanded(flex:10,child: Card(color: cardColor,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Weight",style: TextStyle(color: Colors.white12,fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("$weight",style: TextStyle(color: Colors.white12,fontSize: 40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        backgroundColor: Colors.white12,
                        onPressed: (){
                          setState(() {
                            if(weight>0){
                              weight--;
                            }
                          });
                        },child: Icon(Icons.remove),),
                      SizedBox(width: 5,),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        backgroundColor: Colors.white12,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },child: Icon(Icons.add),),
                    ],
                  )
                ],
              ),)),
              Expanded(flex:10,child: Card(color: cardColor,child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Age",style: TextStyle(color: Colors.white12,fontSize: 20),),
                  SizedBox(height: 5,),
                  Text("$age",style: TextStyle(color: Colors.white12,fontSize: 40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        backgroundColor: Colors.white12,
                        onPressed: (){
                          setState(() {
                            if(age>0){
                              age--;
                            }
                          });
                        },child: Icon(Icons.remove),),
                      SizedBox(width: 5,),
                      FloatingActionButton(
                        heroTag: null,
                        mini: true,
                        backgroundColor: Colors.white12,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },child: Icon(Icons.add),),
                    ],
                  )
                ],
              ),),),

            ],
          )),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              height: 60,
              minWidth: double.infinity,
              color: Colors.blueGrey,
              onPressed: (){
                setState(() {
                  h= height/100;
                  heightSquare = h.toDouble() * h.toDouble();
                  bmi =  weight/ heightSquare;
                  //print(bmi);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(bmi: bmi,)));
                });
              },child: Text("Calculate",style: TextStyle(fontSize: 24,),),),
          ),
        ],
      ),
    );
  }
}
