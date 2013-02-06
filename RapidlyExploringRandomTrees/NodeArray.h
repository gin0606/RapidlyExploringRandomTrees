//
// Created by kkgn06 on 2012/11/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Node;

@interface NodeArray : NSMutableArray {
}
+ (id)nodeArray;

- (id)init;

- (Node *)nearlyNode:(Node *)node;

- (NSArray *)nearlyNodes:(Node *)node range:(float)r;


- (unsigned)count;

- (id)objectAtIndex:(unsigned)index;

- (void)addObject:object;

- (void)replaceObjectAtIndex:(unsigned)index withObject:object;

- (void)removeLastObject;

- (void)insertObject:object atIndex:(unsigned)index;

- (void)removeObjectAtIndex:(unsigned)index;

@property(retain, nonatomic) NSMutableArray *embeddedArray;

@end
