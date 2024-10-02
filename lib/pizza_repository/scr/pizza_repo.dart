import 'models/pizza_model.dart';

abstract class PizzaRepo{
  Future<List<Pizza>> getPizzas();
}