import 'package:flutter/material.dart';
import 'package:online_shopping/screens/shipping_address.dart';
import 'package:online_shopping/widgets/container_button_modal.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int _type = 1;

  void _handleRadio(Object? e) =>
      setState(() {
        _type = e as int;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method"),
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Container(
                    width: 555,
                    height: 55,
                    // margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: _type == 1
                          ? Border.all(width: 1, color: Color(0xFFDB3022))
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Color(0xFFDB3022),
                                ),
                                Text(
                                  "Amazon Pay",
                                  style: _type == 1
                                      ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/amazonpay.jpg",
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 555,
                    height: 55,
                    // margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: _type == 2
                          ? Border.all(width: 1, color: Color(0xFFDB3022))
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Color(0xFFDB3022),
                                ),
                                Text(
                                  "Credit Card",
                                  style: _type == 2
                                      ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Image.asset(
                              "assets/visa.png",
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 5),
                            Image.asset(
                              "assets/MasterCard.png",
                              width: 50,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 555,
                    height: 55,
                    // margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: _type == 3
                          ? Border.all(width: 1, color: Color(0xFFDB3022))
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 3,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Color(0xFFDB3022),
                                ),
                                Text(
                                  "PayPal",
                                  style: _type == 3
                                      ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/paypal.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 555,
                    height: 55,
                    // margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      border: _type == 4
                          ? Border.all(width: 1, color: Color(0xFFDB3022))
                          : Border.all(width: 0.3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.transparent,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 4,
                                  groupValue: _type,
                                  onChanged: _handleRadio,
                                  activeColor: Color(0xFFDB3022),
                                ),
                                Text(
                                  "Google Pay",
                                  style: _type == 4
                                      ? TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)
                                      : TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/icon2.png",
                              width: 50,
                              height: 50,
                              //fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub-Total",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$300.80",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Fee",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$15.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,

                        ),
                      ),
                    ],
                  ),
                  Divider(height: 30,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "\$320.80",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => ShippingAddress(),
                      ));
                    },
                    child: ContainerButtonModel(
                      itext: "Confirm Payment",
                      containerWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      bgColor: Color(0xFFDB3022),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
