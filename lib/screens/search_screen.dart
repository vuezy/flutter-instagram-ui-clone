import 'package:flutter/material.dart';
import '/widgets/profile_picture.dart';
import '/utils/app_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          splashRadius: 25.0,
          onPressed: () {},
          icon: Icon(Icons.keyboard_backspace, size: 40.0, color: Colors.black.withOpacity(0.7))
        ),
        leadingWidth: 40.0,
        title: TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            constraints: const BoxConstraints(maxHeight: 36.0),
            filled: true,
            fillColor: const Color.fromARGB(142, 216, 199, 199),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none
            ),
            hintText: "Search"
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Recent", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(fontSize: 14.0, color: Colors.blue))
              ]
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                ProfilePicture(radius: 28.0, image: AppData.profilePictures[0]),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppData.username[0], style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text("Cute Cat", style: TextStyle(color: Color.fromARGB(255, 123, 123, 123)))
                  ]
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 25.0,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 123, 123, 123),
                    size: 18.0
                  )
                )
              ]
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                ProfilePicture(radius: 28.0, image: AppData.profilePictures[1]),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppData.username[1], style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text("Lily", style: TextStyle(color: Color.fromARGB(255, 123, 123, 123)))
                  ]
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 25.0,
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromARGB(255, 123, 123, 123),
                    size: 18.0
                  )
                )
              ]
            )
          ]
        ),
      )
    );
  }
}