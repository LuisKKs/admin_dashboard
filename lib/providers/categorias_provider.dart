import 'package:admin_dashboard/models/categorias.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/eventos_api.dart';
import '../models/http/categoria_response.dart';

class CategoriasProvider extends ChangeNotifier {
  List<Categorias> categorias = [];

  getCategorias() async {
    final resp = await EventosApi.httpGet('/categorias');
    final cats = Categoria.fromMap(resp);
    categorias = [...cats.categorias];
    notifyListeners();
  }

  Future updateCategoria(
    String id,
    String raceType,
    String categoryName,
    String branch,
    String description,
  ) async {
    final data = {
      'id':id,
      'raceType':raceType,
      'categoryName':categoryName,
      'branch':branch,
      'description':description,
    };

    try {
      await EventosApi.put('/categorias/$id', data);
      categorias = categorias.map((categorias) {
        if (categorias.id != id) return categorias;
        categorias.categoryName = categoryName;
        return categorias;
      }).toList();
      notifyListeners();
    } catch (e) {
      throw 'Error al actualizar la categoria de la carrera';
    }
  }

  Future newCategoria(
   //String id,
    String raceType,
    String categoryName,
    String branch,
    String description,
  ) async {
    final data = {
      //'id':id,
      'raceType':raceType,
      'categoryName':categoryName,
      'branch':branch,
      'description':description,
    };

    try {
      final json = await EventosApi.post('/categorias', data);
      final newCategoria = Categorias.fromMap(json);
      categorias.add(newCategoria);
      notifyListeners();
    } catch (e) {
      print('Error al crear la categoria para la carrera');
    }
  }

  Future deleteCategoria(
    String id,
  ) async {
    try {
      await EventosApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      print('Error al actualizar la categoria de la carrera');
      throw (e);
    }
  }
}
