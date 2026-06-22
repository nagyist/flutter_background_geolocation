#import "./include/flutter_background_geolocation/TSLocationFilterStreamHandler.h"

static NSString *const EVENT_NAME    = @"locationfilter";

@implementation TSLocationFilterStreamHandler

- (NSString*) event {
    return EVENT_NAME;
}

- (FlutterError*)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {

    self.callback = ^void(TSLocationFilterEvent *event) {
        events([event toDictionary]);
    };
    [[TSLocationManager sharedInstance] onLocationFilter:self.callback];

    return nil;
}
@end
