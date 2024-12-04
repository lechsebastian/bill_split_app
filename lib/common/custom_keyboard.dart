import 'package:flutter/material.dart';

class CustomKeyboard extends StatelessWidget {
  final void Function(String) onKeyPress;

  const CustomKeyboard({
    Key? key,
    required this.onKeyPress,
  }) : super(key: key);

  static String removeLastChar(String bill) {
    if (bill.isNotEmpty) {
      return bill.substring(0, bill.length - 1);
    } else {
      return '0';
    }
  }

  static String addDot(String bill) {
    if (!bill.contains('.') && bill.length < 7) {
      return '$bill.';
    }
    return bill;
  }

  static String addNewKey(String bill, String key) {
    if (bill.contains('.')) {
      final decimalPart = bill.split('.')[1];
      if (decimalPart.length < 2) {
        return bill + key;
      }
      if (bill == '0.00') {
        return key;
      }
    } else {
      if (bill.length < 6) {
        return bill + key;
      }
    }
    return bill;
  }

  @override
  Widget build(BuildContext context) {
    final List<List<String>> keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['0', '.', '⌫']
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: keys.map((row) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: row.map((key) {
            return Expanded(
              child: _buildKey(key),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildKey(String key) {
    return GestureDetector(
      onTap: () => onKeyPress(key),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          // color: Colors.deepPurple.shade300,
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Center(
          child: Text(
            key,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
