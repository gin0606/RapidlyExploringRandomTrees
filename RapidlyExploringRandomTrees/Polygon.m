//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Polygon.h"
#import "NodeArray.h"
#import "Vector2.h"
#import "EdgeArray.h"
#import "Edge.h"

@interface Polygon ()
- (CGPoint)vectorToCGPoint:(Vector2 *)v;

@end

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
        Vector2 *sp = [nodeArray objectAtIndex:0];
        CGPathMoveToPoint(self.path, NULL, sp.x, sp.y);

        for (int i = 1; i < count; i++) {
            Vector2 *v = [nodeArray objectAtIndex:i];
            CGPathAddLineToPoint(self.path, NULL, v.x, v.y);

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
- (BOOL)containPoint:(Vector2 *)v {
    CGPoint point = [self vectorToCGPoint:v];
    return CGPathContainsPoint(self.path, NULL, point, YES);
}

- (CGPoint)vectorToCGPoint:(Vector2 *)v {
    return ccp(v.x, v.y);
}
@end
