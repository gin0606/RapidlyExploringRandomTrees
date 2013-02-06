//
// Created by kkgn06 on 2013/02/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Node : NSObject
+ (id)nodeWithX:(float)x y:(float)y;

+ (id)nodeWithPoint:(CGPoint)point;

- (id)initWithX:(float)x y:(float)y;

- (id)initWithPoint:(CGPoint)point;


@property(nonatomic, readonly) CGPoint p;

- (void)addNextVector:(Node *)node;

@property(nonatomic, retain) NSMutableArray *nextNodes;
@property(nonatomic, retain) Node *prevNode;

@end
