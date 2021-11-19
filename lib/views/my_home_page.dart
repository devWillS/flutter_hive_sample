import 'package:flutter/material.dart';
import 'package:flutter_hive_sample/view_models/my_home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  late MyHomeViewModel viewModel;

  @override
  void initState() {
    viewModel = MyHomeViewModel(ref);
    viewModel.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recordList = ref.watch(recordListProvider.state).state;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(recordList.length, (index) {
            final record = recordList[index];
            return ListTile(
              title: Text(record.number.toString()),
              subtitle: Text(record.addDate.toString()),
              onTap: () {
                viewModel.delete(record);
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
