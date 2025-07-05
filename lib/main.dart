import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_app/core/database/cache/cashe_helper.dart';
import 'package:patient_app/core/global_cubits/change_language_cubit/change_language_cubit.dart';
import 'package:patient_app/core/global_cubits/change_themes_cubit/change_themes_cubit.dart';
import 'package:patient_app/core/helpers/bloc_observer.dart';
import 'package:patient_app/core/services/get_it.dart';
import 'package:patient_app/patient_app.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.storage.isGranted; 
  Bloc.observer = MyBlocObserver();
  setup();
  await getIt<CacheHelper>().init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangeLanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ChangeThemesCubit(),
        ),
      ],
      child: const PatientApp(),
    ),
  );
}
