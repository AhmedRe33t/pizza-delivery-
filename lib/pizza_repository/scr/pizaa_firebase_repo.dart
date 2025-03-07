import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pizza/pizza_repository/scr/entities/pizza_entities.dart';
import 'package:pizza/pizza_repository/scr/pizza_repo.dart';

import 'models/pizza_model.dart';

class FirebasePizzaRepo implements PizzaRepo{
 final pizzaCollection = FirebaseFirestore. instance. collection('pizzas');

  Future<List<Pizza>> getPizzas() async {
    try {
      return await pizzaCollection
        .get()
        .then((value) => value.docs.map((e) => 
          Pizza.fromEntity(PizzaEntity.fromDocument(e.data()))
        ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}

