import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color? color;
  final double size;

  StarRating(
      {this.starCount = 1, this.rating = .0, this.color, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        if (index % 2 == 0) {
          // This is a full star
          return Icon(
            Icons.star,
            color: rating >= (index / 2) + 1
                ? color ?? Theme.of(context).primaryColor
                : Colors.grey[400],
            size: size,
          );
        } else {
          // This is a half star
          return Icon(
            rating >= (index / 2) + 0.5 ? Icons.star_half : Icons.star_border,
            color: color ?? Theme.of(context).primaryColor,
            size: size,
          );
        }
      }),
    );
  }
}
