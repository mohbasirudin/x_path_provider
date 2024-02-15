import Flutter
import UIKit

public class XPathProviderPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "x_path_provider", binaryMessenger: registrar.messenger())
        let instance = XPathProviderPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)
        case "getAppDirectory":
            result(getAppDirectory())
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func getAppDirectory()-> String? {
//        var path = getDirectory(ofType: fileManagerDirectoryForType(type))
        let path = getDirectory(ofType: FileManager.SearchPathDirectory.documentDirectory)
    return path
    }
    
//    private func fileManagerDirectoryForType(_ type: DirectoryType) -> FileManager.SearchPathDirectory {
//      switch type {
//      case .applicationCache:
//        return FileManager.SearchPathDirectory.cachesDirectory
//      case .applicationDocuments:
//        return FileManager.SearchPathDirectory.documentDirectory
//      case .applicationSupport:
//        return FileManager.SearchPathDirectory.applicationSupportDirectory
//      case .downloads:
//        return FileManager.SearchPathDirectory.downloadsDirectory
//      case .library:
//        return FileManager.SearchPathDirectory.libraryDirectory
//      case .temp:
//        return FileManager.SearchPathDirectory.cachesDirectory
//      }
//    }
    
    private func getDirectory(ofType directory: FileManager.SearchPathDirectory)-> String?{
        let paths = NSSearchPathForDirectoriesInDomains(directory, FileManager.SearchPathDomainMask.userDomainMask, true)
        return paths.first
    }
}
