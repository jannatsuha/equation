import 'package:flutter/material.dart';
import 'package:sumaiya/Screens/graph_screen.dart';
import 'package:sumaiya/utills/all_colors.dart';
import 'package:sumaiya/utills/custom_button.dart';
import 'package:sumaiya/utills/custom_text_field.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
AllColor allColor=AllColor();
final _formKey= GlobalKey<FormState>();
String radioBtnValue1= "none";
String radioBtnValue2= "none";
TextEditingController val1Controller= TextEditingController();
TextEditingController val2Controller= TextEditingController();
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: allColor.appBarColor,
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Select Equation Type:"),
            ListTile(
              title:  Text('Linear Equation'),
              leading: Radio(
                value: "L",
                groupValue: radioBtnValue1,
                onChanged: ( value) {
                  setState(() {
                    radioBtnValue1 = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title:  Text('Non-linear Equation'),
              leading: Radio(
                value: "NL",
                groupValue: radioBtnValue1,
                onChanged: ( value) {
                  setState(() {
                    radioBtnValue1 = value.toString();
                  });
                },
              ),
            ),


            SizedBox(
              height: 20,
            ),
            radioBtnValue1=="L"?
            Column(
              children: [
                Text("Select Equation Format:"),
                ListTile(
                  title:  Text('y=mx+c'),
                  leading: Radio(
                    value: "E1",
                    groupValue: radioBtnValue2,
                    onChanged: ( value) {
                      setState(() {
                        radioBtnValue2 = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title:  Text('ax+by+c=0'),
                  leading: Radio(
                    value: "E2",
                    groupValue: radioBtnValue2,
                    onChanged: ( value) {
                      setState(() {
                        radioBtnValue2 = value.toString();
                      });
                    },
                  ),
                ),
              ],
            ):Column(),

            SizedBox(
              height: 15,
            ),
            radioBtnValue2=="E1"?
            Column(
              children: [
                Text("Input Data: "),
                SizedBox(
                  height: 15,
                ),
                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: val1Controller,
                          labelText: "m",
                          hintText: "Enter value of 'm'",
                          obsecureVal: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextField(controller: val2Controller,
                          labelText: "c",
                          hintText: "Enter value of 'c'",
                          obsecureVal: false,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: (){

                            Navigator.push(context,
                                MaterialPageRoute(builder:
                                (context)=> GraphScreen(
                                  m: double.parse(val1Controller.text),
                                  c: double.parse(val2Controller.text),
                                )));
                          },
                          child: CustomButton(
                            height: 50,
                            width: 200,
                            btnText: "Show Graph",
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ):Column(),

          ],
        ),
      ),
    );
  }
}
