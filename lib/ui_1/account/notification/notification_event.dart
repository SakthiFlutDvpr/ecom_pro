abstract class SelectionEvent {}

class SelectionChanged extends SelectionEvent {
  final bool isSelected;
  SelectionChanged(this.isSelected);
}
