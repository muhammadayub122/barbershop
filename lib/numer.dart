import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'numbercubit.dart'; 

class Numerscreen extends StatelessWidget {
  const Numerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NumberCubit(),
      child: BlocBuilder<NumberCubit,int>(
        builder: (context,state) {
          return Scaffold(
            body: Center(
              child: Text(
                    '$state',
                    style: const TextStyle(fontSize: 40),
                  ),
            ),
            bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.read<NumberCubit>().state,
          
              onTap: (index) {
              context.read<NumberCubit>().newNumber(index); 
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: '1',backgroundColor: Color(Int32x4.xxww)),
                BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: '2',backgroundColor: Color(Int32x4.xxww)),
                BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: '3',backgroundColor: Color(Int32x4.xxww)),
                BottomNavigationBarItem(icon: Icon(Icons.looks_4), label: '4',backgroundColor: Color(Int32x4.xxww)),
              ],
            ),
          );
        }
      ),
    );
  }
}