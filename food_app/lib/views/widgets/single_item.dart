import "package:flutter/material.dart";
import 'package:food_app/config/colors.dart';
import 'package:food_app/views/widgets/count.dart';

class SingleItem extends StatelessWidget {
  String? productImage;
  String? productName;
  int? productPrice;
  String? productId;
  int? productQuantiity;
  VoidCallback? onDelete;

  bool? isBool = false;
  SingleItem(
      {this.productId,
      this.productQuantiity,
      this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 100,
                    child: Center(
                      child: Image.network(
                        productImage.toString(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName.toString(),
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$productPrice\$",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      isBool == false
                          ? Container(
                              margin: EdgeInsets.only(right: 15),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "50 Gram",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Icon(Icons.arrow_drop_down,
                                        size: 20, color: primaryColor),
                                  ),
                                ],
                              ),
                            )
                          : Text(" 50 gram"),
                    ],
                  ),
                )),
                Expanded(
                  child: Container(
                      height: 100,
                      padding: isBool == false
                          ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                          : EdgeInsets.only(left: 15, right: 15),
                      child: isBool == false
                          ? Count(
                              productId: productId,
                              productImage: productImage,
                              productName: productName,
                              productPrice: productPrice,
                            )
                          : Column(children: [
                              InkWell(
                                onTap: onDelete,
                                child: Icon(Icons.delete,
                                    size: 30, color: Colors.black54),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  height: 25,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // children: [
                                      // Icon(
                                      //   Icons.remove,
                                      //   color: primaryColor,
                                      //   size: 20,
                                      // ),
                                      // Text(
                                      //   "1",
                                      //   style: TextStyle(
                                      //     color: Colors.black,
                                      //     fontSize: 14,
                                      //   ),
                                      // ),
                                      // Icon(
                                      //   Icons.add,
                                      //   color: primaryColor,
                                      //   size: 20,
                                      // ),
                                    ),
                                  ))
                            ])),
                ),
              ],
            )),
        isBool == false
            ? Container()
            : Divider(height: 1, color: Colors.black54),
      ],
    );
  }
}
