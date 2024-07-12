import 'package:flutter/material.dart';
import 'package:wall_art/utils/drawerr.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawerr(),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Phone setting"),
          ),
          ListTile(
            title: Text("Push Notifications"),
          ),
          ListTile(
            title: Text("Update"),
          ),
          ListTile(
            title: Text("Privacy policy"),
          ),
        ],
      ),
    );
  }
}
