import 'dart:async';
import 'counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink; //Input - Sink
  Stream<int> get counter => _counterStateController.stream; //Output - Stream

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }
  // TODO: Scale this function: use price variable
  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else if (event is Upgrade1Event) {
      if (_counter >= 10) {
        _counter -= 10;
      } else {
        print("You need " + (10 - _counter).toString() + " more money...");
      }
    } else if (event is Upgrade2Event) {
      if (_counter >= 20) {
        _counter -= 20;
      } else {
        print("You need " + (20 - _counter).toString() + " more money...");
      }
    } else if (event is Upgrade3Event) {
      if (_counter >= 50) {
        _counter -= 50;
      } else {
        print("You need " + (50 - _counter).toString() + " more money...");
      }
    } else if (event is Upgrade4Event) {
      if (_counter >= 30) {
        _counter -= 30;
      } else {
        print("You need " + (30 - _counter).toString() + " more money...");
      }
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
