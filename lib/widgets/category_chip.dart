import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: ChoiceChip(
        label: Text(text),
        selected: isSelected,
        showCheckmark: false,
        onSelected: (_) => onTap(),
      ),
    );
  }
}