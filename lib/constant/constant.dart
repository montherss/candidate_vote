import 'dart:convert';

import 'package:candidate_vote/models/homeData.dart';

import '../models/userHome.dart';

String SERVER = "https://myclinicjo.net/vote_backend";
String AUTH = "$SERVER/auth";
String VOTE = "$SERVER/vote";
String CANDID = "$SERVER/candidate" ;
UserHome? userHome ;
HomeData? homeData ;
//=========================================Login========================================//
String LOGIN = "$AUTH/loginCandidate.php";
String LOGINBYID = "$AUTH/getUserByID.php";
String LOGINBYID_CANDID = "$CANDID/index.php";
String _basicAuth = 'Basic ' +
    base64Encode(utf8.encode("Almontherss41@:Almontherss41@!"));
Map<String,String>myheaders = {
  'authorization':_basicAuth
};
//=========================================Vote========================================//
String GET_ALLVOTER = "$VOTE/getAllVoter.php";
String GET_VOTER = "$VOTE/getVoter.php";
String VOTE_NOW = "$VOTE/voteNow.php";
//=========================================Candid=====================================//