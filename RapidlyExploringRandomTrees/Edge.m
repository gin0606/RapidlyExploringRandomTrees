//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Edge.h"
#import "Node.h"


@implementation Edge {

}
+ (id)edgeWithOrigin:(Node *)origin destination:(Node *)destination {
    return [[[self alloc] initWithOrigin:origin destination:destination] autorelease];
}

- (id)initWithOrigin:(Node *)origin destination:(Node *)destination {
    if (self = [super init]) {
        self.origin = origin;
        self.destination = destination;
    }
    return self;
}
@end
