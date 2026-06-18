package com.transistorsoft.flutter.backgroundgeolocation.streams;

import com.transistorsoft.locationmanager.adapter.BackgroundGeolocation;
import com.transistorsoft.locationmanager.adapter.callback.TSLocationFilterCallback;
import com.transistorsoft.locationmanager.event.EventName;
import com.transistorsoft.locationmanager.event.LocationFilterEvent;

import io.flutter.plugin.common.EventChannel;

public class LocationFilterStreamHandler extends StreamHandler implements TSLocationFilterCallback {

    public LocationFilterStreamHandler() {
        mEvent = EventName.LOCATIONFILTER;
    }

    @Override
    public void onListen(Object args, EventChannel.EventSink eventSink) {
        super.onListen(args, eventSink);
        mSubscription = BackgroundGeolocation.getInstance(mContext).onLocationFilter(this);
    }

    @Override
    public void onLocationFilter(LocationFilterEvent event) {
        mEventSink.success(event.toMap());
    }
}
