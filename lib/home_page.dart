import 'package:flutter/material.dart';
import 'package:hourglass/converter_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromARGB(255, 92, 62, 175),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 239, 228, 243),
            title: const Text(
              "Wait a second!",
              style: TextStyle(
                color: Color.fromARGB(255, 84, 42, 108),
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text("Are you sure you want to continue?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showSnackBar(context, "But, continue what?");
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _showSnackBar(
                    context,
                    "Then why did you click the ALERT button?",
                  );
                },
                child: const Text("!Yes"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "HourGlass",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 237, 247),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 54, 93),
        elevation: 5,
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () => _showSnackBar(context, "Search not ready yet 🧪"),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed:
                () => _showSnackBar(context, "Settings under construction 🔧"),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 247, 236, 251),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "Welcome to HourGlass!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 104, 54, 93),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  _showSnackBar(
                    context,
                    "Which other home are you referring to? Hogwarts!?",
                  );
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text("Contact"),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  _showSnackBar(context, "Contact with Minerva McGonagall.");
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 300), () {
                  _showSnackBar(
                    context,
                    "What's the password to your profile?",
                  );
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromARGB(255, 104, 54, 93),
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          final labels = [
            "This is THE HOME PAGE!",
            "Contact feature coming soon!",
            "You look great today!",
          ];
          if (index < labels.length) {
            _showSnackBar(context, labels[index]);
          }
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: 180,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 217, 237),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color.fromARGB(255, 104, 54, 93),
                  width: 3,
                ),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/hourglass.png',
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _showCustomDialog(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 104, 54, 93),
              ),
              icon: const Icon(Icons.warning, color: Colors.white),
              label: const Text(
                "Show Alert",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ConverterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 40, 78, 60),
              ),
              icon: const Icon(Icons.swap_horiz, color: Colors.white),
              label: const Text(
                "Go to Converter",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
