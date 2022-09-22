import 'package:flutter/material.dart';
import 'package:preferencias_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../share_preferences/preferences.dart';

class SettingsScreen extends StatefulWidget {

  static const String routerName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  //bool isDarkMode = false;
 // int gender = 1;
 // String name = 'Pedro';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text('Ajustes', style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300 )),
            const Divider(),
            SwitchListTile.adaptive(
            value: Preferences.isDarkMode,
            title: const Text('DarkMode'),
            onChanged: ( value  ) {
              Preferences.isDarkMode = value;
              final themeProvider = Provider.of<ThemeProvider>(context, listen:false);

              value
              ? themeProvider.setDarkmode()
              : themeProvider.setLightMode();

              setState(() { });

            }
            ) ,
            const Divider(),

            RadioListTile <int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const  Text('Masculino'),
                onChanged: (value){
                Preferences.gender = value ?? 1;
                setState(() { });
                }
            ),
            const Divider(),
            RadioListTile <int>(
                value: 1,
                groupValue: Preferences.gender,
                title: const  Text('Femenino'),
                onChanged: (value){
                Preferences.gender = value ?? 2;
                setState(() { });
                }
            ),
            const Divider (),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                onChanged: (value){
                  Preferences.name = value;
                  setState(() { });
                } ,
                initialValue: 'Jorge',
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre del usuario'
                ),
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}
