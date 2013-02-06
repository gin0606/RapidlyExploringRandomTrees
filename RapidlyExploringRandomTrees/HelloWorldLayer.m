//
//  HelloWorldLayer.m
//  RapidlyExploringRandomTrees
//
//  Created by kkgn06 on 11/04/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import "HelloWorldLayer.h"
#import "RapidlyExploringRandomTrees.h"
#import "Edge.h"
#import "EdgeArray.h"
#import "Polygon.h"
#import "PolygonArray.h"
#import "NodeArray.h"
#import "Node.h"

@interface HelloWorldLayer ()
@property(retain, nonatomic) RapidlyExploringRandomTrees *rrt;

@end

@implementation HelloWorldLayer {
}

+ (CCScene *)scene {
    CCScene *scene = [CCScene node];
    HelloWorldLayer *layer = [HelloWorldLayer node];
    [scene addChild:layer];

    return scene;
}

- (id)init {
    if ((self = [super init])) {
        self.rrt = [[[RapidlyExploringRandomTrees alloc] init] autorelease];
        CGSize winSize = [CCDirector sharedDirector].winSize;

        // 始点をとりあえず真ん中に設置
        Node *startPoint = [Node nodeWithX:winSize.width / 2 y:winSize.height / 2];
        self.rrt.startPoint = startPoint;
        [self.rrt.nodeArray addObject:startPoint];

        // 目標地点ランダム
        self.rrt.targetPoint = [Node nodeWithX:winSize.width * CCRANDOM_0_1() y:winSize.height * CCRANDOM_0_1()];
        CCLOG(@"targetX : %f, targetY : %f", self.rrt.targetPoint.p.x, self.rrt.targetPoint.p.y);

        // 障害物を仮で設置
//        NodeArray *na = [NodeArray nodeArray];
//        int n = 8;
//        float angle = 360 / n;
//        Node *circleCenter = [Node nodeWithX:75 y:75];
//        for (int i = 0; i < n; i++) {
//            CGPoint rp = ccpRotateByAngle(circleCenter.p, ccp(50, 50), CC_DEGREES_TO_RADIANS(angle * i));
//            Node *v = [Node nodeWithPoint:rp];
//            [na addObject:v];
//        }
//        [self.rrt.objectArray addObject:[Polygon polygonWithNodeArray:na]];


        [self schedule:@selector(step)/* interval:0.2f*/];
    }
    return self;
}

- (void)step {
    [self.rrt step];
}

- (void)draw {
    // draw tree
    ccDrawColor4B(255, 255, 255, 255);
    [self drawEdges:self.rrt.startPoint];

    ccDrawColor4B(0, 0, 255, 255);
    ccDrawPoint(self.rrt.targetPoint.p);

    if (self.rrt.goalPoint) {
        [self unschedule:@selector(step)];
        ccDrawColor4B(255, 0, 0, 255);
        __block void (^drawGoalRoot)(Node *) = ^(Node *v) {
            if (v.prevNode != nil) {
                drawGoalRoot(v.prevNode);
                [self drawLine:v destination:v.prevNode];
            }
        };
        drawGoalRoot(self.rrt.goalPoint);
    }

    // 障害物描写
    ccDrawColor4B(0, 255, 0, 255);
    PolygonArray *polygonArray = self.rrt.objectArray;
    for (Polygon *polygon in polygonArray) {
        [self drawPolygon:polygon.edgeArray];
    }
}

- (void)drawEdges:(Node *)startPoint {
    for (Node *v2 in startPoint.nextNodes) {
        [self drawEdges:v2];
        [self drawLine:startPoint destination:v2];
    }

}

- (void)drawLine:(Node *)origin destination:(Node *)destination {
    ccDrawLine(origin.p, destination.p);
}

- (void)drawPolygon:(EdgeArray *)edgeArray {
    for (Edge *object in edgeArray) {
        [self drawLine:object.origin destination:object.destination];
    }
}

@end
