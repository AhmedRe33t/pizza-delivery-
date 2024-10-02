import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pizza/componant/macro.dart';
import 'package:pizza/constants/assets.dart';
import 'package:pizza/pizza_repository/scr/models/pizza_model.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.pizza});
  final Pizza pizza;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 237, 238),
      appBar:AppBar(
        backgroundColor:  const Color.fromARGB(255, 232, 237, 238), 
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of (context). size.width,
              height: MediaQuery.of (context). size.width-(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(3, 3),
                    blurRadius: 10
                  )
                ],
                image: DecorationImage(image: NetworkImage(pizza.picture))

              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 10
                    )
                  ],),
                  child:  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:   Column(
                      children: [
                       Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(pizza.name,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                              Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    Text("\$${pizza.price - (pizza.price * (pizza.discount) / 100)}",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                       color:  Color.fromARGB(255, 8, 126, 210),
                                    ),),
                                      Text('${pizza.price}.00\$',
                                     
                                         style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.w700,
                          color:  Colors.grey,
                          fontSize: 15
                                         ),),
                                  ],
                                ),
                                

                              ),
                            ),
                                
                          ],
                        ),
                       const SizedBox(height: 12,),
                         Row(
                          children: [
                             MyMacroWidget(title: 'Calories', value: pizza.macros.calories, icon: FontAwesomeIcons.fire,),
                              SizedBox(width: 10,),
                           MyMacroWidget(title:'Protein', value: pizza.macros.proteins, icon: FontAwesomeIcons.dumbbell),
                              SizedBox(width: 10,),
                              MyMacroWidget(title: 'Fat', value: pizza.macros.fat, icon: FontAwesomeIcons.bowlFood,),
                           SizedBox(width: 10,),
                               MyMacroWidget(title: 'Carbs', value: pizza.macros.carbs, icon: CupertinoIcons.chart_bar_fill,),
                          ],
                        ),

                         const SizedBox(height: 40,),
                         SizedBox(
                          
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: TextButton(onPressed: (){}, 
                           style: TextButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.black, 
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                          child:const Text('By now',
                           style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                        ),)),
                         )
                      ],
                    ),
                  ),
                  
                  ),
          )
        ],
      ),
    );
  }
}