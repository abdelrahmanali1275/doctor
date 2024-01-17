import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esteshary_doctor/core/utils/app_strings.dart';

import 'package:esteshary_doctor/features/home/presentation/widgets/home_screen_body.dart';

import '../../../core/widgets/custom_app_bar.dart';
import 'manager/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const Scaffold(
        //drawer: Drawer(),
        appBar: CustomAppBar(
          widget: SizedBox(),
          text: AppStrings.home,
        ),
        body: HomeScreenBody(),
      ),
    );
  }
}
