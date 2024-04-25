import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

Widget reusableText({
  required String text,
  double fontSize = 14,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.w500
}){
  return Text(text,
  style: TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
  ),);
}


Widget textField({
  required String text,
  required TextEditingController controller,
  double fontSize = 15,
  required Function() onChangedValue}){
  return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextField(
        controller: controller,
        onChanged: (value){
          onChangedValue();
        },
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(fontSize: fontSize),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue
            ),
          ),
          enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
          color: Colors.purple
          ),
          )
        ),
      ));
}

Widget generalButton({required String text,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(left: 24.w),
      width: 250.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.blue
      ),
      child: Center(
        child: reusableText(text: text,color: Colors.white,fontSize: 18.sp),
      ),
    ),
  );

}

Widget backArrow(BuildContext context){
  return Container(
    margin: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.r),
      border: Border.all(
        color: Colors.black38
      )
    ),
    child: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,size: 27.sp,),
    ),
  );
}