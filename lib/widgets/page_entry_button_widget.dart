import 'package:flutter/material.dart';
import 'package:webclient/style.dart';

class PageEntryButton extends StatefulWidget {
  final String content;
  final void Function() onTap;

  const PageEntryButton({
    super.key,
    required this.content,
    required this.onTap,
  });

  @override
  State<PageEntryButton> createState() => _PageEntryButtonState();
}

class _PageEntryButtonState extends State<PageEntryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(color: AppColor.text, width: 1.5),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              offset: const Offset(5, 5),
              color: Colors.black.withOpacity(0.3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BoldText(content: widget.content),
              const Icon(
                Icons.chevron_right_rounded,
                size: 30,
                color: AppColor.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
