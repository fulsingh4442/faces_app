// // import 'dart:core';
// // import 'package:club_app/paypal/PaypalServices.dart';
// // import 'package:flutter/material.dart';
// //
// // import 'package:webview_flutter/webview_flutter.dart';
// //
// // class Payment extends StatefulWidget {
// //   final Function onFinish;
// //
// //   Payment({this.onFinish});
// //
// //   @override
// //   State<StatefulWidget> createState() {
// //     return PaymentState();
// //   }
// // }
// //
// // class PaymentState extends State<Payment> {
// // //   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// // //     String? checkoutUrl;
// // //    String? executeUrl;
// // //    String? accessToken;
// // //   Services services = Services();
// // //
// // //   // you can change default currency according to your need
// // //   Map<dynamic,dynamic> defaultCurrency = {"symbol": "USD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};
// // //
// // //   bool isEnableShipping = false;
// // //   bool isEnableAddress = false;
// // //
// // //   String returnURL = 'return.example.com';
// // //   String cancelURL= 'cancel.example.com';
// // //
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //
// // //     Future.delayed(Duration.zero, () async {
// // //       try {
// // //         accessToken = (await services.getAccessToken())!;
// // //
// // //         final transactions = getOrderParams();
// // //         final res =
// // //         await services.createPaypalPayment(transactions, accessToken);
// // //         if (res != null) {
// // //           setState(() {
// // //             checkoutUrl = res["approvalUrl"];
// // //             executeUrl = res["executeUrl"];
// // //           });
// // //         }
// // //       } catch (e) {
// // //         print('exception: '+e.toString());
// // //         final snackBar = SnackBar(
// // //           content: Text(e.toString()),
// // //           duration: Duration(seconds: 10),
// // //           action: SnackBarAction(
// // //             label: 'Close',
// // //             onPressed: () {
// // //               // Some code to undo the change.
// // //             },
// // //           ),
// // //         );
// // //        // _scaffoldKey.currentState.showSnackBar(snackBar);
// // //       }
// // //     });
// // //   }
// // //
// // //   // item name, price and quantity
// // //   String itemName = 'iPhone 7';
// // //   String itemPrice = '200';
// // //   int quantity = 1;
// // //
// // //   Map<String, dynamic> getOrderParams() {
// // //     List items = [
// // //       {
// // //         "name": itemName,
// // //         "quantity": quantity,
// // //         "price": itemPrice,
// // //         "currency": defaultCurrency["currency"]
// // //       }
// // //     ];
// // //
// // //
// // //     // checkout invoice details
// // //     String totalAmount = '200';
// // //     String subTotalAmount = '200';
// // //     String shippingCost = '0';
// // //     int shippingDiscountCost = 0;
// // //     String userFirstName = 'Arsalan';
// // //     String userLastName = 'Umar';
// // //     String addressCity = 'Islamabad';
// // //     String addressStreet = "i-10";
// // //     String addressZipCode = '44000';
// // //     String addressCountry = 'Pakistan';
// // //     String addressState = 'Islamabad';
// // //     String addressPhoneNumber = '+923200811288';
// // //
// // //     Map<String, dynamic> temp = {
// // //       "intent": "sale",
// // //       "payer": {"payment_method": "paypal"},
// // //       "transactions": [
// // //         {
// // //           "amount": {
// // //             "total": totalAmount,
// // //             "currency": defaultCurrency["currency"],
// // //             "details": {
// // //               "subtotal": subTotalAmount,
// // //               "shipping": shippingCost,
// // //               "shipping_discount":
// // //               ((-1.0) * shippingDiscountCost).toString()
// // //             }
// // //           },
// // //           "description": "The payment transaction description.",
// // //           "payment_options": {
// // //             "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
// // //           },
// // //           "item_list": {
// // //             "items": items,
// // //             if (isEnableShipping &&
// // //                 isEnableAddress)
// // //               "shipping_address": {
// // //                 "recipient_name": userFirstName +
// // //                     " " +
// // //                     userLastName,
// // //                 "line1": addressStreet,
// // //                 "line2": "",
// // //                 "city": addressCity,
// // //                 "country_code": addressCountry,
// // //                 "postal_code": addressZipCode,
// // //                 "phone": addressPhoneNumber,
// // //                 "state": addressState
// // //               },
// // //           }
// // //         }
// // //       ],
// // //       "note_to_payer": "Contact us for any questions on your order.",
// // //       "redirect_urls": {
// // //         "return_url": returnURL,
// // //         "cancel_url": cancelURL
// // //       }
// // //     };
// // //     return temp;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     print(checkoutUrl);
// // //
// // //     if (checkoutUrl != null) {
// // //       return Scaffold(
// // //         appBar: AppBar(
// // //           backgroundColor: Theme.of(context).backgroundColor,
// // //           leading: GestureDetector(
// // //             child: Icon(Icons.arrow_back_ios),
// // //             onTap: () => Navigator.pop(context),
// // //           ),
// // //         ),
// // //         body: WebView(
// // //           initialUrl: checkoutUrl,
// // //           javascriptMode: JavascriptMode.unrestricted,
// // //           navigationDelegate: (NavigationRequest request) {
// // //             if (request.url.contains(returnURL)) {
// // //               final uri = Uri.parse(request.url);
// // //               final payerID = uri.queryParameters['PayerID'];
// // //               if (payerID != null) {
// // //                 services
// // //                     .executePayment(executeUrl, payerID, accessToken)
// // //                     .then((id) {
// // //                   widget.onFinish(id);
// // //                   Navigator.of(context).pop();
// // //                 });
// // //               } else {
// // //                 Navigator.of(context).pop();
// // //               }
// // //               Navigator.of(context).pop();
// // //             }
// // //             if (request.url.contains(cancelURL)) {
// // //               Navigator.of(context).pop();
// // //             }
// // //             return NavigationDecision.navigate;
// // //           },
// // //         ),
// // //       );
// // //     } else {
// // //       return Scaffold(
// // //         key: _scaffoldKey,
// // //         appBar: AppBar(
// // //           leading: IconButton(
// // //               icon: Icon(Icons.arrow_back),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               }),
// // //           backgroundColor: Colors.black12,
// // //           elevation: 0.0,
// // //         ),
// // //         body: Center(child: Container(child: CircularProgressIndicator())),
// // //       );
// // //     }
// // //   }
// // // }
// //   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
// //   String checkoutUrl;
// //   String executeUrl;
// //   String accessToken;
// //   PaypalServices services = PaypalServices();
// //
// //   // You may alter the default value to whatever you like.
// //   Map<dynamic, dynamic> defaultCurrency = {
// //     "symbol": "USD ",
// //     "decimalDigits": 2,
// //     "symbolBeforeTheNumber": true,
// //     "currency": "USD"
// //   };
// //   bool isEnableShipping = false;
// //   bool isEnableAddress = false;
// //   String returnURL = 'return.example.com';
// //   String cancelURL = 'cancel.example.com';
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     Future.delayed(Duration.zero, () async {
// //       try {
// //         accessToken = await services.getAccessToken();
// //         final transactions = getOrderParams();
// //         final res =
// //         await services.createPaypalPayment(transactions, accessToken);
// //         if (res != null) {
// //           setState(() {
// //             checkoutUrl = res["approvalUrl"];
// //             executeUrl = res["executeUrl"];
// //           });
// //         }
// //       } catch (ex) {
// //         final snackBar = SnackBar(
// //           content: Text(ex.toString()),
// //           duration: const Duration(seconds: 10),
// //           action: SnackBarAction(
// //             label: 'Close',
// //             onPressed: () {
// //               // Some code for undoing the alteration.
// //             },
// //           ),
// //         );
// //         //_scaffoldKey.currentState!.showSnackBar(snackBar);
// //       }
// //     });
// //   }
// //
// //   // item name, price and quantity here
// //   String itemName = 'One plus 10';
// //   String itemPrice = '100';
// //   int quantity = 1;
// //
// //   Map<String, dynamic> getOrderParams() {
// //     List items = [
// //       {
// //         "name": itemName,
// //         "quantity": quantity,
// //         "price": itemPrice,
// //         "currency": defaultCurrency["currency"]
// //       }
// //     ];
// //     // Checkout Invoice Specifics
// //     String totalAmount = '100';
// //     String subTotalAmount = '100';
// //     String shippingCost = '0';
// //     int shippingDiscountCost = 0;
// //     String userFirstName = 'john';
// //     String userLastName = 'smith';
// //     String addressCity = 'USA';
// //     String addressStreet = "i-10";
// //     String addressZipCode = '44000';
// //     String addressCountry = 'Pakistan';
// //     String addressState = 'Islamabad';
// //     String addressPhoneNumber = '+1 223 6161 789';
// //     Map<String, dynamic> temp = {
// //       "intent": "sale",
// //       "payer": {"payment_method": "paypal"},
// //       "transactions": [
// //         {
// //           "amount": {
// //             "total": totalAmount,
// //             "currency": defaultCurrency["currency"],
// //             "details": {
// //               "subtotal": subTotalAmount,
// //               "shipping": shippingCost,
// //               "shipping_discount": ((-1.0) * shippingDiscountCost).toString()
// //             }
// //           },
// //           "description": "The payment transaction description.",
// //           "payment_options": {
// //             "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
// //           },
// //           "item_list": {
// //             "items": items,
// //             if (isEnableShipping && isEnableAddress)
// //               "shipping_address": {
// //                 "recipient_name": userFirstName + " " + userLastName,
// //                 "line1": addressStreet,
// //                 "line2": "",
// //                 "city": addressCity,
// //                 "country_code": addressCountry,
// //                 "postal_code": addressZipCode,
// //                 "phone": addressPhoneNumber,
// //                 "state": addressState
// //               },
// //           }
// //         }
// //       ],
// //       "note_to_payer": "Contact us for any questions on your order.",
// //       "redirect_urls": {"return_url": returnURL, "cancel_url": cancelURL}
// //     };
// //     return temp;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     print(checkoutUrl);
// //     if (checkoutUrl != null) {
// //       return Scaffold(
// //         appBar: AppBar(
// //           backgroundColor: Theme
// //               .of(context)
// //               .backgroundColor,
// //           leading: GestureDetector(
// //             child: const Icon(Icons.arrow_back_ios),
// //             onTap: () => Navigator.pop(context),
// //           ),
// //         ),
// //         body: WebView(
// //           initialUrl: checkoutUrl,
// //           javascriptMode: JavascriptMode.unrestricted,
// //           navigationDelegate: (NavigationRequest request) {
// //             if (request.url.contains(returnURL)) {
// //               final uri = Uri.parse(request.url);
// //               final payerID = uri.queryParameters['PayerID'];
// //               if (payerID != null) {
// //                 services
// //                     .executePayment(executeUrl, payerID, accessToken)
// //                     .then((id) {
// //                   widget.onFinish(id);
// //                   Navigator.of(context).pop();
// //                 });
// //               } else {
// //                 Navigator.of(context).pop();
// //               }
// //               Navigator.of(context).pop();
// //             }
// //             if (request.url.contains(cancelURL)) {
// //               Navigator.of(context).pop();
// //             }
// //             return NavigationDecision.navigate;
// //           },
// //         ),
// //       );
// //     } else {
// //       return Scaffold(
// //         key: _scaffoldKey,
// //         appBar: AppBar(
// //           leading: IconButton(
// //               icon: const Icon(Icons.arrow_back),
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               }),
// //           backgroundColor: Colors.black12,
// //           elevation: 0.0,
// //         ),
// //         body: const Center(child: CircularProgressIndicator()),
// //       );
// //     }
// //   }
// // }
//
//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'dart:core';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'package:flutter/material.dart';
// class PaymentScreen extends StatefulWidget {
//   final OrderModel orderModel;
//   PaymentScreen({this.orderModel});
//
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//    String selectedUrl;
//   double value = 0.0;
//   bool _canRedirect = true;
//   bool _isLoading = true;
//   final Completer<WebViewController> _controller = Completer<WebViewController>();
//    WebViewController controllerGlobal;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedUrl = '${AppConstants.BASE_URL}/payment-mobile?customer_id=${widget.orderModel.userId}&order_id=${widget.orderModel.id}';
//     //selectedUrl="https://mvs.bslmeiyu.com";
//     // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () => _exitApp(context),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("Payment"),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back_ios),
//             onPressed:()=> _exitApp(context),
//           ),
//          // backgroundColor: AppColors.mainColor,
//         ),
//         body: Center(
//           child: Container(
//            // width: Dimensions.WEB_MAX_WIDTH,
//             child: Stack(
//               children: [
//                 WebView(
//                   javascriptMode: JavascriptMode.unrestricted,
//                   initialUrl: selectedUrl,
//                   gestureNavigationEnabled: true,
//
//                   userAgent: 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13E233 Safari/601.1',
//                   onWebViewCreated: (WebViewController webViewController) {
//                     _controller.future.then((value) => controllerGlobal = value);
//                     _controller.complete(webViewController);
//                     //_controller.future.catchError(onError)
//                   },
//                   onProgress: (int progress) {
//                     print("WebView is loading (progress : $progress%)");
//                   },
//                   onPageStarted: (String url) {
//                     print('Page started loading: $url');
//                     setState(() {
//                       _isLoading = true;
//                     });
//                     print("printing urls "+url.toString());
//                     _redirect(url);
//
//                   },
//                   onPageFinished: (String url) {
//                     print('Page finished loading: $url');
//                     setState(() {
//                       _isLoading = false;
//                     });
//                     _redirect(url);
//
//                   },
//                 ),
//                 _isLoading ? Center(
//                   child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
//                 ) : SizedBox.shrink(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _redirect(String url) {
//     print("redirect");
//     if(_canRedirect) {
//       bool _isSuccess = url.contains('success') && url.contains(AppConstants.BASE_URL);
//       bool _isFailed = url.contains('fail') && url.contains(AppConstants.BASE_URL);
//       bool _isCancel = url.contains('cancel') && url.contains(AppConstants.BASE_URL);
//       if (_isSuccess || _isFailed || _isCancel) {
//         _canRedirect = false;
//       }
//       if (_isSuccess) {
//         Get.offNamed(RouteHelper.getOrderSuccessRoute(widget.orderModel.id.toString(), 'success'));
//       } else if (_isFailed || _isCancel) {
//         Get.offNamed(RouteHelper.getOrderSuccessRoute(widget.orderModel.id.toString(), 'fail'));
//       }else{
//         print("Encountered problem");
//       }
//     }
//   }
//
//   Future<bool> _exitApp(BuildContext context) async {
//     if (await controllerGlobal.canGoBack()) {
//       controllerGlobal.goBack();
//       return Future.value(false);
//     } else {
//       print("app exited");
//       return true;
//       // return Get.dialog(PaymentFailedDialog(orderID: widget.orderModel.id.toString()));
//     }
//   }
//
// }