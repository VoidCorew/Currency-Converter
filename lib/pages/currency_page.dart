import 'package:currency_converter/models/currency_data.dart';
import 'package:currency_converter/repository/currency_repository.dart';
import 'package:flutter/material.dart';

class CurrencyPage extends StatelessWidget {
  CurrencyPage({super.key});

  final repository = CurrencyRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(title: Text('Currency', style: style)),
      body: FutureBuilder<CurrencyData>(
        future: repository.fetchRates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.rates.isEmpty) {
            return const Center(child: Text('No currency data found!!'));
          }

          final data = snapshot.data!;
          final rates = data.rates;
          final date = data.date;

          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text('Date: $date', style: style),
              const Divider(thickness: 3),
              ...rates.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  trailing: Text(entry.value.toStringAsFixed(4)),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
