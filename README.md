# X Path Provider

Get application directory path

## Supported Platform
- Android: SDK 16+ (tested on Android API 34)
- iOS: 12.0+ (tested on iOS 17.2)
- Windows: Maintenance

## Example
```dart
final _xPathProvider = XPathProvider();
var path = await _xPathProvider.getAppDirectory();
print("path: $path");
```