import 'package:flutter/material.dart';
import 'package:food_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];

  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrice: element.get("productPrice"),
      productId: element.get("productId"),
    );
    search.add(productModel);
  }

  ///////////////HerbsProduct and Junkies///////////////////////
  List<ProductModel> herbsProductList = [];
  int calculateTotalAmount(int itemCount) {
    return 20 * itemCount;
  }

  fetchHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("JunkProduct").get();
    value.docs.forEach((element) {
      productModels(element);

      newList.add(productModel);
    });
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  String? searchItem(count) {
    bool isBool = false;
    int count = 2;
    if (count == 2) {
      isBool = true;
      String? a = "true";
      return a;
    }
  }

  String? authentication(email, password) {
    bool isBool = false;
    String a = "test@gmail.com";
    String b = "testPassword";

    if (email == a && password == b) {
      isBool = true;
      String? a = "verified";
      return a;
    }
  }

  //////////////////// Fresh Product and Healthy food /////////////
  List<ProductModel> freshProductList = [];
  int itemCount = 4;
  int calculateCount(itemCount) {
    return itemCount;
  }

  fetchFreshProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("FreshProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    freshProductList = newList;
    notifyListeners();
  }

  String? pressDelete(count) {
    bool isBool = false;
    int count = 5;
    if (count == 5) {
      isBool = true;
      String? a = "deleted";
      return a;
    }
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

  String? addToCart(count) {
    bool isBool = false;

    if (count == 6) {
      isBool = true;
      String? a = "Added Successfully";
      return a;
    }
  }

  /////////////////Search Return////////////////////
  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
