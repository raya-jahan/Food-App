import 'package:flutter/material.dart';
import 'package:food_app/views/widgets/count.dart';
import 'package:food_app/views/widgets/count.dart';

class SingleProduct extends StatelessWidget {
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final VoidCallback? onTap;
  final String? productId;
  SingleProduct(
      {this.productImage,
      this.productName,
      this.onTap,
      this.productPrice,
      this.productId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                color: Color(0xffcbcbcb),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 150,
                      padding: EdgeInsets.all(5),
                      width: double.infinity,
                      child: Image.network(
                        productImage.toString(),
                        //'https://images.unsplash.com/photo-1571091655789-405eb7a3a3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJ1cmdlcnxlbnwwfHwwfHw%3D&w=1000&q=80'
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$productPrice\$/5 gram',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  height: 30,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.yellowAccent),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        ' 50 Gram',
                                        style: TextStyle(fontSize: 10),
                                      )),
                                      Expanded(
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Count(
                                productId: productId,
                                productImage: productImage,
                                productName: productName,
                                productPrice: productPrice,
                              ),
                            ],
                          ),

                          //
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
