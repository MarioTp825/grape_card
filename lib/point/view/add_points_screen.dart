import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:grape_card/config/grape_theme.dart';
import 'package:grape_card/point/bloc/point/add_points_bloc.dart';
import 'package:grape_card/point/view/add_points_form.dart';
import 'package:grape_card/utils/widgets/data_bloc_presenter.dart';

class AddPointsScreen extends StatelessWidget {
  const AddPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Points',
          style: TextStyle(color: context.themeColors.surface),
        ),
        iconTheme: IconThemeData(color: context.themeColors.surface),
        backgroundColor: context.themeColors.primary,
      ),
      backgroundColor: context.themeColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: DataBlocPresenter<AddPointsBloc, PointsModel>(
            viewBuilder: (context, __) => Center(
              child: Text(
                "Points added successfully!!",
                style: context.themeFonts.bodyLarge
                    ?.copyWith(color: context.themeColors.surface),
              ),
            ),
            initViewBuilder: (_) => const AddPointsForm()
          ),
        ),
      ),
    );
  }
}
