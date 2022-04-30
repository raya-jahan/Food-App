import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/views/review_cart/review_cart.dart';
import 'package:food_app/views/widgets/count.dart';

enum SigninCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final int? productPrice;
  final String? productId;

  ProductOverview(
      {this.productName, this.productImage, this.productPrice, this.productId});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharacter _character = SigninCharacter.fill;

  Widget bottomNavigationBar({
    Color? iconColor,
    Color? backgroundColor,
    Color? color,
    String title = "",
    IconData? iconData,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: EdgeInsets.all(20),
              color: backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: 17,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              backgroundColor: primaryColor,
              color: Colors.red,
              iconColor: Colors.white,
              title: " Add to Cart",
              iconData: Icons.shop_outlined,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              }),
        ],
      ),
      appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            " Product Overview",
            style: TextStyle(color: Colors.yellowAccent),
          )),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                    title: Text(widget.productName.toString()),
                    subtitle: Text(" \$50"),
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                      widget.productImage.toString(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      " Available Options",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SigninCharacter.fill,
                              groupValue: _character,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value as SigninCharacter;
                                });
                              },
                            ),
                          ]),
                          Text("\$${widget.productPrice}"),
                          Count(
                            productId: widget.productId,
                            productImage: widget.productImage,
                            productName: widget.productName,
                            productPrice: widget.productPrice,
                          ),
                          // Container(
                          //     padding: EdgeInsets.symmetric(
                          //         horizontal: 30, vertical: 10),
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.black),
                          //       borderRadius: BorderRadius.circular(30),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Icon(
                          //           Icons.add,
                          //           size: 20,
                          //           color: primaryColor,
                          //         ),
                          //         Text("ADD",
                          //             style: TextStyle(
                          //                 color: Colors.red,
                          //                 fontWeight: FontWeight.bold)),
                          //       ],
                          //     ))
                        ],
                      ))
                ])),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" About this product",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          " Freshness was still frequently mentioned as well. Consumers also used adjectives like “smothered,” “loaded,” “simple,” and “fixings” to describe their burger preferences.",
                          style: TextStyle(
                            fontSize: 16,
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          )),
                    ])),
          ),
        ],
      ),
    );
  }
}
