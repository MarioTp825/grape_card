import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/config/grape_theme.dart';
import 'package:grape_card/point/bloc/point/add_points_bloc.dart';
import 'package:grape_card/point/bloc/point/points_bloc.dart';
import 'package:grape_card/point/view/point_list_view.dart';
import 'package:grape_card/utils/bloc/data/data_event.dart';
import 'package:grape_card/utils/widgets/data_bloc_presenter.dart';
import 'package:grape_card/utils/widgets/grape_divider.dart';

class PointDashboardScreen extends StatelessWidget {
  const PointDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PointsBloc>().add(GetPointsEvent());

    return Scaffold(
      floatingActionButton: _actionButton(context),
      body: DataBlocPresenter<PointsBloc, PointDashboardModel>(
          viewBuilder: (context, dashboard) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/grape.png"),
                const SizedBox(height: 20),
                Text("Grape Platinum Card",
                    style: context.themeFonts.bodyLarge),
                Text("${dashboard.totalPoints} pts",
                    style: context.themeFonts.titleMedium),
                const GrapeDivider(),
                const SizedBox(height: 50),
                Expanded(child: PointListView(items: dashboard.pointsHistory)),
              ],
            ),
          ),
        );
      }),
    );
  }

  FloatingActionButton _actionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<AddPointsBloc>().add(RefreshDataEvent<PointsModel>());
        Navigator.of(context).pushNamed(ScreenRoute.addPoints.route).then((_) {
          if (!context.mounted) return;
          context.read<PointsBloc>().add(RefreshPointsEvent());
        });
      },
      shape: const CircleBorder(),
      backgroundColor: context.themeColors.primary,
      child: Icon(
        Icons.add_rounded,
        color: context.themeColors.surface,
        size: 50,
      ),
    );
  }
}
