import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/controllers/product_provider.dart';

import 'package:food_app/main.dart';

void main() {
  test("calculateTotalAmount", () {
    ProductProvider p = ProductProvider();
    expect(60, p.calculateTotalAmount(3));
  });
}
