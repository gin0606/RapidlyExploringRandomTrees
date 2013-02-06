//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Vector2;


@interface Edge : NSObject
+(id)edgeWithOrigin:(Vector2 *)origin destination:(Vector2 *)destination;
-(id)initWithOrigin:(Vector2 *)origin destination:(Vector2 *)destination;

@property (retain, nonatomic)Vector2 * origin;
@property (retain, nonatomic)Vector2 * destination;
@end
