//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NodeArray;
@class Node;

@interface RapidlyExploringRandomTrees : NSObject
@property(nonatomic) float minX;
@property(nonatomic) float minY;
@property(nonatomic) float maxX;
@property(nonatomic) float maxY;
@property(nonatomic) float diffX;
@property(nonatomic) float diffY;

@property(retain, nonatomic) Node *startPoint;
@property(retain, nonatomic) Node *targetPoint;
@property(retain, nonatomic) Node *goalPoint;
@property(nonatomic) float delta;

@property(retain, nonatomic) NodeArray *nodeArray;
@property(retain, nonatomic) NSMutableArray *objectArray;

- (void)step;

@end
