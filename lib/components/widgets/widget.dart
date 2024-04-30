import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";


//Widget for the text used throughout the app
Widget reusableText({
  required String text,
  double? fontSize,
  Color color = Colors.black,
  FontWeight fontWeight = FontWeight.w500
}){
  return Text(text,
  style: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: fontSize?? 14.sp,
    color: color,
    fontWeight: fontWeight,
  ),);
}


//Widget for the input field
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


//Widget for the submit button
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

// Back arrow to go back to previous pages
Widget backArrow(BuildContext context){
  return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back,size: 27.sp,),
  );
}



//This widget displays the title page together with the app logo
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


//This widget includes some information on the second page
Widget informationText({required String userInput, required String modifiedString}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.only(left: 10.w,top: 15.h,bottom: 15.h),
        width: 320.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: const Color(0XFFFAFAFA),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(1,2)
            )
          ],
          border: Border.all(
            color: Colors.grey.withOpacity(0.2)
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            reusableText(text: "User Input Entered: $userInput",fontSize: 16.sp),
            SizedBox(height: 15.h,),
            reusableText(text: "Modified String: $modifiedString",fontSize: 16.sp),
          ],
        ),
      ),
      SizedBox(height: 15.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: reusableText(
                text: "Characters",
                fontSize: 16.sp,fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(width: 50.w),
          Expanded(
              flex: 2,
              child: reusableText(text: "click to remove duplicates",fontSize: 15.sp,color: Colors.blue))
        ],
      ),
    ],
  );
}


//A widget to add a divider below the title page
Widget appDivider(){
  return  Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: const Divider(
        height: 1,
        thickness: 1,
      ));
}


// A widget for the characters card which might be clicked to remove duplicates
Widget charactersCard({required List<String> characters,required String char, required bool allDuplicateRemoved, required void Function()? onTap}){
  return GestureDetector(
        onTap: allDuplicateRemoved
            ? null: onTap,
        child: SizedBox(
          width: 70.w,
          height: 60.h,
          child: Card(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Center(child: reusableText(
                  text: char,
                  color: Colors.white,
                  fontSize: 24.sp)),
            ),
          ),
        ),
      );

    }

