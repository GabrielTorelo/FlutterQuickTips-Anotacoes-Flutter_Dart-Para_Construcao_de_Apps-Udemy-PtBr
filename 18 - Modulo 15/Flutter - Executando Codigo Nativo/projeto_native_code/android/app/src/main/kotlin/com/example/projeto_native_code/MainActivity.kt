package com.example.projeto_native_code

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "com.example.projeto_native_code/sum"

  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
      .setMethodCallHandler {
        call, result ->
          if (call.method == "calculateSum") {
            val a = call.argument<Int>("a")
            val b = call.argument<Int>("b")

            if (a != null && b != null) {
              result.success(a + b)
            } else {
              result.error("UNAVAILABLE", "Sum was not calculated", null)
            }
          } else {
            result.notImplemented()
          }
      }
  }
}
