class Tournament {
  int? id; // id turnamen akan diberikan oleh database
  int userId;
  String tournamentName;
  String sportType;
  int numberOfParticipants;
  String tournamentFormat;
  String teamNames;

  Tournament({
    this.id,
    required this.userId,
    required this.tournamentName,
    required this.sportType,
    required this.numberOfParticipants,
    required this.tournamentFormat,
    required this.teamNames,
  });

  // Konversi objek Tournament menjadi Map yang sesuai untuk disimpan ke dalam database
  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'tournament_name': tournamentName,
      'sport_type': sportType,
      'number_of_participants': numberOfParticipants,
      'tournament_format': tournamentFormat,
      'team_names': teamNames,
    };
  }

  // Metode untuk membuat objek Tournament dari Map yang diambil dari database
  factory Tournament.fromMap(Map<String, dynamic> map) {
    return Tournament(
      id: map['id'],
      userId: map['user_id'],
      tournamentName: map['tournament_name'],
      sportType: map['sport_type'],
      numberOfParticipants: map['number_of_participants'],
      tournamentFormat: map['tournament_format'],
      teamNames: map['team_names'],
    );
  }
}
