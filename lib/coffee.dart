
import 'package:flutter/material.dart';
import 'package:test/bgcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/image/Brand Logo.svg"),
                  CircleAvatar(
                    backgroundColor: AppColor.iconcolor,
                    radius: 25,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColor.background,
                      child: CircleAvatar(
                        radius: 22,
                        child: ClipRRect(
                          child: Image.asset(
                            "assets/image/Ellipse.svg",
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset("assets/icons/Group 100.svg"),
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: AppColor.iconcolor,
                        controller: control,
                        decoration: InputDecoration(
                          hintText: "Browse your favourite food...",
                          hintStyle: TextStyle(
                            fontFamily: "Rosarivo",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.iconcolor05,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Виды еды
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    FoodCategoryButton(title: "Pizza"),
                    FoodCategoryButton(title: "Burgers"),
                    FoodCategoryButton(title: "Sushi"),
                    FoodCategoryButton(title: "Pasta"),
                    FoodCategoryButton(title: "Desserts"),
                  ],
                ),
              ),
            ),
            // Список еды
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(


crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return FoodItemCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodCategoryButton extends StatelessWidget {
  final String title;

  const FoodCategoryButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.tabcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: "Rosarivo",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColor.iconcolor05,
          ),
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset("assets/image/food_placeholder.png"),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.yellow, size: 16),
                        SizedBox(width: 4),
                        Text(
                          "4.5",
                          style: TextStyle(
                            fontFamily: "Rosarivo",
                            color: AppColor.waite,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              "Delicious Food",
              style: TextStyle(
                fontFamily: "Rosarivo",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.waite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


           

