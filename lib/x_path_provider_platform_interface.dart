import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'x_path_provider_method_channel.dart';

abstract class XPathProviderPlatform extends PlatformInterface {
  /// Constructs a XPathProviderPlatform.
  XPathProviderPlatform() : super(token: _token);

  static final Object _token = Object();

  static XPathProviderPlatform _instance = MethodChannelXPathProvider();

  /// The default instance of [XPathProviderPlatform] to use.
  ///
  /// Defaults to [MethodChannelXPathProvider].
  static XPathProviderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [XPathProviderPlatform] when
  /// they register themselves.
  static set instance(XPathProviderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getAppDirectory(){
    throw UnimplementedError("ERROR");
  }
}
