class TournamentCategory {
  int? catNrId;
  String? catTxNome;

  TournamentCategory({this.catNrId, this.catTxNome});

  factory TournamentCategory.fromJson(Map<String, dynamic> json) {
    return TournamentCategory(
      catNrId: json['catNrId'],
      catTxNome: json['catTxNome'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catNrId'] = this.catNrId;
    data['catTxNome'] = this.catTxNome;
    return data;
  }
}
