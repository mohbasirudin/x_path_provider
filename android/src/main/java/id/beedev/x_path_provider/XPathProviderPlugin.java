package id.beedev.x_path_provider;

import android.content.Context;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.util.PathUtils;

/**
 * XPathProviderPlugin
 */
public class XPathProviderPlugin implements FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context context;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "x_path_provider");
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("getPlatformVersion")) {
            result.success("Android " + android.os.Build.VERSION.RELEASE);

        } else if(call.method.equals("getAppDirectory")) {
            result.success(getAppDirectory());
        }else{

            result.notImplemented();
        }

//        String method = call.method;
//        switch (method) {
//            case "getAppDirectory":
//                result.success(getAppDirectory());
//            case "getPlatformVersion":
//                result.success("Android " + android.os.Build.VERSION.RELEASE);
//            default:
//                result.notImplemented();
//        }


    }

    //  app directory
    private String getAppDirectory() {
        return PathUtils.getDataDirectory(context);
//        return  context.getApplicationInfo().dataDir;
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}
