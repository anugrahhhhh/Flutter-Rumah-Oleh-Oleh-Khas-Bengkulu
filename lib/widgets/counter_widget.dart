import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int count;
  final Function() onIncrement;
  final Function() onDecrement;

  const CounterWidget({
    Key? key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Decrement button
          InkWell(
            onTap: onDecrement,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Icon(
                Icons.remove,
                size: 20,
                color: count > 1 ? Colors.grey[700] : Colors.grey[400],
              ),
            ),
          ),

          // Count display
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),

          // Increment button
          InkWell(
            onTap: onIncrement,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Icon(Icons.add, size: 20, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
