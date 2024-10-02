import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/constants/assets.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/home/views/details_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 237, 238),
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 237, 238),
        title: Row(
          children: [
            Image.asset(Assets.images8,scale: 14,),
           const SizedBox(width: 8,),
          const  Text('PIZZA',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),)
          ],
        ),
        actions: [
         
           IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.cart,)),
            IconButton(onPressed: (){
            context.read<SignInBloc>().add(SignOutRequired());
          }, icon:const Icon(CupertinoIcons.arrow_right_to_line,)),
          
        ],
      ) ,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2 ,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 9/16
            ),
            itemCount: 8,
             
          itemBuilder:(context, index) {
            return Material(
              elevation: 3,
              color: Colors.white,
              shape: RoundedRectangleBorder (
                borderRadius: BorderRadius. circular (20),
              ),
              child: InkWell(
                borderRadius: BorderRadius. circular (20),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) =>const DetailsScreen(),));
                    },
                child: Container(
               
                 child: Column(
                  children: [
                    Image.asset(Assets.images2),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                              child: Text('Non_veg ',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                            ),
                          ),
                   const SizedBox(width: 8,),
                           Container(
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(.2),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                              child: Text('🌶️ BALANCE ',style: TextStyle(color: Colors.green,fontSize: 10,fontWeight: FontWeight.w900),),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                 const   Padding(padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Cheesy marvel',
                   // textAlign: TextAlign.start,
                    style: TextStyle(
                      
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),),
                     ),
                       const SizedBox(height: 3,),
                    Padding(padding:const EdgeInsets.symmetric(horizontal: 12),
                    child:
                     Text('Crafting joy: your pizza, your rules, best taste!',
                 
                    style: TextStyle(
                      
                      color: Colors.grey.shade700,
                      fontSize: 10
                    ),),
                     ),
                     Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                      const   Row(
                         
                          children: [
                                        Text('10.00\$',
                                     
                                         style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color:  Color.fromARGB(255, 8, 126, 210),
                          fontSize: 16
                                         ),),
                                         SizedBox(width: 5,),
                                         Text('15.00\$',
                                     
                                         style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w700,
                          color:  Colors.grey,
                          fontSize: 12
                                         ),),
                          ],
                         ),
                                                              IconButton(onPressed: (){}, icon:const Icon(CupertinoIcons.add_circled_solid,color: Colors.black,))
                
                       ],
                     ),)
                  ],
                 ),
                ),
              ),
            );
          },),
      ),
    );
  }
}