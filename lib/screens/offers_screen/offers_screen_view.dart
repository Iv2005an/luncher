import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:luncher/generated/l10n.dart';
import 'package:luncher/screens/offers_screen/widgets/category_page.dart';
import 'package:luncher/screens/widgets/loading_screen.dart';

import 'package:luncher/screens/widgets/something_wrong_screen.dart';
import 'bloc/offers_screen_bloc.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final _bloc = OffersScreenBloc();

  @override
  void initState() {
    _bloc.add(const LoadCatalogEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersScreenBloc, OffersScreenState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is OffersScreenLoaded) {
          return PageView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) => CategoryPage(
                _bloc,
                state.products.keys.elementAt(index),
                state.products.values.elementAt(index)),
          );
        }
        if (state is OffersScreenEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(S.of(context).emptyOffers),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => _bloc.add(const LoadCatalogEvent()),
                  child: Text(S.of(context).tryAgain),
                )
              ],
            ),
          );
        }
        if (state is OffersScreenFailed) {
          return SomethingWrongScreen(
              () => _bloc.add(const LoadCatalogEvent()));
        }
        return const LoadingScreen();
      },
    );
  }
}
