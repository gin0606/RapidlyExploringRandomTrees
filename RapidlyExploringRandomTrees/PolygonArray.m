//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PolygonArray.h"
#import "Polygon.h"

@implementation PolygonArray {

}
+ (id)polygonArray {
    return [[[self alloc] init] autorelease];
}

- (id)init {
    if (self = [super init]) {
        self.embeddedArray = [[[NSMutableArray allocWithZone:[self zone]] init] autorelease];
    }
    return self;
}

- (unsigned int)count {
    return [self.embeddedArray count];
}

- (id)objectAtIndex:(unsigned int)index1 {
    return [self.embeddedArray objectAtIndex:index1];
}

- (void)addObject:(id)anObject {
    NSAssert([anObject isKindOfClass:[Polygon class]], @"EdgeArray can add Edge Class.");
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
    [self.embeddedArray replaceObjectAtIndex:index withObject:anObject];
}

@end
