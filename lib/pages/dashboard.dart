import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../components/list_card.dart';
import '../components/notification_button.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.dashboard_title,
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          NotificationButton(),
          IconButton(
            icon: const Icon(Icons.play_circle),
            tooltip: "Run Helldivers 2 though Steam.",
            onPressed: () => launchUrl(Uri.parse("steam://run/553850")),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Settings",
            onPressed: () => Navigator.pushNamed(context, "/settings"),
          ),
          SizedBox(width: 5),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Add mods",
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          spacing: 5,
          children: [
            Expanded(
              flex: 3,
              child: ListCard(
                title: "Active Mods",
                child: null,
              ),
            ),
            Expanded(
              flex: 2,
              child: ListCard(
                title: "Available Mods",
                child: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}