import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:grape_card/config/grape_theme.dart';
import 'package:grape_card/utils/extensions/datetime_extension.dart';

class PointListView extends StatelessWidget {
  final List<PointsModel> items;

  const PointListView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return emptyPoints(context);
    }

    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(vertical: 5),
      itemCount: items.length,
      itemBuilder: (context, i) {
        /*We need to do this because if we add the reverse property in
         the builder it will order the values from the bottom of the
         screen to the top and we want it to be order from the top
         to the bottom. */
        final index = (items.length - 1) - i;
        final item = items[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${item.points} pts"),
            Text(item.dateAdded.toPointsFormat()),
          ],
        );
      },
    );
  }

  Widget emptyPoints(BuildContext context) {
    return Center(
      child: Text(
        "You have not added any points yet. Click on the add icon to start tracking your data!",
        style: context.themeFonts.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
