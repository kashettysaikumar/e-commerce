import 'package:flutter/material.dart';
import 'package:online_shopping/widgets/container_button_modal.dart';

import 'order_confirm_screen.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  var _value = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipping Address"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(), labelText: "Full Name"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(), labelText: "Mobile number"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(), labelText: "Address"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(), labelText: "City"),
                ),
                SizedBox(height: 20),
                /*TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "State/Province/Region"),
                ),*/
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("-State/Province/Region-"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("Telangana"),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("Andhra Pradesh"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Punjab"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("Maharashtra"),
                      value: "4",
                    ),
                    DropdownMenuItem(
                      child: Text("Goa"),
                      value: "5",
                    ),
                  ],
                  onChanged: (String? value) {},
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(),
                      labelText: "Zip Code (postal Code)"),
                ),
                SizedBox(height: 20),
                /*TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Country"
                  ),
                ),*/
                DropdownButtonFormField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDB3022))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text("-Country-"),
                      value: "-1",
                    ),
                    DropdownMenuItem(
                      child: Text("Australia"),
                      value: "1",
                    ),
                    DropdownMenuItem(
                      child: Text("Canada"),
                      value: "2",
                    ),
                    DropdownMenuItem(
                      child: Text("Germany"),
                      value: "3",
                    ),
                    DropdownMenuItem(
                      child: Text("India"),
                      value: "4",
                    ),
                    DropdownMenuItem(
                      child: Text("Usa"),
                      value: "5",
                    ),
                  ],
                  onChanged: (String? value) {},
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderConfirmScreen(),
                        ));
                  },
                  child: ContainerButtonModel(
                    itext: "Add Address",
                    containerWidth: MediaQuery.of(context).size.width,
                    bgColor: Color(0xFFDB3022),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
