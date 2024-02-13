import 'package:flutter_test/flutter_test.dart';
import 'package:x_path_provider/utils.dart';
import 'package:x_path_provider/x_path_provider.dart';
import 'package:x_path_provider/x_path_provider_platform_interface.dart';
import 'package:x_path_provider/x_path_provider_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockXPathProviderPlatform
    with MockPlatformInterfaceMixin
    implements XPathProviderPlatform {
  @override

  @override
  Future<String?> getAppDirectory() => Future.value("");
}

void main() {
  final XPathProviderPlatform initialPlatform = XPathProviderPlatform.instance;

  test('$MethodChannelXPathProvider is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelXPathProvider>());
  });

  test(Method.getAppDirectory, () async {
    XPathProvider xPathProviderPlugin = XPathProvider();
    MockXPathProviderPlatform fakePlatform = MockXPathProviderPlatform();
    XPathProviderPlatform.instance = fakePlatform;

    expect(await xPathProviderPlugin.getAppDirectory(), 'INVALID');
  });
}
