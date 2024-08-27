abstract class RatingEvent {}

class UpdateRatingEvent extends RatingEvent {
  final double rating;

  UpdateRatingEvent(this.rating);
}
