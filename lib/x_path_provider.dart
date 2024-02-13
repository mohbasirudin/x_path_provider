
import 'x_path_provider_platform_interface.dart';

class XPathProvider {

  Future<String?> getAppDirectory(){
    return XPathProviderPlatform.instance.getAppDirectory();
  }
}
