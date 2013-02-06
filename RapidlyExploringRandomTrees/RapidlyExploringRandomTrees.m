//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NodeArray.h"
#import "RapidlyExploringRandomTrees.h"
#import "PolygonArray.h"
#import "EdgeExtension.h"
#import "Polygon.h"
#import "Edge.h"
#import "EdgeArray.h"
#import "Node.h"

@interface RapidlyExploringRandomTrees ()
- (Node *)randomVector;

- (float)randomFloat;

@end

@implementation RapidlyExploringRandomTrees {
}

- (id)init {
    if (self = [super init]) {
        srand((unsigned int) time(NULL));
        CGSize winSize = [CCDirector sharedDirector].winSize;

        // 探索範囲
        self.minX = 0.f;
        self.minY = 0.f;
        self.maxX = winSize.width;
        self.maxY = winSize.height;
        self.diffX = self.maxX - self.minX;
        self.diffY = self.maxY - self.minY;

        // ノード入れるArray
        self.nodeArray = [NodeArray nodeArray];

        // 障害物入れるArray
        self.objectArray = [PolygonArray polygonArray];

        // 目標地点はとりあえず設定しないので一応nil
        self.targetPoint = [self randomVector];
        while ([self didVectorHitBarriers:self.targetPoint]) {
            self.targetPoint = [self randomVector];
        }
        CCLOG(@"targetX : %f, targetY : %f", self.targetPoint.p.x, self.targetPoint.p.y);

        self.delta = 1.f;
    }
    return self;
}

/*
初期状態を探索木の視点に登録する
------
ランダムな点Rを設置
Rに最も近い点Nを求める
NからRにdeltaだけ移動した点Dを求める
点Dが障害物に干渉しなければ新たな状態としてNに接続して探索木に加える
----
 */
- (void)step {
    Node *randomPoint = [self randomVector];
    Node *nealyPoint = [self.nodeArray nearlyNode:randomPoint];

    Node *vectorDistance = [Node nodeWithPoint:ccpSub(randomPoint.p, nealyPoint.p)];
    Node *moveDelta = [Node nodeWithPoint:ccpMult(ccpNormalize(vectorDistance.p), self.delta)];

    Node *deltaPoint = [Node nodeWithPoint:ccpAdd(nealyPoint.p, moveDelta.p)];
    Edge *edge = [Edge edgeWithOrigin:nealyPoint destination:deltaPoint];


    /* 既にある辺と交差しない
     * 点Dが障害物に含まれない
     * 線分NDが障害物を横断or含まれない
     */
    if (![self edgeCrossCheck:nealyPoint destination:deltaPoint]
            && ![self didVectorHitBarriers:deltaPoint]
            && ![self didVectorOverBarriers:edge]) {
        [nealyPoint addNextVector:deltaPoint];
        deltaPoint.prevNode = nealyPoint;

        [self.nodeArray addObject:deltaPoint];
        if (ccpFuzzyEqual(self.targetPoint.p, deltaPoint.p, 10)){
            self.goalPoint = deltaPoint;
        }
    }
}

- (BOOL)edgeCrossCheck:(Node *)o1 destination:(Node *)d1 {
    for (Node *o2 in self.nodeArray.embeddedArray) {
        for (Node *d2 in o2.nextNodes) {
            BOOL isCrossing = [EdgeExtension edgeOrigin1:o1.p distination1:d1.p
                                   isCrossingEdgeOrigin2:o2.p destination2:d2.p];
            if (isCrossing) {
                return YES;
            }
        }
    }
    return NO;
}

// 障害物にvが入ってるか
- (BOOL)didVectorHitBarriers:(Node *)v {
    for (Polygon *polygon in self.objectArray) {
        if ([polygon containPoint:v]) {
            return YES;
        }
    }
    return NO;
}

// 障害物に線が被ってるか
- (BOOL)didVectorOverBarriers:(Edge *)edge {
    for (Polygon *polygon in self.objectArray) {
        for (Edge *polygonEdge in polygon.edgeArray.embeddedArray) {
            if ([EdgeExtension edge1:polygonEdge isCrossingEdge2:edge]) {
                return YES;
            }
        }
    }
    return NO;
}

// 画面内の点を返す
- (Node *)randomVector {
    float randomX = [self randomFloat] * self.diffX;
    float randomY = [self randomFloat] * self.diffY;
    return [Node nodeWithX:self.minX + randomX y:self.minY + randomY];
}

/*
 * return random float value between 0.0f to 1.0f
 */
- (float)randomFloat {
    float r = (random() / (float) 0x7fffffff);
    return r;
}

@end
