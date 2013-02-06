//
// Created by kkgn06 on 2012/11/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NodeArray.h"
#import "Node.h"


@interface NodeArray ()

@end

@implementation NodeArray {
}

+ (id)nodeArray {
    return [[[self alloc] init] autorelease];
}

- (id)init {
    if (self = [super init]) {
        self.embeddedArray = [[[NSMutableArray allocWithZone:[self zone]] init] autorelease];
    }
    return self;
}

- (Node *)nearlyNode:(Node *)node {
    float minDistance = FLT_MAX;
    Node *nealyNode = nil;
    for (Node *vector in self.embeddedArray) {
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
    for (Node *vector in self.embeddedArray) {
        float distance = ccpDistance(node.p, vector.p);
        if (distance < r) {
            [nealyNodes addObject:vector];
        }
    }

    return [NSArray arrayWithArray:nealyNodes];
}

- (unsigned int)count {
    return [self.embeddedArray count];
}

- (id)objectAtIndex:(unsigned int)index1 {
    return [self.embeddedArray objectAtIndex:index1];
}

- (void)addObject:(id)anObject {
    NSAssert([anObject isKindOfClass:[Node class]], @"Vector2 can add Edge Class.");
    [self.embeddedArray addObject:anObject];
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index {
    [self.embeddedArray insertObject:anObject atIndex:index];
}

- (void)removeLastObject {
    [self.embeddedArray removeLastObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.embeddedArray removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    [super replaceObjectAtIndex:index withObject:anObject];
}

@end
