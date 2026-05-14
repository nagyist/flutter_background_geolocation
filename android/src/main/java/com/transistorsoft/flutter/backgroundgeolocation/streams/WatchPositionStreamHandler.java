package com.transistorsoft.flutter.backgroundgeolocation.streams;

import android.os.Handler;
import android.os.Looper;

import com.transistorsoft.locationmanager.event.LocationEvent;

import java.util.HashMap;
import java.util.Map;

public class WatchPositionStreamHandler extends StreamHandler {
    private final Handler mMainHandler = new Handler(Looper.getMainLooper());

    public WatchPositionStreamHandler() {
        mEvent = "watchPosition";
    }

    public void emit(int streamId, LocationEvent event) {
        if (mEventSink == null) return;
        Map<String, Object> data = new HashMap<>();
        data.put("streamId", streamId);
        data.put("location", event.toMap());
        mMainHandler.post(() -> {
            if (mEventSink != null) {
                mEventSink.success(data);
            }
        });
    }
}
