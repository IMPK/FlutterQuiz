class Question {
  String instructions;
  String questionID;
  Data data;
  Solution solution;
  String widgetType;

  Question({this.instructions, this.questionID, this.data, this.solution, this.widgetType});

  Question.fromJson(Map<String, dynamic> json) {
    instructions = json['instructions'];
    questionID = json['questionID'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    solution = json['solution'] != null ? new Solution.fromJson(json['solution']) : null;
    widgetType = json['widget_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instructions'] = this.instructions;
    data['questionID'] = this.questionID;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.solution != null) {
      data['solution'] = this.solution.toJson();
    }
    data['widget_type'] = this.widgetType;
    return data;
  }
}

class Data {
  String stimulusMedia;
  Metadata metadata;
  String stimulus;
  List<Options> options;
  int marks;
  String type;

  Data({this.stimulusMedia, this.metadata,this.stimulus, this.options,this.marks, this.type});

  Data.fromJson(Map<String, dynamic> json) {
    stimulusMedia = json['stimulus_media'];
    metadata = json['metadata'] != null ? new Metadata.fromJson(json['metadata']) : null;
    stimulus = json['stimulus'];
    if (json['options'] != null) {
      options = new List<Options>();
      json['options'].forEach((v) { options.add(new Options.fromJson(v)); });
    }
    marks = json['marks'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stimulus_media'] = this.stimulusMedia;
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }

    data['stimulus'] = this.stimulus;
    if (this.options != null) {
      data['options'] = this.options.map((v) => v.toJson()).toList();
    }

    data['marks'] = this.marks;
    data['type'] = this.type;
    return data;
  }
}

class Metadata {
  int duration;
  String difficulty;
  String bloom;
  String construct;
  bool shuffle;
  int version;

  Metadata({this.duration, this.difficulty,  this.bloom, this.construct, this.shuffle, this.version});

  Metadata.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    difficulty = json['difficulty'];
    bloom = json['bloom'];
    construct = json['construct'];
    shuffle = json['shuffle'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['difficulty'] = this.difficulty;
    data['bloom'] = this.bloom;
    data['construct'] = this.construct;
    data['shuffle'] = this.shuffle;
    data['version'] = this.version;
    return data;
  }
}

class Options {
  List<Feedback> feedback;
  int score;
  String label;
  int value;
  int isCorrect;

  Options({this.feedback, this.score, this.label, this.value, this.isCorrect});

  Options.fromJson(Map<String, dynamic> json) {
    if (json['feedback'] != null) {
      feedback = new List<Feedback>();
      json['feedback'].forEach((v) { feedback.add(new Feedback.fromJson(v)); });
    }
    score = json['score'];
    label = json['label'];
    value = json['value'];
    isCorrect = json['isCorrect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feedback != null) {
      data['feedback'] = this.feedback.map((v) => v.toJson()).toList();
    }
    data['score'] = this.score;
    data['label'] = this.label;
    data['value'] = this.value;
    data['isCorrect'] = this.isCorrect;
    return data;
  }
}

class Feedback {
  String text;

  Feedback({this.text});

  Feedback.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class Solution {
  String answer;
  bool stepNav;
  String type;

  Solution({this.answer, this.stepNav, this.type});

  Solution.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    stepNav = json['step_nav'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['step_nav'] = this.stepNav;
    data['type'] = this.type;
    return data;
  }
}


