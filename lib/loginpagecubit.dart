import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit/logincubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 30),
             TextFormField(
              
                    controller: emailController,
         
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
               
                    controller: passwordController,
                  
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: BlocBuilder<LoginCubit, bool>(
                      builder: (context, isLoading) {
                        return isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () {
                  

                                    
                                    context
                                        .read<LoginCubit>()
                                        .login();
                                  
                                },
                                child: const Text('Login'),
                              );
                      },
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
