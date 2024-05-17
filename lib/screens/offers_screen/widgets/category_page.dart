import 'dart:async';

import 'package:flutter/material.dart';
import 'package:luncher/repositories/fastfood_repository/models/abstract_product_model.dart';
import 'package:luncher/screens/offers_screen/bloc/offers_screen_bloc.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage(this._bloc, this._categoryTitle, this._categoryProducts,
      {super.key});
  final OffersScreenBloc _bloc;
  final String _categoryTitle;
  final List<AbstractProductModel> _categoryProducts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_categoryTitle, style: theme.textTheme.headlineSmall),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  final completer = Completer();
                  _bloc.add(LoadCatalogEvent(completer: completer));
                  return completer.future;
                },
                child: ListView(
                  children: [
                    for (var categoryProduct in _categoryProducts)
                      ListTile(
                        title: Text(categoryProduct.name),
                        subtitle: Text(
                            'Цена: ${categoryProduct.price} Ккал: ${categoryProduct.caloriesCount} Руб/ккал:${(categoryProduct.price / categoryProduct.caloriesCount).isNaN ? 0 : (categoryProduct.price / categoryProduct.caloriesCount)}'),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
