//
// Created by kkgn06 on 2012/11/05.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "Vector2Extension.h"
#import "Vector2.h"


@implementation Vector2Extension {

}

+ (float)vectorDistance:(Vector2 *)v1 v2:(Vector2 *)v2 {
    return [Vector2Extension ccpDistance:v1 v2:v2];
}

+ (Vector2 *)ccpAdd:(Vector2 *)v1 v2:(Vector2 *)v2 {
    return vector(v1.x + v2.x, v1.y + v2.y);
}

+ (Vector2 *)ccpSub:(Vector2 *)v1 v2:(Vector2 *)v2 {
    return vector(v1.x - v2.x, v1.y - v2.y);
}

+ (float)ccpDistance:(Vector2 *)v1 v2:(Vector2 *)v2 {
    return [Vector2Extension ccpLength:[Vector2Extension ccpSub:v1 v2:v2]];
}

+ (float)ccpLength:(Vector2 *)v {
    return sqrtf([Vector2Extension ccpLengthSQ:v]);
}

+ (float)ccpLengthSQ:(Vector2 *)v {
    return [Vector2Extension ccpDot:v v2:v];
}

+ (float)ccpDot:(Vector2 *)v1 v2:(Vector2 *)v2 {
    return v1.x * v2.x + v1.y * v2.y;
}

+ (float)ccpAngle:(Vector2 *)v1 v2:(Vector2 *)v2 {
    float angle = acosf([Vector2Extension ccpDot:[Vector2Extension ccpNormalize:v1]
                                              v2:[Vector2Extension ccpNormalize:v2]]);
    if (fabs(angle) < FLT_EPSILON) return 0.f;
    return angle;
}

+ (Vector2 *)ccpNormalize:(Vector2 *)v {
    return [Vector2Extension ccpMult:v s:1.0f / [Vector2Extension ccpLength:v]];
}

+ (Vector2 *)ccpMult:(Vector2 *)v s:(float)s {
    return vector(v.x * s, v.y * s);
}

+ (Vector2 *)ccpRotateByAngle:(Vector2 *)v pivot:(Vector2 *)pivot angle:(float)angle {
    Vector2 *r = [Vector2Extension ccpSub:v v2:pivot];
    float cos = cosf(angle);
    float sin = sinf(angle);
    float t = r.x;
    r.x = t * cos - r.y * sin + pivot.x;
    r.y = t * sin + r.y * cos + pivot.y;

    ccpFuzzyEqual(CGPointZero, CGPointZero, 10);
    return r;
}

+ (BOOL)ccpFuzzyEqual:(Vector2 *)a v2:(Vector2 *)b range:(float)var {
    if (a.x - var <= b.x && b.x <= a.x + var) {
        if (a.y - var <= b.y && b.y <= a.y + var) {
            return true;
        }
    }
    return false;
}

@end
