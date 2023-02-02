import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'One Clock Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime dateTime = DateTime.now();

  void _setNewDateTime(DateTime dateTiime) {
    setState(() {
      dateTime = dateTiime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Analog Clock Example",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              AnalogClockExample(dateTime),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Digital Clock Example",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 30,
              ),
              ...DigitalClockExample(dateTime)
            ],
          ),
        ),
      ),
    );
  }
}

Widget AnalogClockExample(DateTime dateTimee) {
  return SingleChildScrollView(
    // padding: EdgeInsets.all(7),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        AnalogClock(
          isLive: false,
          width: 120,
          height: 120,
          datetime: dateTimee,
        ),
        const SizedBox(
          width: 10,
        ),
        AnalogClock.dark(
          width: 120,
          height: 120,
          isLive: true,
          datetime: dateTimee,
        ),
        const SizedBox(
          width: 10,
        ),
        AnalogClock(
          width: 120,
          height: 120,
          isLive: true,
          decoration: BoxDecoration(color: Colors.green[100], shape: BoxShape.circle),
          datetime: dateTimee,
        ),
        const SizedBox(
          width: 10,
        ),
        AnalogClock(
          width: 120,
          height: 120,
          isLive: true,
          decoration: BoxDecoration(color: Colors.yellow[100], shape: BoxShape.circle),
          datetime: dateTimee,
        ),
        const SizedBox(
          width: 10,
        ),
        AnalogClock(
          width: 120,
          height: 120,
          isLive: true,
          showDigitalClock: false,
          decoration: BoxDecoration(color: Colors.cyan[100], shape: BoxShape.circle),
          datetime: dateTimee,
        ),
        const SizedBox(
          width: 10,
        ),
        AnalogClock(
          width: 120,
          height: 120,
          isLive: true,
          showDigitalClock: false,
          decoration: BoxDecoration(color: Colors.red[100], shape: BoxShape.circle),
          datetime: dateTimee,
        ),
      ],
    ),
  );
}

List<Widget> DigitalClockExample(DateTime dateTimee) {
  return [
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            showSeconds: true,
            datetime: dateTimee,
            textScaleFactor: 1.3,
            isLive: true,
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.dark(
            datetime: dateTimee,
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.light(
            isLive: true,
            datetime: dateTimee,
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            textScaleFactor: 2,
            showSeconds: false,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            isLive: true,
          ),
          DigitalClock.dark(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
          ),
          DigitalClock.light(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            isLive: true,
            datetime: dateTimee,
          )
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.dark(
            datetime: dateTimee,
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock.light(
            isLive: true,
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          const SizedBox(
            width: 10,
          ),
          DigitalClock(
            datetime: dateTimee,
            isLive: true,
            decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.circular(15))),
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 20,
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DigitalClock(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
            isLive: true,
          ),
          DigitalClock.dark(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            datetime: dateTimee,
            decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          ),
          DigitalClock.light(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            isLive: true,
            datetime: dateTimee,
            decoration: const BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.all(Radius.zero)),
          )
        ],
      ),
    ),
  ];
}
