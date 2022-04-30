import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/controllers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  String? productName;
  String? productImage;
  String? productId;

  int? productPrice;
  Count({
    this.productId,
    this.productImage,
    this.productName,
    this.productPrice,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  bool isTrue = false;
  int count = 1;
  getAddQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  {
                    if (value.exists)
                      {
                        setState(() {
                          count = value.get("cartQuantity");
                          isTrue = value.get("isAdd");
                        })
                      }
                  }
                },
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddQuantity();
    // ignore: avoid_print

    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
        child: Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellowAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    } else if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDataDelete(widget.productId);
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                  ),
                ),
                Text(
                  "$count",
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartProvider.updateReviewCartData(
                      cartId: widget.productId,
                      cartImage: widget.productImage,
                      cartName: widget.productName,
                      cartPrice: widget.productPrice,
                      cartQuantity: count,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartImage: widget.productImage,
                    cartName: widget.productName,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                  );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: primaryColor),
                ),
              ),
            ),
    ));
  }
}
