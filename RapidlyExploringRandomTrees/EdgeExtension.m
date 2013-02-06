//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Vector2.h"
#import "Edge.h"
#import "Vector2Extension.h"
#import "EdgeExtension.h"

@implementation EdgeExtension {

}

+ (BOOL)edge1:(Edge *)edge1 isCrossingEdge2:(Edge *)edge2 {
    Vector2 *o1 = edge1.origin;
    Vector2 *d1 = edge1.destination;
    Vector2 *o2 = edge2.origin;
    Vector2 *d2 = edge2.destination;

    return [self edgeOrigin1:o1 distination1:d1 isCrossingEdgeOrigin2:o2 destination2:d2];
}

+ (BOOL)edgeOrigin1:(Vector2 *)o1 distination1:(Vector2 *)d1 isCrossingEdgeOrigin2:(Vector2 *)o2 destination2:(Vector2 *)d2 {
    float ta = (o2.x - d2.x) * (o1.y - o2.y) + (o2.y - d2.y) * (o2.x - o1.x);
    float tb = (o2.x - d2.x) * (d1.y - o2.y) + (o2.y - d2.y) * (o2.x - d1.x);
    float tc = (o1.x - d1.x) * (o2.y - o1.y) + (o1.y - d1.y) * (o1.x - o2.x);
    float td = (o1.x - d1.x) * (d2.y - o1.y) + (o1.y - d1.y) * (o1.x - d2.x);

    if (ta * tb < 0 && tc * td < 0) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)edgeLengthRangeContainVector:(Edge *)edge vector:(Vector2 *)vector {
    Vector2 *p1 = edge.origin;
    Vector2 *p2 = edge.destination;
    float l = [Vector2Extension ccpDistance:p1 v2:p2];
    return [Vector2Extension ccpFuzzyEqual:p1 v2:vector range:l]
            || [Vector2Extension ccpFuzzyEqual:p2 v2:vector range:l];
}
@end
