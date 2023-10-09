import 'package:candidate_vote/bloc/login_bloc/login_cubit.dart';
import 'package:candidate_vote/constant/constant.dart';
import 'package:candidate_vote/home/main_screen.dart';
import 'package:candidate_vote/local/cache_helper.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = LoginCubit.get(context);
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    var FormKey = GlobalKey<FormState>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is LoginUserSucc){
          if(state.userHome.status=="success"){
            showTost(state.userHome.message!, Colors.green);
            CacheHepler.setData("id", state.userHome.data![0].candidateId);
            cubit.loginByID(state.userHome.data![0].candidateId.toString());
            NavegatAndFinish(context ,Directionality(textDirection: TextDirection.rtl, child:  Main_Screen(userHome: homeData!,)));
          }else {
            showTost(state.userHome.message!, Colors.red);
          }
        }
        else if (state is LoginUserError){
          showTost(state.Error, Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Form(
                key: FormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('تسجيل دخول', style: TextStyle(
                        fontSize: 35,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 20,),
                    Text('سجل الأن للتصويت !!', style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                    ),),
                    SizedBox(
                      height: 40,
                    ),
                    TextFeild(labelText: 'رقم الهاتف',
                        prefixIcon: Icon(Icons.phone),
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء ادخال رقم الهاتف';
                          } else if (value.length != 10) {
                            return 'الرجاء ادخال رقم صحيح';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFeild(labelText: 'كلمة السر',
                        prefixIcon: Icon(Icons.lock),
                        keyboardType: TextInputType.name,
                        obscureText: cubit.obs,
                        suffixIcon: IconButton(onPressed: () {
                          cubit.obsChange(cubit.obs);
                        }, icon: cubit.obs == true ? Icon(Icons.visibility,
                          color: Colors.cyan,) : Icon(Icons
                            .visibility_off,)),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'الرجاء ادخال الرقم الوطني';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginUserLoading,
                      builder: (context) =>
                          defBotton(text: 'تسجيل دخول', onPressed: () {
                            if (FormKey.currentState!.validate()) {
                              cubit.loginUser(phoneController.text,
                                  passwordController.text);
                            }
                          }),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator(),),
                    )
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