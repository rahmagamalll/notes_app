import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_floating_action_button.dart';
import 'package:notes_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      floatingActionButton: CustomeFloatingActionBotton(),
    );
  }
}
