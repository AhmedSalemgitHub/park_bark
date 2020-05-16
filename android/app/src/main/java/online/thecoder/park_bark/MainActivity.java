package online.thecoder.park_bark;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);
  }
}
////////////////////////////////////////////////////////proper
// import android.os.Bundle;
// import android.view.ViewTreeObserver;
// import android.view.WindowManager;



// import io.flutter.app.FlutterActivity;
// import io.flutter.plugins.GeneratedPluginRegistrant;

// public class MainActivity extends FlutterActivity {

//     @Override
//     protected void onCreate(Bundle saveInstanceState) {
//         //make transparent
//         super.onCreate(saveInstanceState);
//         getWindow().setStatusBarColor(0x00000000);
//         GeneratedPluginRegistrant.registerWith(this);

//         //remove full screen flag
//         ViewTreeObserver vto = getFlutterView().getViewTreeObserver();
//         vto.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
//             @Override
//             public void onGlobalLayout() {
//                 getFlutterView().getViewTreeObserver().removeOnGlobalLayoutListener(this);
//                 getWindow().clearFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN);
//             }
//         });

//     }

// }
