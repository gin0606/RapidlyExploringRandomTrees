//
// Created by kkgn06 on 2012/11/04.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

#define vector(__X__, __Y__) [Vector2 vector2WithX:__X__ Y:__Y__]
#define vectorToCGPoint(__VECTOR__) CGPointMake(__VECTOR__.x, __VECTOR__.y)


@interface Vector2 : NSObject

+ (id)vector2WithX:(float)x Y:(float)y;

- (id)initWithX:(float)x Y:(float)y;

- (void)addNextVector:(Vector2 *)nextVector;

@property(nonatomic, readwrite) float x;
@property(nonatomic, readwrite) float y;
@property(nonatomic, retain) NSMutableArray *nextVectors;
@property(nonatomic, retain) Vector2 *prevVector;
@end
