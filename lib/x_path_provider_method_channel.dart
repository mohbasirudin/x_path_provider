import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:x_path_provider/utils.dart';

import 'x_path_provider_platform_interface.dart';

/// An implementation of [XPathProviderPlatform] that uses method channels.
class MethodChannelXPathProvider extends XPathProviderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('x_path_provider');


  @override
  Future<String?> getAppDirectory() async {
    return await methodChannel.invokeMethod<String>(Method.getAppDirectory);
  }
}
