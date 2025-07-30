import 'package:custom_numpad/widgets/numpad.dart';
import 'package:custom_numpad/widgets/opt_input.dart';
import 'package:flutter/material.dart';

const destination = "test...@gmail.com";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<OptInputState> otpInput = GlobalKey<OptInputState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          child: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              height: double.infinity,
              constraints: BoxConstraints(
                maxWidth: 500,
                maxHeight: MediaQuery.of(context).size.height * 0.45,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter OTP Code",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "OTP code was sent to ${destination}",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),

                  SizedBox(height: 30),
                  OptInput(complete: (_) {}, key: otpInput),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: double.infinity,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.45,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(14, 255, 255, 255),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: FittedBox(
              alignment: Alignment.topCenter,
              child: NumPad(
                delete: () => otpInput.currentState?.delete(),
                onChange: (value) =>
                    otpInput.currentState?.updateInputValue(value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
