import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grape_card/config/grape_theme.dart';
import 'package:grape_card/point/bloc/point/add_points_bloc.dart';
import 'package:grape_card/point/bloc/point/points_bloc.dart';

class AddPointsForm extends StatefulWidget {
  const AddPointsForm({super.key});

  @override
  State<AddPointsForm> createState() => _AddPointsFormState();
}

class _AddPointsFormState extends State<AddPointsForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _pointsInput(context),
          _saveButton(context),
        ],
      ),
    );
  }

  TextFormField _pointsInput(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'You most add a value';
        }
        return null;
      },
      onSaved: (value) => _onSendForm(value, context),
      decoration: InputDecoration(
        hintText: "Points",
        hintStyle: context.themeFonts.bodyLarge,
        fillColor: context.themeColors.surface,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            //We just want to set the border radius, no thickness needs to be displayed
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          //We just want to set the border radius, no thickness needs to be displayed
          borderSide: const BorderSide(color: Colors.lightBlue),
        ),
      ),
    );
  }

  Container _saveButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 40),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: context.themeColors.surface,
            foregroundColor: context.themeColors.onSurface,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 2),
        child: Text(
          "SAVE",
          style: context.themeFonts.titleMedium?.copyWith(
            color: context.themeColors.primary,
          ),
        ),
      ),
    );
  }

  void _onSendForm(String? value, BuildContext context) {
    if (value == null) return;
    final points = int.parse(value);

    context.read<AddPointsBloc>().add(
      AddPointsEvent(
        newData: PointsModel(
          points: points,
          dateAdded: DateTime.now(),
        ),
        context: context
      ),
    );
  }
}
