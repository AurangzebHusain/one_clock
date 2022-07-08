import 'dart:async';

import 'package:flutter/material.dart';
import './ClockPainter.dart';

class DigitalClock extends StatefulWidget {
  final DateTime? datetime;

  final bool showNumbers;
  final bool showAllNumbers;
  final bool showSeconds;
  final bool useMilitaryTime;

  final Color digitalClockColor;
  final Color numberColor;
  final bool isLive;
  final double textScaleFactor;

  const DigitalClock({this.datetime, this.showNumbers = true, this.showSeconds = true, this.showAllNumbers = false, this.useMilitaryTime = true, this.digitalClockColor = Colors.black, this.numberColor = Colors.black, this.textScaleFactor = 1.0, isLive, Key? key})
      : this.isLive = isLive ?? (datetime == null),
        super(key: key);

  @override
  _DigitalClockState createState() => _DigitalClockState(datetime);
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime initialDatetime; // to keep track of time changes
  DateTime datetime;

  Duration updateDuration = const Duration(seconds: 1); // repaint frequency
  _DigitalClockState(datetime)
      : this.datetime = datetime ?? DateTime.now(),
        initialDatetime = datetime ?? DateTime.now();

  initState() {
    super.initState();
    // don't repaint the clock every second if second hand is not shown
    updateDuration = widget.showSeconds ? Duration(seconds: 1) : Duration(minutes: 1);

    if (widget.isLive) {
      // update clock every second or minute based on second hand's visibility.
      Timer.periodic(updateDuration, update);
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
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(minWidth: 50.0, minHeight: 20.0),
        // width: double.infinity,
        child: CustomPaint(
          painter: DigitalClockPainter(showSeconds: widget.showSeconds, datetime: datetime, useMilitaryTime: widget.useMilitaryTime, digitalClockColor: widget.digitalClockColor, textScaleFactor: widget.textScaleFactor, numberColor: widget.numberColor),
        ));
  }

  @override
  void didUpdateWidget(DigitalClock oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.isLive && widget.datetime != oldWidget.datetime) {
      datetime = widget.datetime ?? DateTime.now();
      datetime = DateTime.now();
    }
  }
}
