import 'package:carport/theme/garage_theme.dart';
import 'package:flutter/material.dart';

/// Labelled text field with garage styling and focus ring (§5.4).
class GarageInputField extends StatefulWidget {
  const GarageInputField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.placeholder,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.errorText,
  });

  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final String? placeholder;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorText;

  @override
  State<GarageInputField> createState() => _GarageInputFieldState();
}

class _GarageInputFieldState extends State<GarageInputField> {
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
    final hasIcon = widget.icon != null;
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

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
                color: hasError
                    ? theme.destructive
                    : _focused
                        ? theme.ring
                        : theme.border,
                width: 1,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(GarageRadius.input - 1),
              child: TextFormField(
                controller: widget.controller,
                focusNode: _focusNode,
                keyboardType: widget.keyboardType,
                validator: widget.validator,
                onChanged: widget.onChanged,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
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
                  contentPadding: EdgeInsets.fromLTRB(
                    hasIcon ? 40 : 16,
                    12,
                    16,
                    12,
                  ),
                  prefixIcon: hasIcon
                      ? Padding(
                          padding: const EdgeInsets.only(left: 12, right: 8),
                          child: Icon(
                            widget.icon,
                            size: 14,
                            color: theme.mutedForeground,
                          ),
                        )
                      : null,
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              widget.errorText!,
              style: GarageTextStyles.listMeta(theme).copyWith(
                color: theme.destructive,
              ),
            ),
          ),
      ],
    );
  }
}