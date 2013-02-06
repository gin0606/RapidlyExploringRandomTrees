//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Polygon.h"
#import "NodeArray.h"
#import "EdgeArray.h"
#import "Edge.h"
#import "Node.h"

@implementation Polygon {
}

+ (id)polygonWithNodeArray:(NodeArray *)nodeArray {
    return [[[self alloc] initWithNodeArray:nodeArray] autorelease];
}

- (id)initWithNodeArray:(NodeArray *)nodeArray {
    if (self = [super init]) {
        self.path = CGPathCreateMutable();

        self.edgeArray = [EdgeArray edgeArray];
        int count = [nodeArray count];
        Node *sp = [nodeArray objectAtIndex:0];
        CGPathMoveToPoint(self.path, NULL, sp.p.x, sp.p.y);

        for (int i = 1; i < count; i++) {
            Node *v = [nodeArray objectAtIndex:i];
            CGPathAddLineToPoint(self.path, NULL, v.p.x, v.p.y);

            Edge *edge = [Edge edgeWithOrigin:sp destination:v];
            [self.edgeArray addObject:edge];
            sp = v;
        }
        CGPathCloseSubpath(self.path);
        Edge *edge = [Edge edgeWithOrigin:sp destination:[nodeArray objectAtIndex:0]];
        [self.edgeArray addObject:edge];
    }
    return self;
}

// v が Polygonの領域内ならYES
- (BOOL)containPoint:(Node *)v {
    return CGPathContainsPoint(self.path, NULL, v.p, YES);
}
@end
