import 'package:bloc/bloc.dart';
import 'package:candidate_vote/component/component.dart';
import 'package:candidate_vote/models/homeData.dart';
import 'package:candidate_vote/models/userHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Crud/crud.dart';
import '../../constant/constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool obs = true;

  void obsChange(bool change) {
    obs = !change;
    emit(LoginChangeObs());
  }

  UserHome? userHome ;
  void loginUser(String phoneNumber, String password) async {
    emit(LoginUserLoading());
    await Crud.postData(linkUrl: LOGIN, data: {
      "user_phoneNumber": phoneNumber,
      "user_password": password,
    }).then((value) {
      userHome = UserHome.fromJson(value);
      emit(LoginUserSucc(userHome!));
    }).catchError((onError) {
      emit(LoginUserError(onError.toString()));
    });
  }
  
  void loginByID(String id)async{
    await Crud.postData(linkUrl: LOGINBYID_CANDID, data: {
      "candidate_id" : id ,
    }).then((value){
      homeData = HomeData.fromJson(value);
      emit(LoginUserByIdSucc());
    }).catchError((onError){
      showTost(onError.toString(),Colors.red);
    });
  }
}