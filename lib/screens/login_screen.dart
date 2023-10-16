import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kilogram/screens/home_screen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  TextEditingController numberController = TextEditingController();
  bool isNumberValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 37,
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png"),
              ),
              const SizedBox(
                height: 55,
              ),
              SafeArea(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  padding:
                      const EdgeInsets.all(8.0), // Tambahkan padding di sini
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text('Phone Number'),
                          Text(
                            "*",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: numberController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          errorText: isNumberValid
                              ? null
                              : "Phone number doesn't valid",
                          prefixIcon: Icon(Icons.call),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ], // Allow only digits
                      ),
                      const SizedBox(
                        height: 445,
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF1E90FF)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          onPressed: () {
                            setState(() {
                              isNumberValid = numberController.text.isNotEmpty;
                              if (isNumberValid) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homescreen()));
                              }
                            });
                          },
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
