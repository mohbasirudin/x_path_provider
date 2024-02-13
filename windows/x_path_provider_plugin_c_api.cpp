#include "include/x_path_provider/x_path_provider_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "x_path_provider_plugin.h"

void XPathProviderPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  x_path_provider::XPathProviderPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
