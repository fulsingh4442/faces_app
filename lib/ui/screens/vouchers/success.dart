import 'package:flutter/material.dart';

import '../table/table_cart.dart';
class Success extends StatefulWidget {
  const Success({Key key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: (){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => TableCart(false)), (route) => false);

      },
          child: Icon(Icons.arrow_back_ios_new)),),
      body: Container(child:
      Center(child: Container(
        margin: EdgeInsets.only(top: 200),
        child: Column(children: [
          Image.asset('assets/images/success.gif',
            fit: BoxFit.fill,
            alignment: Alignment.bottomCenter,
            width: 200,
            // height: 60,
          ),
          SizedBox(height: 10,),
          Text("Payment Success",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),


        ],),
      )),),
    );
  }
}
