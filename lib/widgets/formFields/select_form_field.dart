import 'package:flutter/material.dart';

/// A convenience widget that wraps a [DropdownButton] in a [FormField].
class SelectFormField<T> extends FormField<T> {
  /// Creates a [DropdownButton] widget wrapped in an [InputDecorator] and
  /// [FormField].
  ///
  /// The [DropdownButton] [items] parameters must not be null.
  SelectFormField({
    super.key,
    required T value,
    required List<DropdownMenuItem<T>> items,
    required this.onChanged,
    this.decoration = const InputDecoration(),
    this.selectedItemBuilder,
    super.onSaved,
    super.validator,
    TextAlign textAlign = TextAlign.right,
    Widget? hint,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    bool isExpanded = true,
    bool alignedDropdown = true,
  })  : assert(
          items.isEmpty ||
              value == null ||
              items.where((DropdownMenuItem<T> item) {
                    return item.value == value;
                  }).length ==
                  1,
          'There should be exactly one item with [DropdownButton]\'s value: '
          ' $value. \n'
          'Either zero or 2 or more [DropdownMenuItem]s were detected '
          'with the same value',
        ),
        super(
            // key: key, // now handled by super.key
            // onSaved: onSaved, // now handled by super.onSaved
            initialValue: value,
            // validator: validator, // now handled by super.validator
            autovalidateMode: autovalidateMode,
            builder: (FormFieldState<T> field) {
              final InputDecoration effectiveDecoration = decoration
                  .applyDefaults(Theme.of(field.context).inputDecorationTheme);
              return InputDecorator(
                textAlign: textAlign,
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                isEmpty: value == null,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<T>(
                    isDense: false,
                    isExpanded: isExpanded,
                    value: value,
                    items: items,
                    hint: hint,
                    onChanged: field.didChange,
                    selectedItemBuilder: selectedItemBuilder,
                  ),
                ),
              );
            });

  /// Called when the user selects an item.
  final ValueChanged<T> onChanged;
  final InputDecoration decoration;
  final DropdownButtonBuilder? selectedItemBuilder;

  @override
  FormFieldState<T> createState() => _SelectFormFieldState<T>();
}

class _SelectFormFieldState<T> extends FormFieldState<T> {
  @override
  SelectFormField<T> get widget => super.widget as SelectFormField<T>;

  @override
  void didChange(T? value) {
    super.didChange(value);
    if (value != null) {
      widget.onChanged(value);
    }
  }

  @override
  void reset() {
    super.reset();
    didChange(null);
  }
}
