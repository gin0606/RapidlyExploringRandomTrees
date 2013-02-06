//
// Created by kkgn06 on 2012/11/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NodeArray.h"
#import "Vector2.h"
#import "Vector2Extension.h"


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

- (Vector2 *)nearlyNode:(Vector2 *)node {
    float minDistance = FLT_MAX;
    Vector2 *nealyNode = nil;
    for (Vector2 *vector in self.embeddedArray) {
        float distance = [Vector2Extension vectorDistance:node v2:vector];
        if (distance < minDistance) {
            nealyNode = vector;
            minDistance = distance;
        }
    }

    return nealyNode;
}

- (NSArray *)nearlyNodes:(Vector2 *)node range:(float)r{
    NSMutableArray *nealyNodes = [NSMutableArray array];
    for (Vector2 *vector in self.embeddedArray) {
        float distance = [Vector2Extension vectorDistance:node v2:vector];
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
    NSAssert([anObject isKindOfClass:[Vector2 class]], @"Vector2 can add Edge Class.");
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
