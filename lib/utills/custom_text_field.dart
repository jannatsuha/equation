import 'package:flutter/material.dart';
import 'package:sumaiya/utills/all_colors.dart';
class CustomTextField extends StatefulWidget {
  TextEditingController controller;
  String labelText;
  String hintText;
  bool obsecureVal;
   CustomTextField({Key? key,
     required this.controller,
     required this.hintText,
     required this.obsecureVal,
   required this.labelText})
       : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}
AllColor allColor=AllColor();
String pass="";
class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 58.0,
      left: 58),
      child: TextFormField(
        validator: (value){

          if(value == null || value!.isEmpty){
            return "This field can not be empty";
          }
          // if(widget.labelText=="m"){
          //   if(){
          //     return "Invalid format";
          //   }
          // }
          //
          // if(widget.labelText=="c"){
          //   if(pass != value)
          //     return "Password didn't match";
          // }

        },
        obscureText: widget.obsecureVal,
        cursorColor: allColor.appColor,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: allColor.appColor
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(
              color: allColor.appColor
            )
          ) ,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: allColor.appColor
            )
          )
        ),
      ),
    );
  }
}
