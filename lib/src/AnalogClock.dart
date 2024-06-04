import 'dart:async';
import 'package:flutter/material.dart';
import './ClockPainter.dart';

class AnalogClock extends StatefulWidget {
  final DateTime? datetime;

  ///clockType :
  ///analog--> For analog
  ///digital-->For digital

  final bool showDigitalClock;
  final bool showTicks;
  final bool showNumbers;
  final bool showAllNumbers;
  final bool showSecondHand;
  final bool useMilitaryTime;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color tickColor;
  final Color digitalClockColor;
  final Color numberColor;
  final bool isLive;
  final double textScaleFactor;
  final double width;
  final double height;
  final BoxDecoration decoration;

  const AnalogClock(
      {this.datetime,
      this.showDigitalClock = true,
      this.showTicks = true,
      this.showNumbers = true,
      this.showSecondHand = true,
      this.showAllNumbers = false,
      this.useMilitaryTime = true,
      this.hourHandColor = Colors.black,
      this.minuteHandColor = Colors.black,
      this.secondHandColor = Colors.redAccent,
      this.tickColor = Colors.grey,
      this.digitalClockColor = Colors.black,
      this.numberColor = Colors.black,
      this.textScaleFactor = 1.0,
      this.width = double.infinity,
      this.height = double.infinity,
      this.decoration = const BoxDecoration(),
      this.isLive = true,
      Key? key})
      : super(key: key);

  const AnalogClock.dark(
      {this.datetime,
      this.showDigitalClock = true,
      this.showTicks = true,
      this.showNumbers = true,
      this.showAllNumbers = false,
      this.showSecondHand = true,
      this.useMilitaryTime = true,
      this.isLive = true,
      this.textScaleFactor = 1.0,
      this.width = double.infinity,
      this.height = double.infinity,
      this.hourHandColor = Colors.white,
      this.minuteHandColor = Colors.white,
      this.secondHandColor = Colors.orange,
      this.tickColor = Colors.grey,
      this.digitalClockColor = Colors.white,
      this.numberColor = Colors.white,
      this.decoration = const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      Key? key})
      : super(key: key);

  @override
  _AnalogClockState createState() => _AnalogClockState(datetime);
}

class _AnalogClockState extends State<AnalogClock> {
  late final Timer? _timer;

  DateTime initialDatetime; // to keep track of time changes
  DateTime datetime;
  Duration updateDuration = const Duration(seconds: 1); // repaint frequency

  _AnalogClockState(datetime)
      : this.datetime = datetime ?? DateTime.now(),
        initialDatetime = datetime ?? DateTime.now();

  initState() {
    super.initState();

    if (widget.isLive) {
      // update clock every second or minute based on second hand's visibility.
      _timer = Timer.periodic(updateDuration, update);
    } else {
      _timer = null;
    }
  }

  update(Timer timer) {
    if (mounted) {
      // update is only called on live clocks. So, it's safe to update datetime.
      this.datetime = this.initialDatetime.add(updateDuration * timer.tick);
      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: widget.decoration,
      child: Center(
          child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                  constraints: BoxConstraints(minWidth: 48.0, minHeight: 48.0),
                  width: double.infinity,
                  child: CustomPaint(
                    painter: AnalogClockPainter(
                        datetime: datetime,
                        showDigitalClock: widget.showDigitalClock,
                        showTicks: widget.showTicks,
                        showNumbers: widget.showNumbers,
                        showAllNumbers: widget.showAllNumbers,
                        showSecondHand: widget.showSecondHand,
                        useMilitaryTime: widget.useMilitaryTime,
                        hourHandColor: widget.hourHandColor,
                        minuteHandColor: widget.minuteHandColor,
                        secondHandColor: widget.secondHandColor,
                        tickColor: widget.tickColor,
                        digitalClockColor: widget.digitalClockColor,
                        textScaleFactor: widget.textScaleFactor,
                        numberColor: widget.numberColor),
                  )))),
    );
  }

  @override
  void didUpdateWidget(AnalogClock oldWidget) {
    super.didUpdateWidget(oldWidget);

    // if (!widget.isLive && widget.datetime != oldWidget.datetime) {
    //   datetime = widget.datetime ?? DateTime.now();
    //   datetime = DateTime.now();
    // }

    if (!widget.isLive && widget.datetime != oldWidget.datetime) {
      datetime = widget.datetime ?? DateTime.now();
    } else if (widget.isLive && widget.datetime != oldWidget.datetime) {
      initialDatetime = widget.datetime ?? DateTime.now();
    }
  }
}
