class PhraseModel {
  List<Phrases>? phrases;

  PhraseModel({this.phrases});

  PhraseModel.fromJson(Map<String, dynamic> json) {
    if (json['phrases'] != null) {
      phrases = <Phrases>[];
      json['phrases'].forEach((v) {
        phrases!.add(Phrases.fromJson(v));
      });
    }
  }
}

class Phrases {
  List<String>? highlight;
  String? title;
  String? subline;
  int? min;
  String? condition;
  String? color;
  int? max;

  Phrases(
      {this.highlight,
      this.title,
      this.subline,
      this.min,
      this.condition,
      this.color,
      this.max});

  Phrases.fromJson(Map<String, dynamic> json) {
    highlight = json['highlight'].cast<String>();
    title = json['title'];
    subline = json['subline'];
    min = json['min'];
    condition = json['condition'];
    color = json['color'];
    max = json['max'];
  }
}
