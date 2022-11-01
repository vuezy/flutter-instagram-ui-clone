import 'dart:math' as math;
import 'package:flutter/material.dart';
import '/widgets/my_icon_button.dart';
import '/widgets/profile_picture.dart';

class Post extends StatefulWidget {
  const Post({
    super.key,
    required this.profile,
    required this.username,
    required this.post,
    required this.caption,
    required this.likes
  });

  final String profile;
  final String username;
  final String post;
  final String caption;
  final String likes;

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _isLiked = false;
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
          child: Row(
            children: [
              ProfilePicture(radius: 18.0, image: widget.profile),
              const SizedBox(width: 8.0),
              Text(widget.username, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              const Spacer(),
              MyIconButton(icon: Icons.more_vert, onPressed: () {})
            ]
          ),
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              _visible = true;
              _isLiked = true;
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.post),
                    fit: BoxFit.cover
                  )
                )
              ),
              AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutExpo,
                onEnd: () {
                  setState(() {
                    _visible = false;
                  });
                },
                child: const Icon(Icons.favorite, color: Colors.white, size: 100.0)
              ),
            ]
          )
        ),
        Row(
          children: [
            MyIconButton(
              icon: _isLiked ? Icons.favorite : Icons.favorite_border,
              onPressed: () {
                setState(() {
                  _isLiked = !_isLiked;
                });
              }
            ),
            MyIconButton(icon: Icons.mode_comment_outlined, onPressed: () {}),
            Transform.rotate(
              angle: -math.pi / 4,
              child: MyIconButton(icon: Icons.send_outlined, onPressed: () {})
            ),
            const Spacer(),
            MyIconButton(icon: Icons.bookmark_add, onPressed: () {})
          ]
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 14.0, left: 8.0, right: 8.0),
          child: RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 6,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.likes} likes\n",
                  style: const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: "${widget.username} ",
                  style: const TextStyle(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: "${widget.caption}\n",
                  style: const TextStyle(fontSize: 16.0, color: Colors.black)
                ),
                const TextSpan(
                  text: "View all comments",
                  style: TextStyle(fontSize: 15.0, color: Colors.grey, height: 1.5)
                )
              ]
            )
          )
        )
      ]
    );
  }
}