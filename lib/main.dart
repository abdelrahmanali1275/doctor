import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:esteshary_doctor/config/theme/theme_helper.dart';
import 'package:esteshary_doctor/core/helper/save_data.dart';
import 'features/accept_requests/presentation/manager/accept_requests_cubit.dart';
import 'features/splash/presentation/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.initShared();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceptRequestsCubit(),
      child: MaterialApp(
        theme: theme,
        title: 'doctor استشاري تخاطب',
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', ''),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('ar', '')],
        home: SplashScreen(),
      ),
    );
  }
}
