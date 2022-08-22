import 'package:b3_api/app/presenter/riverpod/stocks_provider.dart';
import 'package:b3_api/app/presenter/ui/home/widgets/list_view_stocks_home.dart';
import 'package:b3_api/app/presenter/ui/home/widgets/replacement_home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodyHome extends HookConsumerWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stocks = ref.watch(stocksNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stocks',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Visibility(
          visible: stocks.isNotEmpty,
          replacement: ReplacementHomePage(stocks: stocks),
          child: ListViewStocksHome(stocks: stocks),
        ),
      ),
    );
  }
}
