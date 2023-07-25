import 'package:flutter/material.dart';

class CharacteristicOpinionStar extends StatelessWidget {
  const CharacteristicOpinionStar({super.key, required this.characteristic, required this.opinion});

  final String characteristic;
  final int? opinion;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          characteristic,
        ),
        const SizedBox(
          height: 10,
        ),
        if (opinion == 5)
          const Row(
            children: [
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
            ],
          ),
        if (opinion == 4)
          const Row(
            children: [
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star_border
              ),
            ],
          ),
        if (opinion == 3)
          const Row(
            children: [
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
            ],
          ),
        if (opinion == 2)
          const Row(
            children: [
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
            ],
          ),
        if (opinion == 1)
          const Row(
            children: [
              Icon(
                  Icons.star
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
            ],
          ),
        if (opinion == 0)
          const Row(
            children: [
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
              Icon(
                  Icons.star_border
              ),
            ],
          ),
      ],
    );
  }
}