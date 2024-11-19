
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:test/mainscreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
bool isColor = true;
@override
void setState(bool)  {
  isColor = false;
  }
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
      appBar: AppBar(centerTitle: true,
        title: const Text('Register'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 1,
        bottom: TabBar(
          controller: _tabController,
      indicatorColor: Colors.grey,
          labelColor: Colors.black,
  
          tabs: [
             Icon(Icons.person,color:isColor ?Colors.black : Colors.grey
            ) ,
           Icon(Icons.photo_camera_back_sharp,color:isColor ?Colors.black : Colors.grey), 
             Icon(Icons.settings,color:isColor ?Colors.black : Colors.grey), 
           Icon(Icons.payment,color:isColor ?Colors.black : Colors.grey), 
           Icon(Icons.done_outline_outlined,color:isColor ?Colors.black : Colors.grey),
     
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
  const PersonalInfoScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [const Text("Personal Information",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Full Name',border: OutlineInputBorder(borderRadius: BorderRadius.zero)), 
              ),const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
                obscureText: true,
              ),const SizedBox(height: 20,),
            
          
  Padding(padding: const EdgeInsets.all(8.0),
         child: IntlPhoneField(
                          dropdownIconPosition: IconPosition.trailing,
                          dropdownIcon: const Icon(Icons.keyboard_arrow_down),
                          focusNode: FocusNode(),
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Color(0xff888888)),
                              border: OutlineInputBorder(borderRadius: BorderRadius.zero
                                  )),
                        ),
           
  ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Address',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),
              const SizedBox(height: 100),
              SizedBox(height: 60,width: 388,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
                  onPressed: () {
                    tabController.index = 1;
                  },
                  child: const Text('Next',style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UploadPictureScreen extends StatelessWidget {
  final TabController tabController;
  const UploadPictureScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
        
                  const Text("Upload your picture",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),const SizedBox(height: 40,),
                Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
                children:[Center(
                    child: IconButton(style: const ButtonStyle(iconSize: WidgetStatePropertyAll(28), ),onPressed:(){} , icon:const Icon(Icons.add,),),),const Text('Choose a file',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w400),),
           ] ),const SizedBox(height: 400,),
           
                
                    SizedBox(height: 60,width: 388,
                      child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        )),
                        onPressed: () {
                          tabController.index = 2;
                        },
                        child: const Text('Next',style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  
                
          ],
        ),
      ),
        
      
    );
  }
}

class PreferencesScreen extends StatelessWidget {
  final TabController tabController;
  const PreferencesScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),


child: Column(
        children: [const Text("Preference & Availability",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Preferred Barber',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
          ),const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Your Availability',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
          ),
     const SizedBox(height: 350,),
          SizedBox(height: 60,width: 388,
            child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
              onPressed: () {
                tabController.index = 3;
              },
              child: const Text('Next',style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentMethodScreen extends StatelessWidget {
  final TabController tabController;
  const PaymentMethodScreen({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
         Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [const Text("Add PaymentMethod",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Credit Card',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(labelText: 'PayPal',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),const SizedBox(height: 20,),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Google Pay',border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              ),  
           const SizedBox(height: 280,),
              SizedBox(width: 388,height: 60,
                child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  )),
                  onPressed: () {
                    tabController.index = 4;
                  },
                  child: const Text('Next',style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
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
          children: [const Text("Almost there",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w400),),const SizedBox(height: 20,),
           const Center(
             child: Text(
              "You are one step away from completing the registeration. to wrap this up, you can agree to our Terms & Conditions.We publish the Company name Terms & Conditions so that you know what to expect as you use our services.By checking the box below, you agree to these terms."),
           ),
            const SizedBox(height: 20),
            CheckboxListTile(
              title: const Text("I confirm all the information is correct."),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),const SizedBox(height: 300,),
            SizedBox(width: 388,height: 60,
              child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black,shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              )),
                onPressed:  () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const Mainscreen()));
                },
                child: const Text("Register",style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}