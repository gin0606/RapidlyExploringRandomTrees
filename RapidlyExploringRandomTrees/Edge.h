//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Node;


@interface Edge : NSObject
+(id)edgeWithOrigin:(Node *)origin destination:(Node *)destination;
-(id)initWithOrigin:(Node *)origin destination:(Node *)destination;

@property (retain, nonatomic)Node * origin;
@property (retain, nonatomic)Node * destination;
@end
