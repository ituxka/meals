import 'package:meals/models/meal.dart';

extension ShortStringComplexity on Complexity {
  String toShortString() {
    return this.toString().split('.').last;
  }
}

extension ShortStringAffordability on Affordability {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
