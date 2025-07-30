import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class OptInput extends StatefulWidget {
  final int index;
  void Function(int) complete;
  OptInput({this.index = 4, super.key, required this.complete});

  @override
  State<OptInput> createState() => OptInputState();
}

class OptInputState extends State<OptInput> {
  // ignore: library_private_types_in_public_api
  List<GlobalKey<_OtpTextFieldState>> inputs = List.generate(
    4,
    (index) => GlobalKey<_OtpTextFieldState>(),
  );
  int currentFocused = 0;
  late int currentClicked = -1;

  updateInputValue(int value) {
    if (currentClicked != -1) {
      inputs[currentClicked].currentState!.updateValue(value);
    } else {
      final GlobalKey<_OtpTextFieldState> notFoundKey =
          GlobalKey<_OtpTextFieldState>();
      final GlobalKey<_OtpTextFieldState> targetInput = inputs
          .where(
            (element) => (element.currentState?.value ?? -1) < 0,
          ) // Filter for empty fields
          .firstWhere(
            (element) =>
                true, // Condition is effectively "any element from the filtered list"
            orElse: () =>
                notFoundKey, // Return sentinel if no empty field is found
          );

      // Check if a valid (non-sentinel) empty input field was found.
      if (targetInput != notFoundKey) {
        // Now, safely update its value.
        targetInput.currentState?.updateValue(value);
        HapticFeedback.heavyImpact(); // Vibrate when a value is successfully updated
      } else {
        // Optional: Handle the case where all OTP fields are already filled.
        // You might want to show a message, or simply do nothing.

        HapticFeedback.heavyImpact(); // Still provide feedback for a blocked action
      }
    }

    setState(() {
      currentClicked = -1;
    });

    final sum = inputs
        .map((e) => e.currentState?.value.toString() ?? "-1")
        .reduce((a, b) => a + b);

    if (sum.length == inputs.length && !sum.contains("-1")) {
      widget.complete(int.parse(sum));
    }
  }

  void delete() {
    final GlobalKey<_OtpTextFieldState> notFoundKey =
        GlobalKey<_OtpTextFieldState>();

    final GlobalKey<_OtpTextFieldState> input = inputs.lastWhere(
      (element) => (element.currentState?.value ?? -1) > -1,
      orElse: () => notFoundKey,
    );

    input.currentState?.delete();

    HapticFeedback.heavyImpact();
    setState(() {
      currentClicked = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Row(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...inputs.asMap().entries.map((entry) {
                        int index = entry.key;
                        var e = entry.value;
                        return OtpTextField(
                          currentClicked: currentClicked,
                          onSelect: (index) {
                            setState(() {
                              currentClicked = index;
                            });
                          },
                          key: e,
                          index: index,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class OtpTextField extends StatefulWidget {
  final int index;
  final Function(int) onSelect;
  int currentClicked;
  OtpTextField({
    required this.currentClicked,
    required this.onSelect,
    required this.index,
    super.key,
  });

  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double opacity = 1;
  int value = -1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(
      begin: 40,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateValue(int value) {
    setState(() {
      this.value = value;
    });

    opacity = 1;
    _controller.forward(from: 0);

    Future.delayed(Duration(milliseconds: 400), () {
      setState(() {
        opacity = 0;
      });
    });
  }

  delete() {
    setState(() {
      value = -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    late Color color;
    late Color background;

    if (widget.currentClicked == widget.index && value < 0) {
      color = Theme.of(context).colorScheme.primary;
      background = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    } else if (widget.currentClicked == widget.index && value > -1) {
      color = Colors.white54;
      background = Colors.transparent;
    } else if (widget.currentClicked == widget.index || value > -1) {
      color = Theme.of(context).colorScheme.primary;
      background = Theme.of(context).colorScheme.primary.withOpacity(0.1);
    } else {
      color = Colors.white54;
      background = Colors.transparent;
    }

    return GestureDetector(
      onTap: () {
        widget.onSelect(widget.index);
      },
      child: Material(
        color: value > 0 ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 70,
          clipBehavior: Clip.antiAlias,
          width: 70,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 1),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: FadeTransition(
                      opacity: _controller,
                      child: Text(
                        value < 0 ? "" : value.toString(),
                        style: GoogleFonts.nunito(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: opacity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
