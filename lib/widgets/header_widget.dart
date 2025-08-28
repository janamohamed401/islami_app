import 'package:flutter/cupertino.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: SafeArea(
        child: Center(


          child: Image.asset(
            "assets/images/onBoardingHeader.png",
            fit: BoxFit.cover,
          ),

        ),
      ),
    );
  }
}
