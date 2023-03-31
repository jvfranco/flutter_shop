import 'package:flutter/material.dart';
import 'package:shop/providers/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo Contador'),
      ),
      body: Column(
        children: [
          Text(CounterProvider
              .of(context)
              ?.counterState
              .value
              .toString() ??
              '0'),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider
                    .of(context)
                    ?.counterState
                    .inc();
              });

              print(CounterProvider
                  .of(context)
                  ?.counterState
                  .value);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                CounterProvider
                    .of(context)
                    ?.counterState
                    .dec();
              });
              print(CounterProvider
                  .of(context)
                  ?.counterState
                  .value);
            },
            icon: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
