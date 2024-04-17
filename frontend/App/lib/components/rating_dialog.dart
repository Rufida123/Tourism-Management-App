import 'package:flutter/material.dart';

void showRatingDialog(BuildContext context, Function(int) onRatingSubmit) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      int _userRating = 0;

      return AlertDialog(
        title: Text('Rate the Hotel'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _userRating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _userRating = index + 1;
                    });
                  },
                );
              }),
            );
          },
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Submit'),
            onPressed: () {
              onRatingSubmit(_userRating);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
