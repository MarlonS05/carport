import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Multi-line text field matching garage form styling (§5.5).
class GarageTextareaField extends StatefulWidget {
  const GarageTextareaField({
    super.key,
    required this.label,
    required this.controller,
    this.placeholder,
    this.validator,
    this.onChanged,
    this.readOnly = false,
  });

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool readOnly;

  @override
  State<GarageTextareaField> createState() => _GarageTextareaFieldState();
}

class _GarageTextareaFieldState extends State<GarageTextareaField> {
  final _focusNode = FocusNode();
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() => _focused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = GarageTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: GarageTextStyles.fieldLabel(theme)),
        Padding(
          padding: const EdgeInsets.only(top: GarageSpacing.labelGap),
          child: AnimatedContainer(
            duration: Duration.zero,
            decoration: BoxDecoration(
              color: theme.inputBackground,
              borderRadius: BorderRadius.circular(GarageRadius.input),
              border: Border.all(
                color: _focused ? theme.ring : theme.border,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(GarageRadius.input - 1),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                validator: widget.validator,
                onChanged: widget.onChanged,
                readOnly: widget.readOnly,
                minLines: 3,
                maxLines: 3,
                style: GarageTextStyles.body(theme, color: theme.foreground),
                cursorColor: theme.primary,
                decoration: InputDecoration(
                  hintText: widget.placeholder,
                  hintStyle: GarageTextStyles.body(theme),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
