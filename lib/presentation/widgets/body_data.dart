import 'package:flutter/material.dart';
import 'package:nepdometer/classes/data_response.dart';

import '../../constants.dart';
import 'data_tile.dart';

class BodyData extends StatelessWidget {
  const BodyData({
    Key? key,
    required this.data,
    required this.isTotalSelected,
  }) : super(key: key);

  final DataResponse? data;
  final bool isTotalSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 3,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            DataTile(
              data: isTotalSelected ? data!.totalCases : data!.recentCases,
              title: 'Infected',
              color: kBlue,
            ),
            DataTile(
              data: data!.activeCases,
              title: 'Active',
              color: kOrange,
              icon: Icons.thermostat_outlined,
            ),
            DataTile(
                data: isTotalSelected
                    ? data!.totalRecovered
                    : data!.recentRecovered,
                title: 'Recovered',
                color: kGreen,
                icon: Icons.emoji_emotions_outlined),
            DataTile(
              data: isTotalSelected ? data!.totalDeath : data!.recentDeath,
              title: 'Death',
              color: kRed,
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 30),
          color: kGreen2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.science_outlined),
              Text(
                '\t${data!.totalTest}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const Text(
                '\t|\tTotal Test',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        )
      ],
    );
  }
}
