import 'package:flutter/material.dart';
import 'package:food_app/controllers/product_provider.dart';
import 'package:food_app/views/product_overview/product_overview.dart';
import 'package:food_app/views/home/single_product.dart';
import 'package:food_app/views/review_cart/review_cart.dart';
import 'package:food_app/views/search/search.dart';
import 'package:provider/provider.dart';

import 'drawer_side.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;
  Widget _buildJunk(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' Fast Food'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getHerbsProductDataList,
                    ),
                  ));
                },
                child: Text(
                  ' View All',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productId: herbsProductData.productId,
                          productPrice: herbsProductData.productPrice,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage),
                    ));
                  },
                  productId: herbsProductData.productId.toString(),
                  productPrice: herbsProductData.productPrice,
                  productImage: herbsProductData.productImage.toString(),
                  productName: herbsProductData.productName.toString(),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFresh(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('  Healthy Food'),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getFreshProductDataList,
                    ),
                  ));
                },
                child: Text(
                  ' View All',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return SingleProduct(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductOverview(
                          productId: freshProductData.productId,
                          productPrice: freshProductData.productPrice,
                          productName: freshProductData.productName,
                          productImage: freshProductData.productImage),
                    ));
                  },
                  productPrice: freshProductData.productPrice,
                  productId: freshProductData.productId.toString(),
                  productImage: freshProductData.productImage.toString(),
                  productName: freshProductData.productName.toString(),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProductData();
    productProvider.fetchFreshProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(
      context,
    );
    return Scaffold(
      drawer: DrawerSide(),
      backgroundColor: Color(0xffcbcbcb),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Home',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            )),
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Search(search: productProvider.getAllProductSearch),
                ));
              },
              icon: Icon(Icons.search, size: 17, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xffd4d181),
                child: Icon(Icons.shop, size: 17, color: Colors.black),
              ),
            ),
          )
        ],
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80')),
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            _buildJunk(context),
            _buildFresh(context),
          ],
        ),
      ),
    );
  }
}//class
