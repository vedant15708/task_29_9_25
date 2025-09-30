import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: visiblity(),
    );
  }
}

class visiblity extends StatefulWidget {
  const visiblity({super.key});

  @override
  State<visiblity> createState() => _visiblityState();
}

class _visiblityState extends State<visiblity> {
  bool isLogoVisible = true;
  void showLogo() {
    setState(() {
      isLogoVisible = true;
    });
  }

  void hideLogo() {
    setState(() {
      isLogoVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLogoVisible,
                  child:FlutterLogo(size: 200,)
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                  onPressed:  isLogoVisible ? null : showLogo,
                  child: const Text('Show Logo')
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: isLogoVisible ? hideLogo : null,
                child: const Text('Hide Logo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
