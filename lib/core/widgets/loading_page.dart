import 'package:flutter/material.dart';
import 'package:student_register/constant.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Container(
            color: Colors.white,
        child: ClipRect(
        child: Image.asset(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          AppImagesAssets.loading, // Replace with your image URL
        fit: BoxFit.cover, // Adjust image fit
        ),
        )
        ),
      )
    ;

  }
}
