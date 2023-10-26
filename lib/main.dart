import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grocery_app/screens/splash/splash_screen.dart';
import 'package:grocery_app/state_management/internet_state_provider.dart';
import 'package:grocery_app/utils/color_utils.dart';

import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    child: MyApp(),
  ));
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Not working
    var connectivityStatusProvider = ref.watch(connectivityStatusProviders);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            connectivityStatusProvider == ConnectivityStatus.isConnected
                ? 'Is Connected to Internet'
                : 'Is Disconnected from Internet',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: connectivityStatusProvider ==
              ConnectivityStatus.isConnected
              ? Colors.green
              : Colors.red,
        ),
      );
    });
    /// till here

    return  MaterialApp(
      theme: ThemeData(
        primaryColor:AppColors().primaryColor
      ),
      debugShowCheckedModeBanner: false,
      home:const  SplashScreen(),
    );
  }
}
