import 'package:agenda_clinica/config/navigation/routes_name.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formLogInKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  late String userName;

  final defaultContainerInputDecoration = const BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5)));

  final activeContainerInputDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.pink.shade400, width: 2),
      borderRadius: const BorderRadius.all(Radius.circular(5)));

  final defaultInputBorder = InputBorder.none;

  final defaultInputLabelTheme = const TextStyle(
    fontSize: 13,
    color: Color.fromARGB(255, 185, 183, 183),
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/home2.png',
            width: screenWidth * 0.9, // 80% del ancho de la pantalla
            height: screenHeight * 0.2, // 40% de la altura de la pantalla
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  home['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(
                  home['subtitle']!,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Form(
              key: _formLogInKey,
              child: Column(
                children: [
                  Container(
                    width: 400,
                    decoration: defaultContainerInputDecoration,
                    padding: const EdgeInsets.only(left: 24),
                    child: TextFormField(
                      
                      obscureText: true,
                      controller: controller,
                      style: Theme.of(context).textTheme.labelLarge,
                      onSaved: (userNameValue) {
                        userName = userNameValue!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return home['pswd']!;
                        }

                        if (value != '0517') {
                          return home['subtitle']!;
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        border: defaultInputBorder,
                        label: Text(
                          home['hintPswd']!,
                          style: defaultInputLabelTheme,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 32, bottom: 48),
                    width: 394,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formLogInKey.currentState!.validate()) {
                          userName = controller.text;
                          Navigator.of(context).pushReplacementNamed(
                              RoutesName.listUser,
                              arguments: userName);
                        }
                      },
                      child: Text(home['button']!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
