//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Edge;


@interface EdgeExtension : NSObject
+ (BOOL)edge1:(Edge *)edge1 isCrossingEdge2:(Edge *)edge2;

+ (BOOL)edgeOrigin1:(Vector2 *)o1 distination1:(Vector2 *)d1 isCrossingEdgeOrigin2:(Vector2 *)o2 destination2:(Vector2 *)d2;

+ (BOOL)edgeLengthRangeContainVector:(Edge *)edge vector:(Vector2 *)vector;


@end
