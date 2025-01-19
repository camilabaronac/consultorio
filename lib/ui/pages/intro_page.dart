import 'package:agenda_clinica/config/navigation/routes_name.dart';
import 'package:agenda_clinica/config/constants/labels.dart';
import 'package:agenda_clinica/ui/pages/add_pacient_page.dart';
import 'package:agenda_clinica/ui/pages/user_list_page.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _formLogInKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  late String userName;

  final defaultContainerInputDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(color: Colors.black, width: 1),
  );

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
    final buttonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 252, 194, 194),
      ),
    );
    const textButtonColor = TextStyle(
      color: Colors.black,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/home2.png',
              width: screenWidth * 0.9, // 80% del ancho de la pantalla
              height: screenHeight * 0.2, // 40% de la altura de la pantalla
            ),
            Text(
              home['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              home['subtitle']!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AddPacientPage(),
                ),
              ),
              style: buttonStyle,
              child: const Text('Registrar paciente', style: textButtonColor),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: ()=>Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const UserListPage(),
                ),
              ),
              style: buttonStyle,
              child: const Text('Consultar paciente', style: textButtonColor),
            ),
          ],
        ),
      ),
    );
  }
}
