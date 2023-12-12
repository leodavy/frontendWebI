 class User {
    int? usuNrId;
    String? usuTxNome;
    String? usuTxLogin;
    String? usuTxSenha;
    DateTime? usuDtCadastro;

    User({this.usuNrId, this.usuTxNome, this.usuTxLogin, this.usuTxSenha, this.usuDtCadastro});

    User.fromJson(Map<String, dynamic> json) {
    usuNrId = json['usuNrId'];
    usuTxNome = json['usuTxNome'];
    usuTxLogin = json['usuTxLogin'];
    usuTxSenha = json['usuTxSenha'];
    usuDtCadastro = json['usuDtCadastro'];
    }

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuNrId'] = this.usuNrId;
    data['usuTxNome'] = this.usuTxNome;
    data['usuTxLogin'] = this.usuTxLogin;
    data['usuTxSenha'] = this.usuTxSenha;
    data['usuDtCadastro'] = this.usuDtCadastro;
    return data;
    }
    }
