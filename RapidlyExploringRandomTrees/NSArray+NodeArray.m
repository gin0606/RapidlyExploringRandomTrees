//
// Created by kkgn06 on 2013/04/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSArray+NodeArray.h"
#import "Node.h"


@implementation NSArray (NodeArray)
- (Node *)nearlyNode:(Node *)node {
    float minDistance = FLT_MAX;
    Node *nealyNode = nil;
    for (Node *vector in self) {
        NSAssert([vector isKindOfClass:[Node class]], @"Nodeしか入ってないArrayじゃないと使えない");
        float distance = ccpDistance(node.p, vector.p);
        if (distance < minDistance) {
            nealyNode = vector;
            minDistance = distance;
        }
    }

    return nealyNode;
}

- (NSArray *)nearlyNodes:(Node *)node range:(float)r {
    NSMutableArray *nealyNodes = [NSMutableArray array];
    for (Node *vector in self) {
        NSAssert([vector isKindOfClass:[Node class]], @"Nodeしか入ってないArrayじゃないと使えない");
        float distance = ccpDistance(node.p, vector.p);
        if (distance < r) {
            [nealyNodes addObject:vector];
        }
    }

    return [NSArray arrayWithArray:nealyNodes];
}

@end
