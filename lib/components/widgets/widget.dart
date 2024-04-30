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
  FocusNode? focusNode,
  required Function() onChangedValue
}){
  return Container(
      width: 280.w,
      margin: EdgeInsets.only(top: 5.h),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: (value){
          value = controller.text.toLowerCase();
          controller.text = value;
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
          color: Color(0XFFCAC9D9)
          ),
          )
        ),
      ));
}


Widget generalButton({required String text,required void Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 280.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
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


Widget titlePage({required String text, required String image}){
  return  Padding(
    padding: EdgeInsets.only(left: 88.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(image,width: 50.w,),
        SizedBox(height: 20.w,),
        reusableText(text: text,fontSize: 24.sp,fontWeight: FontWeight.w700),
      ],
    ),
  );
}

Widget informationText({required String userInput, required String modifiedString}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      reusableText(text: "User Input Entered: $userInput",fontSize: 20.sp),
      SizedBox(height: 20.h,),
      reusableText(text: "Modified String: $modifiedString",fontSize: 20.sp),
      SizedBox(height: 30.h,),
    ],
  );
}