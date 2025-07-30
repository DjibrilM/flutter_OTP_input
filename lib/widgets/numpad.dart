import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

// ignore: must_be_immutable
class NumPad extends StatefulWidget {
  Widget? widget;
  void Function(int) onChange;
  void Function() delete;

  NumPad({required this.delete, required this.onChange, super.key});

  @override
  State<NumPad> createState() => _NumpadState();
}

class _NumpadState extends State<NumPad> {
  Widget buildNumberButton(int number) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(1000),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => widget.onChange(number),
          splashColor: Colors.transparent,
          child: Container(
            color: Colors.transparent,
            alignment: Alignment.center,
            width: 50,
            height: 50,
            child: Text(
              number.toString(),
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: isDarkMode
                  ? const Color.fromARGB(55, 201, 201, 201)
                  : const Color.fromARGB(55, 0, 0, 0),
            ),
            margin: EdgeInsets.only(bottom: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) => buildNumberButton(index + 1)),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) => buildNumberButton(4 + index)),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) => buildNumberButton(7 + index)),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: widget.delete,
                    child: Ink(
                      padding: const EdgeInsets.all(15),
                      color: Theme.of(context).primaryColor,
                      child: const Icon(
                        size: 18,
                        LucideIcons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              buildNumberButton(0),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Text(
                    '.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          widget.widget ?? const SizedBox(),
        ],
      ),
    );
  }
}
