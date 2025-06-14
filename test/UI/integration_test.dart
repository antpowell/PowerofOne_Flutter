import 'package:power_of_one_basketball/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest('counter state is the same after going to home and going back', (
    $,
  ) async {
    await $.pumpWidgetAndSettle(Power1());

    await $(FloatingActionButton).tap();
    expect($(#counterText).text, '1');

    await $.native.pressHome();
    await $.native.pressDoubleRecentApps();

    expect($(#counterText).text, '1');
    await $(FloatingActionButton).tap();
    expect($(#counterText).text, '2');

    await $.native.openNotifications();
    await $.native.pressBack();
  });
  patrolTest('log user in', ($) async {
    await $.pumpWidgetAndSettle(Power1());

    await $(FloatingActionButton).tap();
    expect($(#counterText).text, '1');

    await $.native.pressHome();
    await $.native.pressDoubleRecentApps();

    expect($(#counterText).text, '1');
    await $(FloatingActionButton).tap();
    expect($(#counterText).text, '2');

    await $.native.openNotifications();
    await $.native.pressBack();
  });
}
