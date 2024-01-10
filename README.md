# Flutter One Clock Widget

[![pub package](https://img.shields.io/pub/v/analog_clock.svg)](https://pub.dartlang.org/packages/one_clock)

Clean and fully customizable clock widget.

Note: This package is inspired from the analog_clock package which is for showing analog clock only. You can check that package here [`analog_clock`](https://pub.dev/packages/analog_clock) folder.

![Analog/Digital Clock Screenshot](https://github.com/AurangzebHusain/one_clock/blob/master/Example_Image.png?raw=true)

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  one_clock: ^2.0.0
```

## Features

- Modern and clean analog as well as digital clock interface.
- Customize as per your need.
- Live clock.

## Usage

```dart
import 'package:one_clock/one_clock.dart';


 AnalogClock(
	decoration: BoxDecoration(
	    border: Border.all(width: 2.0, color: Colors.black),
	    color: Colors.transparent,
	    shape: BoxShape.circle),
	width: 150.0,
	isLive: true,
	hourHandColor: Colors.black,
	minuteHandColor: Colors.black,
	showSecondHand: false,
	numberColor: Colors.black87,
	showNumbers: true,
	showAllNumbers: false,
	textScaleFactor: 1.4,
	showTicks: false,
	showDigitalClock: false,
	datetime: DateTime(2019, 1, 1, 9, 12, 15),
	);

DigitalClock(
	showSeconds: false,
	isLive:false,
	digitalClockColor: Colors.black,
	decoration: const BoxDecoration(
		color: Colors.yellow,
		shape: BoxShape.rectangle,
		borderRadius: BorderRadius.all(Radius.circular(15))),
		datetime: DateTime.now())
```

## Parameters

![Flutter Analog Clock Parameters](https://github.com/furkantektas/analog_clock/raw/master/doc/visual_doc.png?raw=true)
