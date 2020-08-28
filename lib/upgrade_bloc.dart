import 'dart:async';
import 'upgrade_event.dart';

class UpgradeBloc {
  final _upgradeStateController = StreamController<int>();

  StreamSink<int> get _inUpgrade => _upgradeStateController.sink;
  Stream<int> get upgrade => _upgradeStateController.stream;

  final _upgradeEventController = StreamController<UpgradeEvent>();
  Sink<UpgradeEvent> get upgradeEventSink => _upgradeEventController.sink;

  UpgradeBloc() {
    _upgradeEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(UpgradeEvent event) {
    if (event is UpgradeEvent) {
      if (_counter > _price) {
        // Purchase Upgrade
        print("purchased");
        _counter -= _price;
        //widget.purchased = true;
      } else {
        // Need more $
        print('You have ' + _counter.toString() + ' dollars');
        print('You need ' + (_price - _counter).toString() + ' more dollars!');
      }
    } else
      print("what??");

    _inUpgrade.add(_price);
  }

  void dispose() {
    _upgradeStateController.close();
    _upgradeEventController.close();
  }
}
