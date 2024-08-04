import 'package:flutter/material.dart';

class StandardSuggestionsBox extends StatelessWidget {
  const StandardSuggestionsBox({
    super.key,
    required this.suggestions,
    required this.borderRadius,
    required this.backgroundColor,
    required this.onSuggestionSelected,
    required this.onTapInside,
    required this.onTapOutside,
    required this.boxHeight,
    required this.boxPadding,
    required this.suggestionTextStyle,
    this.hoverColor,
    this.highlightColor,
    this.decoration,
  });

  /// List of suggestions to display. The `StandardSearchBar` class will pass
  /// the filtered and ordered suggestions to this class.
  final List<String> suggestions;

  /// The radius of the bottom corners of the suggestions box. This param is
  /// the same as the one in the `StandardSearchBar` class.
  final double borderRadius;

  /// The background color of the suggestions box. This param is the same as
  /// the one in the `StandardSearchBar` class.
  final Color backgroundColor;

  /// Callback function when a suggestion is selected. Basically, it takes the
  /// selected suggestion and put it in the text field. Then, it calls the
  /// onSubmitted callback function and unfocus the text field.
  final Function(String) onSuggestionSelected;

  /// Callback function when the suggestions box is tapped inside. Used to detect
  /// when the suggestions box is tapped inside so that the suggestions box can
  /// be closed. Same as the onTapOutside callback function.
  final Function(PointerEvent) onTapInside;

  /// Callback function when the suggestions box is tapped outside. Used to detect
  /// when the suggestions box is tapped outside so that the suggestions box can
  /// be closed. Same as the onTapInside callback function.
  final Function(PointerEvent) onTapOutside;

  /// The height of the suggestions box. This param is the same as the one in
  /// the `StandardSearchBar` class.
  final double boxHeight;

  /// The padding of the suggestions box list tiles. This param is the same as
  /// the one in the `StandardSearchBar` class.
  final EdgeInsetsGeometry boxPadding;

  /// The text style of the suggestions. This param is the same as the one in
  /// the `StandardSearchBar` class.
  final TextStyle suggestionTextStyle;

  /// The color of the suggestions when hovered. This param is the same as the one in
  /// the `StandardSearchBar` class.
  final Color? hoverColor;

  /// The color of the suggestions when highlighted. This param is the same as the one in
  /// the `StandardSearchBar` class.
  final Color? highlightColor;

  /// The decoration of the suggestions box. This param is the same as the one in
  /// the `StandardSearchBar` class.
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: onTapOutside,
      onTapInside: onTapInside,
      child: Container(
        height: boxHeight,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 22),
          child: Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),
            color: Colors.transparent,
            child: ListView.builder(
              itemCount: suggestions.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  hoverColor: hoverColor,
                  highlightColor: highlightColor ?? hoverColor,
                  onTap: () => onSuggestionSelected(suggestions[index]),
                  child: Container(
                    decoration: decoration,
                    padding: boxPadding,
                    child: Text(
                      suggestions[index],
                      style: suggestionTextStyle,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
