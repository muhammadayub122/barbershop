import 'package:flutter/material.dart';
import 'package:test/mainscreen.dart';
import 'package:test/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: SizedBox(
                    width: 100,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,mainAxisSize: MainAxisSize.min,
                      children: [
                       
                      ],
                    ),
                  ),
                ),const SizedBox(width: 100,child: Icon(Icons.storm),),
                const Text(
                  'Welcome back ',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const Spacer(flex: 2),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Name or phone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'kaytadan yozin';
                          }
                          if (value.length < 8) {
                            return 'Email 8 dan kopro bolishi kere';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Enter your Password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'kaytadan yozin';
                          }
                          if (value.length < 6) {
                            return 'Password 6 dan kopro bolishi kere';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 60,
                        width: 388,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                       Navigator.push(context,MaterialPageRoute(builder: (_)=>const Mainscreen()) );
                            }
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 3),Row(children:
                 [const SizedBox(width: 50,), const Text("Do not have an account? ",
                 style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300),) , GestureDetector(
                  onTap: () {
            
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.underline,fontWeight: FontWeight.w600
                    ),
                  ),
                ),],),
              
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}



