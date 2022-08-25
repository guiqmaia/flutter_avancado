import 'package:flutter/foundation.dart';

class Idea {
  String? title;
  String? inspiration;
  String? date;
  Idea({this.title, this.inspiration, this.date});
  Idea.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title']! as String,
          inspiration: json['inspiration']! as String,
          date: json['date']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'title': title,
      'inspiration': inspiration,
      'date': date,
    };
  }
}

class IdeasModel extends ChangeNotifier {
  List<Idea> _ideasList = [];

  List<Idea> get getAllIdeas => _ideasList;

  void initializeIdeas(List<Idea> ideasList) {
    _ideasList = ideasList;
  }

  void addIdea(Idea ideaItem) {
    _ideasList.add(ideaItem);
    notifyListeners();
  }

  void deleteIdea(Idea ideaItem) {
    _ideasList.remove(ideaItem);
    notifyListeners();
  }
}
