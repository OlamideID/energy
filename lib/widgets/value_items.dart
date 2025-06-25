import 'package:flutter/material.dart';

class ValueItem extends StatefulWidget {
  final IconData icon;
  final String title;

  const ValueItem({super.key, required this.icon, required this.title});

  @override
  State<ValueItem> createState() => _ValueItemState();
}

class _ValueItemState extends State<ValueItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: _isHovered ? Colors.green : Colors.grey.shade300,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow:
                    _isHovered
                        ? [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ]
                        : [],
              ),
              child: Icon(
                widget.icon,
                size: 40,
                color: _isHovered ? Colors.green : Colors.black87,
              ),
            ),
            SizedBox(height: 12),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: _isHovered ? Colors.green : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
