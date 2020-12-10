import 'package:flutter/cupertino.dart';
class StartImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: Container(
          child: Image.asset('images/image_interviewer.png', height: 80,),
        ),
      ),
    );
  }
}
