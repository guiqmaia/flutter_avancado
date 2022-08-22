
import 'package:flutter/material.dart';

import '../../../../domain/entities/stock_entity.dart';

class ListViewStocksHome extends StatelessWidget {
  const ListViewStocksHome({
    Key? key,
    required this.stocks,
  }) : super(key: key);

  final List<StockEntity> stocks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        Text definirCor(double abertura, double fechamento) {
          double variacao = fechamento / abertura;
          double diferenca = fechamento - abertura;
          if (variacao > 1) {
            return Text(
              'R\$ ${diferenca.toStringAsFixed(2)} (${variacao.toStringAsFixed(2)}%)',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            );
          } else {
            diferenca = diferenca * (-1);
            return Text(
              '- R\$ ${diferenca.toStringAsFixed(2)} (${variacao.toStringAsFixed(2)}%)',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            );
          }
        }

        return Column(
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stocks[index].ticker,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          stocks[index].nomeEmpresa,
                          style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'R\$ ${stocks[index].fechamento.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        definirCor(stocks[index].abertura, stocks[index].fechamento),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        );
      },
    );
  }
}
