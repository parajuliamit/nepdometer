import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:nepdometer/classes/data_response.dart';
import 'package:nepdometer/presentation/widgets/body_data.dart';
import 'package:nepdometer/presentation/widgets/button_select.dart';
import '../data/network_call.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isTotalSelected = false;
  DataResponse? data;

  Future<DataResponse?> getData() async {
    data = await NetworkCall.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Nepdometer',
          style: TextStyle(fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {
                getData();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Image.asset('assets/mohp.png'),
            Text(
              data == null
                  ? ''
                  : 'Updated At: ${DateFormat('yyyy/MM/dd, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(data!.updateTime))}',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelect(
                  isSelected: !_isTotalSelected,
                  text: 'Last 24 Hour',
                  onPress: () {
                    setState(() {
                      _isTotalSelected = false;
                    });
                  },
                ),
                ButtonSelect(
                  isSelected: _isTotalSelected,
                  text: 'Overall Data',
                  onPress: () {
                    setState(() {
                      _isTotalSelected = true;
                    });
                  },
                ),
              ],
            ),
            data != null
                ? BodyData(
                    data: data,
                    isTotalSelected: _isTotalSelected,
                  )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
