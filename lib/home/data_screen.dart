import 'package:candidate_vote/bloc/home_bloc/home_cubit.dart';
import 'package:candidate_vote/constant/constant.dart';
import 'package:candidate_vote/models/homeData.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/stateVoite.dart';

class Data_Screen extends StatelessWidget {
  const Data_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    late TooltipBehavior tooltipBehavior=TooltipBehavior(enable: true) ;
    HomeCubit cubit = HomeCubit.get(context);

    cubit.peopleWhonotVote = [];
    cubit.peopleWhoVote = [] ;
    cubit.lastList = [] ;
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("معلومات التصويت" , style: TextStyle(fontSize: 30  , fontWeight: FontWeight.bold , color: Colors.cyan),)
                ],
              ),
              SizedBox(
                height: 75,
              ),
              ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) => itemBulder(tooltipBehavior,homeData!.data![0].representative![index], cubit),
                  separatorBuilder:(context, index) => SizedBox(height: 30,),
                  itemCount: homeData!.data![0].representative!.length
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemBulder(TooltipBehavior tooltipBehavior , Representative representative , HomeCubit cubit ,){
  cubit.filterVoteState(representative);
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 4)
      ],
    ),
    child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              Text("المندوب : -" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54),),
              Text("${representative.representativeFName} ${representative.representativeSName} ${representative.representativeFName}")
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  height: 20,
                ),
              ),
              Row(
                children: [
                  Text("رقم الهاتف : -",  style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54)),
                  Text("${representative.representativePhoneNumber}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("رقم الصندوق : -",  style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54)),
                  Text("${representative.representativeBox}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("عدد الأصوات : -",  style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black54)),
                  Text("${representative.representativeVoted}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1,
                  height: 20,
                ),
              ),
              Column(
                children: [
                  Text("حالة الصندوق"),
                  SizedBox(
                    height: 10,
                  ),
                  SfCircularChart(
                    legend: Legend(isVisible: true),
                    tooltipBehavior: tooltipBehavior,
                    series: [
                      PieSeries<VoteState , String>(
                        dataSource: cubit.lastList ,
                        xValueMapper: (VoteState data , _ )=>data.state ,
                        yValueMapper: (VoteState data , _)=>data.number,
                        dataLabelSettings: DataLabelSettings(isVisible: true , textStyle: TextStyle(fontSize: 20 , color: Colors.white , fontWeight: FontWeight.bold)) ,
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        )
    ),
  );
}
List<VoteState> test = [
  VoteState("تم التصويت", 10),
  VoteState("لم يتم التصويت", 10),
];