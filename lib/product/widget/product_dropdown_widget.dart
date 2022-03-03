import 'package:flutter/material.dart';

class ProductDropdownWidget extends StatefulWidget {
  final List<String> items;
  final void Function(String categories) onSelected;
  const ProductDropdownWidget({
    Key? key,
    required this.items,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<ProductDropdownWidget> createState() => _ProductDropdownWidgetState();
}

class _ProductDropdownWidgetState extends State<ProductDropdownWidget> {
  String _selectedValue = '';
  @override
  void didUpdateWidget(covariant ProductDropdownWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.items != oldWidget.items && widget.items.isNotEmpty) {
      changeValue(widget.items.first);
    }
  }

  changeValue(String? data) {
    if (data?.isEmpty ?? true) return;

    setState(() {
      _selectedValue = data!;
    });
    widget.onSelected(data!);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _selectedValue,
        isExpanded: true,
        items: widget.items.map((e) => DropdownMenuItem(child: Text(e), value: e)).toList(),
        onChanged: (String? value) {
          changeValue(value);
        });
  }
}
