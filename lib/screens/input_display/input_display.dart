import 'package:flutter/material.dart';

class DisplayUserInputs extends StatefulWidget {
  const DisplayUserInputs({Key? key}) : super(key: key);

  @override
  State<DisplayUserInputs> createState() => _DisplayUserInputsState();
}

class _DisplayUserInputsState extends State<DisplayUserInputs> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
            return ListTile();
          }
      ),
    );
  }
}
