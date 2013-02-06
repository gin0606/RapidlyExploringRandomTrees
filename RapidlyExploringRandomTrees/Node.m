//
// Created by kkgn06 on 2013/02/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Node.h"


@implementation Node {

}

+ (id)nodeWithX:(float)x y:(float)y {
    return [[[self alloc] initWithX:x y:y] autorelease];
}

+ (id)nodeWithPoint:(CGPoint)point {
    return [[[self alloc] initWithPoint:point] autorelease];
}

- (id)initWithX:(float)x y:(float)y {
    return [self initWithPoint:ccp(x, y)];
}

- (id)initWithPoint:(CGPoint)point {
    if (self = [super init]) {
        _p = point;
        self.nextNodes = [NSMutableArray array];
    }
    return self;
}

- (void)addNextVector:(Node *)node {
    [self.nextNodes addObject:node];
}

- (void)dealloc {
    self.nextNodes = nil;
    self.prevNode = nil;
    [super dealloc];
}

@end
