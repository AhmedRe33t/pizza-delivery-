import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/constants/assets.dart';
import 'package:pizza/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:pizza/screens/home/views/details_view.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 237, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 237, 238),
        title: Row(
          children: [
            Image.asset(
              Assets.images8,
              scale: 14,
            ),
            const SizedBox(
              width: 8,
            ),
            const Text(
              'PIZZA',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.cart,
              )),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(
                CupertinoIcons.arrow_right_to_line,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if(state is GetPizzaSuccess){
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 9 / 16),
              itemCount: state.pizzas.length,
              itemBuilder: (context, int i) {
                return
                 Material(
                  elevation: 3,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  DetailsScreen(pizza:state.pizzas[i] ,),
                          ));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Image.network(state.pizzas[i].picture),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color:
                                      state.pizzas[i].isVeg?Colors.green:
                                       Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      state.pizzas[i].isVeg?'VEG':
                                      'Non_veg ',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(30)),
                                  child:  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4),
                                    child: Text(
                                      state.pizzas[i].spicy==1?
                                      '🌶️ BLAND':
                                      state.pizzas[i].spicy==2?
                                      '🌶️ BALANCE':
                                      '🌶️ SPICY'
                                      ,
                                      style:  TextStyle(
                                          color:  state.pizzas[i].spicy==1?
                                      Colors.green:
                                      state.pizzas[i].spicy==2?
                                       Colors.orange:
                                      Colors.redAccent
                                      ,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                           Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.pizzas[i].name,
                                // textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Padding(
                            padding:  const EdgeInsets.symmetric(horizontal: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                state.pizzas[i].description,
                                style: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 10),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Row(
                                  
                                  children: [
                                    Text(
                                      "\$${state.pizzas[i].price - (state.pizzas[i].price * (state.pizzas[i].discount) / 100)}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Color.fromARGB(255, 8, 126, 210),
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${state.pizzas[i].price}.00\$',
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      CupertinoIcons.add_circled_solid,
                                      color: Colors.black,
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );}else if(state is GetPizzaLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return const Center(
                child: Text('There was an error'),
              );
            }
          },
        ),
      ),
    );
  }
}
