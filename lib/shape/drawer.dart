// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_screen/CategoryCubit.dart';
import '../bloc_states/CategoryState.dart';
import '../screens/categories_screen.dart';
class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<CategoryCubit>();

    return BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context,state) {
          return Drawer(
            elevation: 17,
            backgroundColor:Colors.white,
            child: Column(children: [
              Container(height: MediaQuery.of(context).size.height/7,
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xff5C3C96) ,
                child:  const Text("News App!",
                  style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.list,size: 40,color:Color(0xff5C3C96),),
                        SizedBox(width:MediaQuery.of(context).size.width/40 ,),
                        Text("Categories",
                          style: TextStyle(color:Color(0xff5C3C96),fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> categoriesScreen()));
                },
              ),
              Divider(color:Color(0xff5C3C96),),
              InkWell(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.settings,size: 30,color:Color(0xff5C3C96) ,),
                        SizedBox(width:MediaQuery.of(context).size.width/40 ,),
                        Text("Settings",
                          style: TextStyle(color:Color(0xff5C3C96) ,fontSize: 30,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: (){},
              ),
              Divider(color: Color(0xff5C3C96) ,height: 3,),

            ],),);
        }
    );
  }
}