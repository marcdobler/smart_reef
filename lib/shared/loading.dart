import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: CircularProgressIndicator(
          value: null,
          strokeWidth: 7.0,
        ),
      ),
    );
  }
}
