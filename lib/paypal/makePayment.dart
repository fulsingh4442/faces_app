import 'package:club_app/paypal/PaypalPayment.dart';
import 'package:flutter/material.dart';


class hoems extends StatefulWidget {
  const hoems({Key key}) : super(key: key);

  @override
  State<hoems> createState() => _hoemsState();
}

class _hoemsState extends State<hoems> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Paypal Payment',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const [
                  Text(
                    "Items in your Cart",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  ListTile(
                    title: Text(
                      "Product: One plus 10",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Quantity: 1",
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    trailing: Text(
                      "\$100",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              TextButton(
                //color: Colors.red,
                onPressed: () {
                  // make PayPal payment
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          payment(
                            onFinish: (number) async {
                              // payment done
                              final snackBar = SnackBar(
                                content: const Text(
                                    "Payment done Successfully"),
                                duration: const Duration(seconds: 5),
                                action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  },
                                ),
                              );
                              //_scaffoldKey.currentState!.showSnackBar(snackBar);
                            },
                          ),
                    ),
                  );
                },
                child: const Text(
                  'Pay with Paypal',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          )),
    );
  }
}
