import 'package:flutter/material.dart';
import 'package:food_app/config/colors.dart';
import 'package:food_app/controllers/review_cart_provider.dart';
import 'package:food_app/models/review_cart_model.dart';
import 'package:food_app/views/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Would you like to delete CartProducts?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
        bottomNavigationBar: ListTile(
            title: Text(
              "Total Amount",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "\$ ${reviewCartProvider.getTotalPrice()}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Container(
                width: 160,
                child: MaterialButton(
                  child: Text("Submit"),
                  color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    30,
                  )),
                  onPressed: () {},
                ))),
        appBar: AppBar(
          title: Text(
            " Review Cart",
            style: TextStyle(
              color: textColor,
              fontSize: 18,
            ),
          ),
        ),
        body: reviewCartProvider.getReviewCartDataList.isEmpty
            ? Center(
                child: Text(" NO DATA"),
              )
            : ListView.builder(
                itemCount: reviewCartProvider.getReviewCartDataList.length,
                itemBuilder: (context, index) {
                  ReviewCartModel data =
                      reviewCartProvider.getReviewCartDataList[index];
                  return Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      SingleItem(
                        isBool: true,
                        productImage: data.cartImage,
                        productName: data.cartName,
                        productPrice: data.cartPrice,
                        productQuantiity: data.cartQuantity,
                        productId: data.cartId,
                        onDelete: () {
                          showAlertDialog(context, data);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }));
  }
}
