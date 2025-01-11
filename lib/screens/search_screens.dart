import 'package:flutter/material.dart';

class SearchScreens extends StatefulWidget {
  const SearchScreens({super.key});
  @override
  State<SearchScreens> createState() => _SearchScreensState();
}

class _SearchScreensState extends State<SearchScreens> {
  late final TextEditingController controller;

@override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF47BFDF),
                Color(0xFF4A91FF),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                color: Color(0xffFCFCFC),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        onSubmitted: (value) {
                            Navigator.pop(context, value);
                        },
                      )
                    ],
                  ),
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}
