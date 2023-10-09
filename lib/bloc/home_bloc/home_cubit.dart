import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:candidate_vote/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Crud/crud.dart';
import '../../component/component.dart';
import '../../constant/constant.dart';
import '../../home/data_screen.dart';
import '../../models/homeData.dart';
import '../../models/stateVoite.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0 ;
  HomeData? homeDatas;
  List<Widget> screen = [
    HomeScreen(userHome: homeData!),
    Data_Screen(),
  ];
  void changeIndex (int index){
    currentIndex = index ;
    emit(HomeChangeIndex());
  }
  void getUserById(String id)async{
    await Crud.postData(linkUrl: LOGINBYID_CANDID, data: {
      "candidate_id" : id ,
    }).then((value){
      homeData = HomeData.fromJson(value);
      emit((HomeGetDataSuss(homeData!)));
    }).catchError((onError){
      showTost(onError.toString(),Colors.red);
    });
  }
  List<People>? peopleWhoVote =[];
  List<People>? peopleWhonotVote=[] ;
  VoteState? whoVote ;
  VoteState? whoNOTVote ;
  List<VoteState>? lastList =[];
  void filterVoteState (Representative representative){
    peopleWhoVote = [] ;
    peopleWhonotVote = [] ;
    lastList = [] ;
    for (int i = 0 ; i<=representative.people!.length-1 ; i ++ ){
      if(representative.people![i].state == "0"){
        peopleWhonotVote!.add(representative.people![i]);
      }else{
        peopleWhoVote!.add(representative.people![i]);
      }
    }
    lastList = [
      VoteState("تم التصويت",peopleWhoVote!.length),
      VoteState("لم يتم التصويت", peopleWhonotVote!.length)
    ];
  }
}
