//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NodeArray;
@class EdgeArray;
@class Vector2;

@interface Polygon : NSObject
+ (id)polygonWithNodeArray:(NodeArray *)nodeArray;

- (id)initWithNodeArray:(NodeArray *)nodeArray;

- (BOOL)containPoint:(Vector2 *)v;


@property CGMutablePathRef path;
@property(retain, nonatomic) EdgeArray *edgeArray;

@end
