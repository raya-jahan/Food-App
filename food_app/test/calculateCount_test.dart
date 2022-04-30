import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_app/controllers/product_provider.dart';

import 'package:food_app/main.dart';

void main() {
  test("calculateCount", () {
    ProductProvider p = ProductProvider();
    expect(4, p.calculateCount(4));
  });
}
