class EvaluationModel {
  final String playerName;
  final String imageUrl;
  final String ageGroup;
  final String dueDate;
  final String headCoach;
  final Map<String, int> skillRatings;
  final String coachNotes;

  EvaluationModel({
    required this.playerName,
    required this.imageUrl,
    required this.ageGroup,
    required this.dueDate,
    required this.headCoach,
    required this.skillRatings,
    required this.coachNotes,
  });

  factory EvaluationModel.fromJson(Map<String, dynamic> json) {
    return EvaluationModel(
      playerName: json['playerName'],
      imageUrl: json['imageUrl'],
      ageGroup: json['ageGroup'],
      dueDate: json['dueDate'],
      headCoach: json['headCoach'],
      skillRatings: Map<String, int>.from(json['skillRatings']),
      coachNotes: json['coachNotes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'playerName': playerName,
      'imageUrl': imageUrl,
      'ageGroup': ageGroup,
      'dueDate': dueDate,
      'headCoach': headCoach,
      'skillRatings': skillRatings,
      'coachNotes': coachNotes,
    };
  }
}
