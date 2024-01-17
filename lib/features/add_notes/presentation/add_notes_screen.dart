import 'package:flutter/material.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';
import 'package:esteshary_doctor/core/widgets/custom_app_bar.dart';
import 'package:esteshary_doctor/features/add_notes/presentation/widgets/add_notes_screen_body.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.addYourNotes,
      ),
      body: AddNotesScreenBody(),
    );
  }
}
