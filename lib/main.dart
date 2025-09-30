import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingScreen(),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _cellularDataEnabled = true;
  bool _wifiEnabled = false;

  String? _notificationSetting = 'allow';

  bool _microphoneAccess = true;
  bool _locationAccess = true;
  bool _hapticsEnabled = false;

  void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM ,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Toggle",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
          ),
          SwitchListTile(
            title: const Text('Cellular Data'),
              value: _cellularDataEnabled,
              onChanged: (bool value){
                setState(() {
                  _cellularDataEnabled = value;
                });
                showToast("Selected value: Cellular Data is now ${value ? 'On' : 'Off'}");
              },
            secondary: null,
          ),
          SwitchListTile(
            title: const Text('Wi-Fi'),
            value: _wifiEnabled,
            onChanged: (bool value) {
              setState(() {
                _wifiEnabled = value;
              });
              showToast("Selected value: Wi-Fi is now ${value ? 'On' : 'Off'}");
            },
            secondary: null,
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Single check',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          RadioListTile<String>(
            title: const Text('Allow notifications'),
            value: 'allow',
            groupValue: _notificationSetting,
            onChanged: (String? value) {
              setState(() {
                _notificationSetting = value;
              });
              showToast("Selected value: Notification is now ${value != null ? 'On' : 'Off'}");
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            title: const Text('Turn off notifications'),
            value: 'turn_off',
            groupValue: _notificationSetting,
            onChanged: (String? value) {
              setState(() {
                _notificationSetting = value;
              });
              showToast("Selected value: Notification is now ${value != null ? 'Off' : 'on'}");
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(),
          const ListTile(
            title: Text(
              'Multiple check',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          CheckboxListTile(
            title: const Text('Microphone access'),
            value: _microphoneAccess,
            onChanged: (bool? value) {
              setState(() {
                _microphoneAccess = value ?? false;
              });
              showToast("Selected value: Microphone access is now ${value == true ? 'Checked' : 'Unchecked'}");
            },
          ),
          CheckboxListTile(
            title: const Text('Location access'),
            value: _locationAccess,
            onChanged: (bool? value) {
              setState(() {
                _locationAccess = value ?? false;
              });
              showToast("Selected value: Location access is now ${value == true ? 'Checked' : 'Unchecked'}");
            },
          ),
          CheckboxListTile(
            title: const Text('Haptics'),
            value: _hapticsEnabled,
            onChanged: (bool? value) {
              setState(() {
                _hapticsEnabled = value ?? false;
              });
              showToast("Selected value: Haptics is now ${value == true ? 'Checked' : 'Unchecked'}");
            },
          ),
        ],
      ),
    );
  }
}
