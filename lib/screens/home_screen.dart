import 'package:flutter/material.dart';
import '/widgets/my_icon_button.dart';
import '/widgets/profile_picture.dart';
import '/widgets/post.dart';
import '/utils/app_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: Image.asset('assets/images/instagram_logo.png', height: 45.0),
        actions: [
          MyIconButton(icon: Icons.add_box_outlined, onPressed: () {}),
          MyIconButton(icon: Icons.favorite_border_outlined, onPressed: () {}),
          MyIconButton(icon: Icons.mark_unread_chat_alt, onPressed: () {})
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(6.0),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromARGB(104, 75, 75, 75),
                        radius: 36.5,
                        child: IconButton(
                          icon: const Icon(Icons.add, size: 32.0, color: Colors.white),
                          onPressed: () {}
                        )
                      ),
                      const SizedBox(height: 2.5),
                      const Text("Add Your Story", style: TextStyle(fontSize: 12.0))
                    ]
                  )
                ),
                ...List.generate(7, (index) {
                  return Container(
                    margin: const EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfilePicture(radius: 32.0, image: AppData.profilePictures[index]),
                        const SizedBox(height: 2.5),
                        Text(AppData.username[index], style: const TextStyle(fontSize: 12.0))
                      ],
                    ),
                  );
                })
              ]
            )
          ),
          ...List.generate(6, (index) {
            return Post(
              profile: AppData.profilePictures[index + 1],
              username: AppData.username[index + 1],
              post: AppData.posts[index],
              caption: AppData.captions[index],
              likes: AppData.likes[index]
            );
          })
        ]
      )
    );
  }
}