//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NodeArray;
@class Node;

@interface Polygon : NSObject
+ (id)polygonWithNodeArray:(NodeArray *)nodeArray;

- (id)initWithNodeArray:(NodeArray *)nodeArray;

- (BOOL)containPoint:(Node *)v;


@property CGMutablePathRef path;
@property(retain, nonatomic) NSMutableArray *edgeArray;

@end
