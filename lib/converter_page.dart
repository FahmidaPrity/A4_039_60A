import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController textEditingController = TextEditingController();
  String result = "";
  String? errorText;

  void convert() {
    final text = textEditingController.text;

    if (text.isEmpty) {
      setState(() {
        errorText = "We can't read your mind. Minutes, please! :)";
        result = "";
      });
      return;
    }

    final int? totalMinutes = int.tryParse(text);

    if (totalMinutes == null || totalMinutes < 0) {
      setState(() {
        errorText = "This is not a valid you know :(";
        result = "";
      });
      return;
    }

    final int hours = totalMinutes ~/ 60;
    final int minutes = totalMinutes % 60;

    setState(() {
      errorText = null;
      result = "$hours hour(s) and $minutes minute(s)";
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 176, 190, 110),
        width: 2,
      ),
    );

    final labelStyle = const TextStyle(
      color: Color.fromARGB(255, 143, 97, 97),
      fontSize: 18,
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "HourGlass",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color.fromARGB(255, 255, 237, 247),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 54, 93),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 500,
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.hourglass_bottom,
                    size: 60,
                    color: Color.fromARGB(255, 138, 41, 86),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Convert Minutes to Hours & Minutes",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 139, 117, 73),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 138, 99, 99),
                    ),
                    decoration: InputDecoration(
                      labelText: "Enter minutes...",
                      labelStyle: labelStyle,
                      hintText: "e.g. 119",
                      prefixIcon: const Icon(
                        Icons.timer,
                        color: Color.fromARGB(255, 88, 61, 105),
                      ),
                      errorText: errorText,
                      focusedBorder: border,
                      enabledBorder: border,
                      errorBorder: border,
                      focusedErrorBorder: border,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: convert,
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 40, 78, 63),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Convert",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    result,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 103, 90, 119),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
