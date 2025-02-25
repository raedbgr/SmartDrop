import 'dart:async'; // Import for runZonedGuarded
import '/imports.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    print("Existing Firebase Apps: ${Firebase.apps.length}"); // Debugging line
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
       // options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    runApp(const MyApp());
  }, (error, stackTrace) {
    print("Unhandled error in runZonedGuarded: $error");
    print(stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      initialBinding: MyBindings(),
      getPages: Routes.routes,
    );
  }
}
