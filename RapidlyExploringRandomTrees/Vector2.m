//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Vector2.h"


@implementation Vector2 {
}
+ (id)vector2WithX:(float)x Y:(float)y {
    return [[[self alloc] initWithX:x Y:y] autorelease];
}

- (id)initWithX:(float)x Y:(float)y {
    if (self = [super init]) {
        self.x = x;
        self.y = y;
        self.nextVectors = [[[NSMutableArray alloc] init] autorelease];
    }
    return self;
}

- (void)addNextVector:(Vector2 *)nextVector {
    [self.nextVectors addObject:nextVector];
}

- (void)dealloc {
    self.nextVectors = nil;
    self.prevVector = nil;
    [super dealloc];
}
@end
