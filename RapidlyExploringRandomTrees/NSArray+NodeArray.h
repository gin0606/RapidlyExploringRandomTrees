//
// Created by kkgn06 on 2013/04/07.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Node;

@interface NSArray (NodeArray)
- (Node *)nearlyNode:(Node *)node;

- (NSArray *)nearlyNodes:(Node *)node range:(float)r;
@end
