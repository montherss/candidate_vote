import 'dart:async';

import 'package:candidate_vote/bloc/home_bloc/home_cubit.dart';

import 'package:candidate_vote/models/homeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Main_Screen extends StatelessWidget {
  final HomeData userHome ;
  const Main_Screen({super.key , required this.userHome});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    cubit.homeDatas = userHome ;
    Timer.periodic(Duration(minutes: 1), (timer){

      cubit.getUserById(userHome.data![0].candidateId!);
    });
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {
        if(state is HomeGetDataSuss){
          cubit.homeDatas = state.homeData;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home) , label: "الرئيسية"),
              BottomNavigationBarItem(icon: Icon(Icons.data_thresholding_sharp) , label: "معلومات التصويت"),
            ],
            currentIndex:cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
          ),
        );
      },
    );
  }
}
