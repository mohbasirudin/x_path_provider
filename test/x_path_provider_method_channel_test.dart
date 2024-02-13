import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:x_path_provider/x_path_provider_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelXPathProvider platform = MethodChannelXPathProvider();
  const MethodChannel channel = MethodChannel('x_path_provider');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
