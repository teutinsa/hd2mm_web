import 'package:file_system_access_api/file_system_access_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard.dart';
import 'providers/notification_provider.dart';
import 'error_app.dart';

void main() async {
  if (!FileSystemAccess.supported) {
    runApp(ErrorApp(
      title: "File system access not supported!",
      message: "This app requires Chromes File System API. Please use a browser that supports it.\nSupported Browsers: Chrome, Edge, Opera",
    ));
    return;
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: "Helldivers 2 Mod Manager",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        routes: {
          "/": (context) {
            return DashboardPage();
          },
          "/settings": (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  AppLocalizations.of(context)!.settings_title,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        },
      ),
    );
  }
}
