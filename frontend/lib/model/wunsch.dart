import 'package:meta/meta.dart';

class Wunsch {
  String title;
  String description;
  String link;
  int createdInMs;

  Wunsch({@required this.title, this.description, this.link, this.createdInMs})
      : assert(title != null);
}
