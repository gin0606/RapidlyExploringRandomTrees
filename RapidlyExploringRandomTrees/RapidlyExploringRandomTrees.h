//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Vector2;
@class EdgeArray;
@class NodeArray;
@class PolygonArray;

@interface RapidlyExploringRandomTrees : NSObject
@property(nonatomic) float minX;
@property(nonatomic) float minY;
@property(nonatomic) float maxX;
@property(nonatomic) float maxY;
@property(nonatomic) float diffX;
@property(nonatomic) float diffY;

@property(retain, nonatomic) Vector2 *startPoint;
@property(retain, nonatomic) Vector2 *targetPoint;
@property(retain, nonatomic) Vector2 *goalPoint;
@property(nonatomic) float delta;

@property(retain, nonatomic) NodeArray *nodeArray;
@property(retain, nonatomic) PolygonArray *objectArray;

- (void)step;

@end
