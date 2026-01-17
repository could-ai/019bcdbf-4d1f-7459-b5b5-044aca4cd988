import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CurrencyFormat {
  static String toBRL(double value) {
    final format = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    return format.format(value);
  }
}
