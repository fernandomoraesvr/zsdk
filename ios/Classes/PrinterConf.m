//
//  PrinterConf.m
//  zsdk
//
//  Created by Luis on 1/14/20.
//

#import "PrinterConf.h"
#import "OrientationUtils.h"
#import "SGDParams.h"
#import "SGD.h"

@implementation PrinterConf

- (id)initWithCmWidth:(NSNumber *)cmWidth cmHeight:(NSNumber *)cmHeight dpi:(NSNumber *)dpi orientation:(NSString *)orientation {
    self = [super init];
    if(self){
        self.cmWidth = ![ObjectUtils isNull:cmWidth] ? [cmWidth doubleValue] : 15.20;
        self.cmHeight = ![ObjectUtils isNull:cmHeight] ? [cmWidth doubleValue] : 7.00;
        self.dpi = ![ObjectUtils isNull:dpi] ? [dpi doubleValue] : 0;
        self.orientation = ![ObjectUtils isNull:orientation] ? [OrientationUtils getValueByName:orientation] : LANDSCAPE;
    }
    return self;
}

- (void)initValues:(id<ZebraPrinterConnection,NSObject>)connection {
    if(self.dpi == 0 && ![ObjectUtils isNull:connection]) {
        @try {
            if(![connection isConnected]) [connection open];
            NSError *error = nil;
            const NSString *dpiAsString = [SGD GET:SGDParams.KEY_PRINTER_DPI withPrinterConnection:connection error:&error];
            if(![ObjectUtils isNull:dpiAsString])
                self.dpi = [dpiAsString doubleValue];
        }
        @catch(NSException *e) {
//            Do nothing
            NSLog(@"%@", e.reason);
        }
    }
    if(self.dpi == 0) self.dpi = SGDParams.VALUE_DPI_DEFAULT;
    self.width = [self convertCmToPx:self.cmWidth dpi:self.dpi];
    self.height = [self convertCmToPx:self.cmHeight dpi:self.dpi];
}

- (double)convertCmToPx:(double)cm dpi:(double)dpi{
    const double inchCm = 2.54; //One inch in centimeters
    const double pixels = (dpi / inchCm) * cm;
    return pixels;
}

@end
