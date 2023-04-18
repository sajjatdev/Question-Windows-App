class QuestionModel {
  String? mapImage;
  Question? question;

  QuestionModel({this.mapImage, this.question});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    mapImage = json['mapImage'];
    question = json['question'] != null
        ? new Question.fromJson(json['question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mapImage'] = this.mapImage;
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    return data;
  }
}

class Question {
  String? image;
  String? title;
  List<Options>? options;
  String? answer;

  Question({this.image, this.title, this.options, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(new Options.fromJson(v));
      });
    }
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    if (this.options != null) {
      data['options'] = this.options!.map((v) => v.toJson()).toList();
    }
    data['answer'] = this.answer;
    return data;
  }
}

class Options {
  String? s1;
  String? s2;
  String? s3;

  Options({this.s1, this.s2, this.s3});

  Options.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
}
