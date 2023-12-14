class Tournament {
    int? torNrId;
    String? torTxNome;

    Tournament({this.torNrId, this.torTxNome});

    Tournament.fromJson(Map<String, dynamic> json) {
        torNrId = json['torNrId'];
        torTxNome = json['torTxNome'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['torNrId'] = this.torNrId;
        data['torTxNome'] = this.torTxNome;
        return data;
    }
}