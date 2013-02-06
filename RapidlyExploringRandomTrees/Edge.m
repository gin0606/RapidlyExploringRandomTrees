//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Edge.h"
#import "Vector2.h"


@implementation Edge {

}
+ (id)edgeWithOrigin:(Vector2 *)origin destination:(Vector2 *)destination {
    return [[[self alloc] initWithOrigin:origin destination:destination] autorelease];
}

- (id)initWithOrigin:(Vector2 *)origin destination:(Vector2 *)destination {
    if(self = [super init]){
        self.origin = origin;
        self.destination = destination;
    }
    return self;
}
@end
