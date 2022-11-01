import 'package:flutter/material.dart';
import '/widgets/my_icon_button.dart';
import '/widgets/profile_picture.dart';
import '/widgets/view_all_posts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "vuezy_mirrlian",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
        ),
        actions: [
          MyIconButton(icon: Icons.add_box_outlined, onPressed: () {}),
          MyIconButton(icon: Icons.menu, onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ProfilePicture(radius: 36.0, image: 'assets/images/profile1.jpg'),
                    Column(
                      children: const [
                        Text("2", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2.0),
                        Text("Posts")
                      ],
                    ),
                    Column(
                      children: const [
                        Text("312", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2.0),
                        Text("Followers")
                      ],
                    ),
                    Column(
                      children: const [
                        Text("52", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        SizedBox(height: 2.0),
                        Text("Following")
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                const Text("Vuezy Mirrlian", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const Text("Hey there, I'm learning Flutter!", style: TextStyle(fontSize: 16.0)),
                const SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 35.0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    backgroundColor: const Color.fromARGB(142, 216, 199, 199)
                  ),
                  onPressed: () {},
                  child: const Text("Edit Profile", style: TextStyle(color: Colors.black87))
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                            border: Border.all(
                              color: Colors.black
                            )
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 32.0,
                            child: IconButton(
                              icon: const Icon(Icons.add, size: 32.0, color: Colors.black),
                              onPressed: () {}
                            )
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        const Text("Add Story", style: TextStyle(fontSize: 12.0))
                      ]
                    ),
                    ...List.generate(3, (index) => const CircleAvatar(
                      backgroundColor: Color.fromARGB(142, 216, 199, 199),
                      radius: 32.0
                    )),
                  ]
                )
              ],
            ),
          ),
          const ViewAllPosts(),
        ],
      )
    );
  }
}