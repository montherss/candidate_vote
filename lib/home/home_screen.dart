import 'package:candidate_vote/bloc/home_bloc/home_cubit.dart';
import 'package:candidate_vote/models/homeData.dart';
import 'package:candidate_vote/models/userHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../local/cache_helper.dart';
import '../login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeData userHome ;
  const HomeScreen({super.key , required this.userHome});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit  ,HomeState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(onPressed: (){
                          CacheHepler.removeData(key: "id");
                          NavegatAndFinish(context, Directionality(textDirection: TextDirection.rtl, child: LoginScreen()));
                        }, icon: Icon(Icons.logout , color: Colors.cyan,)) ,
                      ],
                    ),
                    Container(
                      height: 190,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Container(
                              height: 140,
                              alignment: AlignmentDirectional.topCenter,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://www.universityofcalifornia.edu/sites/default/files/styles/feature_banner_image/public/2022-09/gotv-vote-2022-banner.png?h=a35cede2&itok=HXkg3srD'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          CircleAvatar(
                            radius: 64,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1675239832~exp=1675240432~hmac=003a3e6ace65a5ea1c9fc68664def6697f3bbcbb4a0d2e5b44ed1e32ac6f80c0'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${cubit.homeDatas!.data![0].candidateFName} ${cubit.homeDatas!.data![0].candidateSName} ${cubit.homeDatas!.data![0].candidateLName}" , style: TextStyle(color: Colors.cyan , fontWeight: FontWeight.bold , fontSize: 28),),
                    SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.cyan,
                      radius: 75,
                      child: Text("${cubit.homeDatas!.data![0].candidateNumberVote}" , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        'معلومات مندوب الصندوق' ,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.cyan,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.person , color: Colors.cyan,),
                            SizedBox(width: 5,),
                            Text("الأسم :-" , style: TextStyle(color: Colors.cyan , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.homeDatas!.data![0].candidateFName} ${cubit.homeDatas!.data![0].candidateSName} ${cubit.homeDatas!.data![0].candidateTName} ${cubit.homeDatas!.data![0].candidateLName}" , style: TextStyle(color: Colors.cyan), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
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
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(Icons.phone , color: Colors.cyan,),
                            SizedBox(width: 5,),
                            Text("رقم الهاتف : -" , style: TextStyle(color: Colors.cyan , fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Expanded(child: Text("${cubit.homeDatas!.data![0].candidatePhoneNumber}" , style: TextStyle(color: Colors.cyan), maxLines: 1 , overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
