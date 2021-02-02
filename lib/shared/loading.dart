import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 7.0,
        ),
      ),
    );
  }
}
