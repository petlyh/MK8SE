import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mk8se/models/models.dart";
import "package:mk8se/widgets/main_panel.dart";
import "package:mk8se/widgets/top_bar.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:url_launcher/url_launcher_string.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FileData.initEmpty();
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  // disable splash animations on web
  static const splashFactory = kIsWeb ? NoSplash.splashFactory : null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MK8SE",
      theme: ThemeData(
        splashFactory: splashFactory,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
      ),
      darkTheme: ThemeData(
        splashFactory: splashFactory,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const repoUrl = "https://github.com/petlyh/MK8SE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        toolbarHeight: 48,
        titleSpacing: 4,
        title: const TopRow(),
        actions: [
          IconButton(
              tooltip: "Source Code",
              onPressed: () => launchUrlString(repoUrl),
              icon: const Icon(Icons.code)),
          IconButton(
              tooltip: "Info",
              onPressed: () => showInfo(context),
              icon: const Icon(Icons.info_outline)),
          const SizedBox(width: 4),
        ],
      ),
      body: const MainPanel(),
    );
  }

  void showInfo(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    if (!context.mounted) {
      return;
    }

    showAboutDialog(
      context: context,
      applicationVersion: packageInfo.version,
      applicationLegalese: "Licensed under AGPLv3.",
    );
  }
}