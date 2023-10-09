class UserHome {
  String? status;
  String? message;
  List<Data>? data;

  UserHome({this.status, this.message, this.data});

  UserHome.fromJson(Map<dynamic, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class Data {
  String? candidateFName;
  String? candidateSName;
  String? candidateTName;
  String? candidateLName;
  String? candidateGender;
  int? candidateNumberVote;
  String? candidatePhoneNumber;
  int? candidateParty;
  int? candidateId;
  String? candidatePassword;
  List<Representative>? representative;

  Data(
      {this.candidateFName,
        this.candidateSName,
        this.candidateTName,
        this.candidateLName,
        this.candidateGender,
        this.candidateNumberVote,
        this.candidatePhoneNumber,
        this.candidateParty,
        this.candidateId,
        this.candidatePassword,
        this.representative});

  Data.fromJson(Map<dynamic, dynamic> json) {
    candidateFName = json['candidate_f_name'];
    candidateSName = json['candidate_s_name'];
    candidateTName = json['candidate_t_name'];
    candidateLName = json['candidate_l_name'];
    candidateGender = json['candidate_gender'];
    candidateNumberVote = json['candidate_number_vote'];
    candidatePhoneNumber = json['candidate_phone_number'];
    candidateParty = json['candidate_party'];
    candidateId = json['candidate_id'];
    candidatePassword = json['candidate_password'];
    if (json['representative'] != null) {
      representative = <Representative>[];
      json['representative'].forEach((v) {
        representative!.add(new Representative.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['candidate_f_name'] = this.candidateFName;
    data['candidate_s_name'] = this.candidateSName;
    data['candidate_t_name'] = this.candidateTName;
    data['candidate_l_name'] = this.candidateLName;
    data['candidate_gender'] = this.candidateGender;
    data['candidate_number_vote'] = this.candidateNumberVote;
    data['candidate_phone_number'] = this.candidatePhoneNumber;
    data['candidate_party'] = this.candidateParty;
    data['candidate_id'] = this.candidateId;
    data['candidate_password'] = this.candidatePassword;
    if (this.representative != null) {
      data['representative'] =
          this.representative!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Representative {
  int? representativeId;
  String? representativeFName;
  String? representativeSName;
  String? representativeTName;
  int? representativeVoted;
  String? representativeBox;

  Representative(
      {this.representativeId,
        this.representativeFName,
        this.representativeSName,
        this.representativeTName,
        this.representativeVoted,
        this.representativeBox});

  Representative.fromJson(Map<dynamic, dynamic> json) {
    representativeId = json['representative_id'];
    representativeFName = json['representative_f_name'];
    representativeSName = json['representative_s_name'];
    representativeTName = json['representative_t_name'];
    representativeVoted = json['representative_voted'];
    representativeBox = json['representative_box'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['representative_id'] = this.representativeId;
    data['representative_f_name'] = this.representativeFName;
    data['representative_s_name'] = this.representativeSName;
    data['representative_t_name'] = this.representativeTName;
    data['representative_voted'] = this.representativeVoted;
    data['representative_box'] = this.representativeBox;
    return data;
  }
}
