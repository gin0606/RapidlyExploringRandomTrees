//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Edge;
@class Node;


@interface EdgeExtension : NSObject
+ (BOOL)edge1:(Edge *)edge1 isCrossingEdge2:(Edge *)edge2;

+ (BOOL)edgeOrigin1:(CGPoint)o1 distination1:(CGPoint)d1 isCrossingEdgeOrigin2:(CGPoint)o2 destination2:(CGPoint)d2;

+ (BOOL)edgeLengthRangeContainVector:(Edge *)edge vector:(Node *)vector;


@end
