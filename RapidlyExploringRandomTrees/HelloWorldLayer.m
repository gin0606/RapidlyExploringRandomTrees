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
#import "Vector2.h"
#import "EdgeArray.h"
#import "Polygon.h"
#import "PolygonArray.h"
#import "NodeArray.h"
#import "Vector2Extension.h"

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
        Vector2 *startPoint = vector(winSize.width / 2, winSize.height / 2);
        self.rrt.startPoint = startPoint;
        [self.rrt.nodeArray addObject:startPoint];


        // 障害物を仮で設置
        NodeArray *na = [NodeArray nodeArray];
        int n = 8;
        float angle = 360 / n;
        Vector2 *circleCenter = [Vector2 vector2WithX:75 Y:75];
        for (int i = 0; i < n; i++) {
            Vector2 *v = [Vector2Extension ccpRotateByAngle:circleCenter
                                                      pivot:vector(50, 50) angle:CC_DEGREES_TO_RADIANS(angle * i)];
            [na addObject:v];
        }
        [self.rrt.objectArray addObject:[Polygon polygonWithNodeArray:na]];


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
    ccDrawPoint(vectorToCGPoint(self.rrt.targetPoint));

    if (self.rrt.goalPoint) {
        [self unschedule:@selector(step)];
        ccDrawColor4B(255, 0, 0, 255);
        __block void (^drawGoalRoot)(Vector2 *) = ^(Vector2 *v) {
            if (v.prevVector != nil) {
                drawGoalRoot(v.prevVector);
                [self drawLine:v destination:v.prevVector];
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

- (void)drawEdges:(Vector2 *)startPoint {
    for (Vector2 *v2 in startPoint.nextVectors) {
        [self drawEdges:v2];
        [self drawLine:startPoint destination:v2];
    }

}

- (void)drawLine:(Vector2 *)origin destination:(Vector2 *)destination {
    CGPoint originPoint = vectorToCGPoint(origin);
    CGPoint destinationPoint = vectorToCGPoint(destination);
    ccDrawLine(originPoint, destinationPoint);
}

- (void)drawPolygon:(EdgeArray *)edgeArray {
    for (Edge *object in edgeArray) {
        [self drawLine:object.origin destination:object.destination];
    }
}

@end
