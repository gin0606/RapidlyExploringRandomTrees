//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Edge.h"
#import "EdgeExtension.h"
#import "Node.h"

@implementation EdgeExtension {

}

+ (BOOL)edge1:(Edge *)edge1 isCrossingEdge2:(Edge *)edge2 {
    Node *o1 = edge1.origin;
    Node *d1 = edge1.destination;
    Node *o2 = edge2.origin;
    Node *d2 = edge2.destination;

    return [self edgeOrigin1:o1.p distination1:d1.p isCrossingEdgeOrigin2:o2.p destination2:d2.p];
}

+ (BOOL)edgeOrigin1:(CGPoint)o1 distination1:(CGPoint)d1 isCrossingEdgeOrigin2:(CGPoint)o2 destination2:(CGPoint)d2 {
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

+ (BOOL)edgeLengthRangeContainVector:(Edge *)edge vector:(Node *)vector {
    Node *p1 = edge.origin;
    Node *p2 = edge.destination;
    float l = ccpDistance(p1.p, p2.p);
    return ccpFuzzyEqual(p1.p, vector.p, l)
            || ccpFuzzyEqual(p2.p, vector.p, l);
}
@end
