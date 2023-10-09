class HomeData {
  String? status;
  String? message;
  List<Data>? data;

  HomeData({this.status, this.message, this.data});

  HomeData.fromJson(Map<dynamic, dynamic> json) {
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
  String? candidateNumberVote;
  String? candidatePhoneNumber;
  String? candidateParty;
  String? candidateId;
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
  String? representativeId;
  String? representativeFName;
  String? representativeSName;
  String? representativeTName;
  String? representativeGender;
  String? representativePhoneNumber;
  String? representativePassword;
  String? representativeBox;
  String? representativeCandidate;
  String? representativeVoted;
  String? representativeLocation;
  String? representativeGovernorate;
  List<People>? people;

  Representative(
      {this.representativeId,
        this.representativeFName,
        this.representativeSName,
        this.representativeTName,
        this.representativeGender,
        this.representativePhoneNumber,
        this.representativePassword,
        this.representativeBox,
        this.representativeCandidate,
        this.representativeVoted,
        this.representativeLocation,
        this.representativeGovernorate,
        this.people});

  Representative.fromJson(Map<dynamic, dynamic> json) {
    representativeId = json['representative_id'];
    representativeFName = json['representative_f_name'];
    representativeSName = json['representative_s_name'];
    representativeTName = json['representative_t_name'];
    representativeGender = json['representative_gender'];
    representativePhoneNumber = json['representative_phone_number'];
    representativePassword = json['representative_password'];
    representativeBox = json['representative_box'];
    representativeCandidate = json['representative_candidate'];
    representativeVoted = json['representative_voted'];
    representativeLocation = json['representative_location'];
    representativeGovernorate = json['representative_governorate'];
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(new People.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['representative_id'] = this.representativeId;
    data['representative_f_name'] = this.representativeFName;
    data['representative_s_name'] = this.representativeSName;
    data['representative_t_name'] = this.representativeTName;
    data['representative_gender'] = this.representativeGender;
    data['representative_phone_number'] = this.representativePhoneNumber;
    data['representative_password'] = this.representativePassword;
    data['representative_box'] = this.representativeBox;
    data['representative_candidate'] = this.representativeCandidate;
    data['representative_voted'] = this.representativeVoted;
    data['representative_location'] = this.representativeLocation;
    data['representative_governorate'] = this.representativeGovernorate;
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class People {
  String? id;
  String? fName;
  String? sName;
  String? tName;
  String? lName;
  String? state;

  People({this.id, this.fName, this.sName, this.tName, this.lName, this.state});

  People.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    sName = json['s_name'];
    tName = json['t_name'];
    lName = json['l_name'];
    state = json['state'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['s_name'] = this.sName;
    data['t_name'] = this.tName;
    data['l_name'] = this.lName;
    data['state'] = this.state;
    return data;
  }
}
