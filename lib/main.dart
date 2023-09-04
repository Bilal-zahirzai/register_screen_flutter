import 'package:flutter/material.dart';
import 'package:register/widget/drop_down_list.dart';
import 'package:register/widget/elevated_button.dart';
import 'package:register/widget/inpute_field.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Personal Detail',
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  //for date and time
  DateTime currentDate = DateTime.now();
  //for permision to dispaly phone number in the app
  bool isChecked=false;
  // Declare a variable to store the selected blood group.
  String selectedBloodGroup = '';
  //get current date method
  String _getCurrentDate() {
    String formattedDate = "${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}";
    return formattedDate;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Add Personal Detail",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight:FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
            children: [
                    //user name text field
                    InputField(hint: 'user name', containerSize: 52,title: "Enter a username",maxLine: 1,),

                    //tow drop down lists choose location and gender
                    Row(
                      children: [
                        //location dropdown list
                        InputField(title: 'Choose your location *',hint: "", containerSize: 52,containerWidth: 145,
                          widget: DropDownList(items: const ["Kabul","Herat","Balkh","Kandahar"],color: Colors.white,textStyle: subTitleStyle,),),

                        //spacer to give it space horizontally between theme
                        const Spacer(),

                        //gender dropdown list
                        InputField(title: 'Choose your gender *',hint: "", containerSize: 52,containerWidth: 145,
                          widget: DropDownList(items: const ["male","Female"],color: Colors.white,textStyle: subTitleStyle,),),

                      ],
                    ),

                    //phone number text field with its label
                    InputField(hint: 'Phone', containerSize: 52,title: "Enter a Phone Number",maxLine: 1,),

                    //check box with its text
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'Do you want display your phone number in the app?',
                          style: subTitleStyle,
                        ),
                      ],
                    ),

                    //Date of birth with inputField within date chooser
                    InputField(title: 'Date of Birth *',hint: _getCurrentDate(), containerSize: 52,
                      widget: IconButton(
                        icon:const Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                        onPressed: (){
                          _getDateFromUser();
                        },
                      ),),

                    //choose your blood group text
                    Align(alignment:Alignment.centerLeft,child: Padding(
                      padding: const EdgeInsets.only(top: 15.0,bottom: 15),
                      child: Text("Choose your blood group",style: subTitleStyle,),
                    )),

                    //Radio Buttons of blood group
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buildRadio('A+'),
                          buildRadio('A-'),
                          buildRadio('B+'),
                          buildRadio('B-'),
                          buildRadio('O+'),
                          buildRadio('O-'),
                          buildRadio('AB+'),
                          buildRadio('AB-'),
                        ],
                      ),
                    ),

                    //spacer is for space between submit button and radio buttons
                    //if you want a customized space between radio buttons and
                    //submit button kindly use SizedBox(height:80) instead of spacer,
                    SizedBox(height: 200),

                    //submit button elevated button
                    const ElevatedBtn(btnName: "Submit", width: 325, height: 52)


            ],
          ),
        ),

    );
  }
  // Create a custom radio button widget.
  Widget buildRadio(String bloodGroup) {
    return Row(
      children: <Widget>[
        Container(
          child: Radio(
            value: bloodGroup,
            groupValue: selectedBloodGroup,
            onChanged: (value) {
              setState(() {
                selectedBloodGroup = value!;
              });
            },
          ),
        ),
        Text(bloodGroup),
      ],
    );
  }
  _getDateFromUser() async {
    DateTime? _pickerDate =await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now()
    );
    if(_pickerDate!=null){
      setState(() {
        currentDate=_pickerDate;
      });
    }
  }


}
