//
// Created by kkgn06 on 2012/11/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class Vector2;
@class Vector2;


@interface Vector2Extension : NSObject
+ (float)vectorDistance:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (Vector2 *)ccpAdd:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (Vector2 *)ccpSub:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (float)ccpDistance:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (float)ccpLength:(Vector2 *)v;

+ (float)ccpLengthSQ:(Vector2 *)v;

+ (float)ccpDot:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (float)ccpAngle:(Vector2 *)v1 v2:(Vector2 *)v2;

+ (Vector2 *)ccpNormalize:(Vector2 *)v;

+ (Vector2 *)ccpMult:(Vector2 *)v s:(float)s;

+ (Vector2 *)ccpRotateByAngle:(Vector2 *)v pivot:(Vector2 *)pivot angle:(float)angle;

+ (BOOL)ccpFuzzyEqual:(Vector2 *)a v2:(Vector2 *)b range:(float)var;


@end
