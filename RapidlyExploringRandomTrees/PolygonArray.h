//
// Created by kkgn06 on 2012/11/06.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface PolygonArray : NSMutableArray
+ (id)polygonArray;

- (id)init;

- (unsigned)count;

- (id)objectAtIndex:(unsigned)index;

- (void)addObject:object;

- (void)replaceObjectAtIndex:(unsigned)index withObject:object;

- (void)removeLastObject;

- (void)insertObject:object atIndex:(unsigned)index;

- (void)removeObjectAtIndex:(unsigned)index;

@property(retain, nonatomic) NSMutableArray *embeddedArray;
@end
