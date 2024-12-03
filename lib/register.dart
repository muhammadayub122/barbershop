
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:test/cubit/registercubit.dart';
import 'package:test/mainscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Register'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.grey,
          labelColor: Colors.black,
          tabs: const [
            Icon(Icons.person),
            Icon(Icons.photo_camera_back_sharp),
            Icon(Icons.settings),
            Icon(Icons.payment),
            Icon(Icons.done_outline_outlined),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          PersonalInfoScreen(tabController: _tabController),
          UploadPictureScreen(tabController: _tabController),
          PreferencesScreen(tabController: _tabController),
          PaymentMethodScreen(tabController: _tabController),
          const AlmostThereScreen(),
        ],
      ),
    );
  }
}




class PersonalInfoScreen extends StatelessWidget {
  final TabController tabController;
  final _formKey = GlobalKey<FormState>();

  PersonalInfoScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PasswordVisibilityCubit(), 
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<PasswordVisibilityCubit, bool>(
                  builder: (context, isPasswordVisible) {
                    return TextFormField(
                      obscureText: !isPasswordVisible, 
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            context.read<PasswordVisibilityCubit>().showpassword();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
                IntlPhoneField(
                    dropdownIconPosition: IconPosition.trailing,
                    dropdownIcon: const Icon(Icons.keyboard_arrow_down),
                    focusNode: FocusNode(),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Color(0xff888888)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),const SizedBox(height: 20,),
    TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),const SizedBox(height:100,),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        tabController.index = 1;
                      }
                    },
                    child: const Text('Next', style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class PaymentMethodScreen extends StatelessWidget {
  final TabController tabController;

  PaymentMethodScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
       SizedBox(height: 60,width: double.infinity,
         child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),onPressed: (){}, 
          child: const Text('Paypal'  ,  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),)),
       ),
          const SizedBox(height: 10,),
          SizedBox(height: 60,width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),onPressed:
               (){}, child: const Text('Mastercard'  ,  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),)),
          ),
          const SizedBox(height: 10,),
      SizedBox(width: double.infinity,height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),onPressed: (){},
           child: Row(
             children: [Image.asset('name'),
               const Text('Paypal'  ,  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),),
             ],
           )),
      ),
        
          
           const SizedBox(height: 200,),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                onPressed: () {
                  tabController.index = 4;
                },
                child: const Text('Next',style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UploadPictureScreen extends StatelessWidget {
  final TabController tabController;
  final _formKey = GlobalKey<FormState>();

  UploadPictureScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Upload your picture",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                    
                    },
                    icon: const Icon(Icons.add),
                  ),
                  const Text(
                    'Choose a file',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                  onPressed: () {
                    tabController.index = 2;
                  },
                  child: const Text('Next',style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PreferencesScreen extends StatelessWidget {
  final TabController tabController;
  final _formKey = GlobalKey<FormState>();

  PreferencesScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Preferences & Availability",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Preferred Barber',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your preferred barber';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Your Availability',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your availability';
                  }
                  return null;
                },
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      tabController.index = 3;
                    }
                  },
                  child: const Text('Next',style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AlmostThereScreen extends StatefulWidget {
  const AlmostThereScreen({super.key});

  @override
  _AlmostThereScreenState createState() => _AlmostThereScreenState();
}

class _AlmostThereScreenState extends State<AlmostThereScreen> {
  bool isChecked = false;

@override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Almost there",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            const Text(
              "You are one step away from completing the registration. "
              "To wrap this up, agree to our Terms & Conditions. "
              "By checking the box below, you agree to these terms.",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text("I confirm all the information is correct."),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value ?? false;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),backgroundColor: Colors.black),
                onPressed: isChecked
                    ? () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => const Mainscreen()));
                      }
                    : null,
                child: const Text("Register",selectionColor: Colors.white,style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}