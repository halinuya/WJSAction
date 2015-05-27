//
//  WJSActionMgr.m
//  colorsful
//
//  Created by James wu on 15/5/21.
//  Copyright (c) 2015年 James wu. All rights reserved.
//

#import "WJSAction.h"

@implementation WJSAction

#pragma mark - single action
- (SKAction *(^)(void))single
{
    return ^(void) {
        if (self.currentAction != nil) {
            return self.currentAction;
        } else {
            return [SKAction new];
        }
    };
}

#pragma mark - repeate action
- (WJSAction *(^)(SKAction *))repeate
{
    return ^(SKAction *action) {
        SKAction *repeatAction = [SKAction repeatActionForever:action];
        [self addWithAction:repeatAction];
        return self;
    };
}

- (WJSAction *(^)(SKAction *,NSUInteger))repeateN
{
    return ^(SKAction *action,NSUInteger count) {
        SKAction *repeatAction = [SKAction repeatAction:action count:count];
        [self addWithAction:repeatAction];
        return self;
    };
}

#pragma mark - sequence action
- (WJSAction *(^)(void))SeqStart
{
    if (self.WJSChainActionArray == nil) {
        self.WJSChainActionArray = [[NSMutableArray alloc] init];
    }
    
    if ([self.WJSChainActionArray count] > 0)
    {
        [self.WJSChainActionArray removeAllObjects];
    }
    
    return ^(void) {
        return self;
    };
}

- (SKAction *(^)(void))SeqEnd
{
    return ^(void) {
        SKAction *action = [SKAction sequence:self.WJSChainActionArray];
        return action;
    };
}

- (SKAction *(^)(SKAction *,...))Seq
{
    return ^(SKAction *action1,...) {
        va_list args;
        va_start(args, action1);
        
        NSMutableArray *actionArray = [[NSMutableArray alloc] init];
        for (SKAction *action = action1; action != nil; action = va_arg(args, SKAction *)) {
            [actionArray addObject:action];
        }
        va_end(args);
        
        return [SKAction sequence:actionArray];
    };
}

#pragma mark - group action
- (WJSAction *(^)(void))GrpStart
{
    if (self.WJSChainActionArray == nil) {
        self.WJSChainActionArray = [[NSMutableArray alloc] init];
    }
    
    if ([self.WJSChainActionArray count] > 0)
    {
        [self.WJSChainActionArray removeAllObjects];
    }
    
    return ^(void) {
        return self;
    };
}

- (SKAction *(^)(void))GrpEnd
{
    return ^(void) {
        SKAction *action = [SKAction group:self.WJSChainActionArray];
        return action;
    };
}

- (SKAction *(^)(SKAction *,...))Grp
{
    return ^(SKAction *action1,...) {
        va_list args;
        va_start(args, action1);
        
        NSMutableArray *actionArray = [[NSMutableArray alloc] init];
        for (SKAction *action = action1; action != nil; action = va_arg(args, SKAction *)) {
            [actionArray addObject:action];
        }
        va_end(args);
        
        return [SKAction group:actionArray];
    };
}

#pragma mark - WJSAction Move
- (WJSAction *(^)(CGFloat, NSTimeInterval))moveToX
{
    return ^(CGFloat x, NSTimeInterval duration) {
        SKAction *action = [SKAction moveToX:x duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))moveToY
{
    return ^(CGFloat y, NSTimeInterval duration) {
        SKAction *action = [SKAction moveToY:y duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGPoint, NSTimeInterval))moveToPoint
{
    return ^(CGPoint point, NSTimeInterval duration) {
        SKAction *action = [SKAction moveTo:point duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat deltaX, CGFloat deltaY, NSTimeInterval))moveByXY
{
    return ^(CGFloat deltaX, CGFloat deltaY, NSTimeInterval duration) {
        SKAction *action = [SKAction moveByX:deltaX y:deltaY duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGVector delta, NSTimeInterval))moveByV
{
    return ^(CGVector delta, NSTimeInterval duration) {
        SKAction *action = [SKAction moveBy:delta duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction Fade
- (WJSAction *(^)(NSTimeInterval))fadeOut
{
    return ^(NSTimeInterval duration) {
        SKAction *action = [SKAction fadeOutWithDuration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(NSTimeInterval))fadeIn
{
    return ^(NSTimeInterval duration) {
        SKAction *action = [SKAction fadeInWithDuration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat,NSTimeInterval))fadeByAlpha
{
    return ^(CGFloat alpha,NSTimeInterval duration) {
        SKAction *action = [SKAction fadeAlphaBy:alpha  duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat,NSTimeInterval))fadeToAlpha
{
    return ^(CGFloat alpha,NSTimeInterval duration) {
        SKAction *action = [SKAction fadeAlphaTo:alpha  duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction Falloff
- (WJSAction *(^)(CGFloat, NSTimeInterval))falloffBy
{
    return ^(CGFloat falloff, NSTimeInterval duration) {
        SKAction *action = [SKAction falloffBy:falloff duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))falloffTo
{
    return ^(CGFloat falloff, NSTimeInterval duration) {
        SKAction *action = [SKAction falloffTo:falloff duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction Resize
- (WJSAction *(^)(CGFloat, CGFloat, NSTimeInterval))resizeByWH
{
    return ^(CGFloat width, CGFloat height, NSTimeInterval duration) {
        SKAction *action = [SKAction resizeByWidth:width height:height duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))resizeToH
{
    return ^(CGFloat height, NSTimeInterval duration) {
        SKAction *action = [SKAction resizeToHeight:height duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))resizeToW
{
    return ^(CGFloat width, NSTimeInterval duration) {
        SKAction *action = [SKAction resizeToWidth:width duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, CGFloat, NSTimeInterval))resizeToWH
{
    return ^(CGFloat width, CGFloat height, NSTimeInterval duration) {
        SKAction *action = [SKAction resizeToWidth:width height:height duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction rotate
- (WJSAction *(^)(CGFloat, NSTimeInterval))rotateByA
{
    return ^(CGFloat radians,NSTimeInterval duration) {
        SKAction *action = [SKAction rotateByAngle:radians duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))rotateToA
{
    return ^(CGFloat radians,NSTimeInterval duration) {
        SKAction *action = [SKAction rotateToAngle:radians duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval, BOOL))rotateToAS
{
    return ^(CGFloat radians, NSTimeInterval duration,BOOL shortestUnitArc) {
        SKAction *action = [SKAction rotateToAngle:radians duration:duration shortestUnitArc:shortestUnitArc];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction scale
- (WJSAction *(^)(CGFloat, NSTimeInterval))scaleBy
{
    return ^(CGFloat scale, NSTimeInterval duration) {
        SKAction *action = [SKAction scaleBy:scale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))scaleTo
{
    return ^(CGFloat scale, NSTimeInterval duration) {
        SKAction *action = [SKAction scaleTo:scale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, CGFloat, NSTimeInterval))scaleByXY
{
    return ^(CGFloat xScale, CGFloat yScale,NSTimeInterval duration) {
        SKAction *action = [SKAction scaleXBy:xScale y:yScale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, CGFloat, NSTimeInterval))scaleToXY
{
    return ^(CGFloat xScale, CGFloat yScale,NSTimeInterval duration) {
        SKAction *action = [SKAction scaleXTo:xScale y:yScale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))scaleToX
{
    return ^(CGFloat xScale, NSTimeInterval duration) {
        SKAction *action = [SKAction scaleXTo:xScale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat, NSTimeInterval))scaleToY
{
    return ^(CGFloat yScale, NSTimeInterval duration) {
        SKAction *action = [SKAction scaleXTo:yScale duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction set texture
- (WJSAction *(^)(SKTexture *))setTexture
{
    return ^(SKTexture *texture) {
        SKAction *action = [SKAction setTexture:texture];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(SKTexture *, BOOL))setTextureResize
{
    return ^(SKTexture *texture, BOOL resize) {
        SKAction *action = [SKAction setTexture:texture resize:resize];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction speed
- (WJSAction *(^)(CGFloat , NSTimeInterval))speedBy
{
    return ^(CGFloat speed, NSTimeInterval duration) {
        SKAction *action = [SKAction speedBy:speed duration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(CGFloat , NSTimeInterval))speedTo
{
    return ^(CGFloat speed, NSTimeInterval duration) {
        SKAction *action = [SKAction speedTo:speed duration:duration];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction wait
- (WJSAction *(^)(NSTimeInterval))wait
{
    return ^(NSTimeInterval duration) {
        SKAction *action = [SKAction waitForDuration:duration];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(NSTimeInterval, NSTimeInterval))waitRange
{
    return ^(NSTimeInterval duration, NSTimeInterval durationRange) {
        SKAction *action = [SKAction waitForDuration:duration withRange:durationRange];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - WJSAction Other
- (WJSAction *(^)(void))removeFromParent
{
    return ^(void) {
        SKAction *action = [SKAction removeFromParent];
        [self addWithAction:action];
        return self;
    };
}

- (WJSAction *(^)(void))unhide
{
    return ^(void) {
        SKAction *action = [SKAction unhide];
        [self addWithAction:action];
        return self;
    };
}

#pragma mark - helper
- (void)addWithAction:(SKAction *)action
{
    if (self.WJSChainActionArray != nil) {
        [self.WJSChainActionArray addObject:action];
    }else {
        self.currentAction = action;
    }
    return;
}


@end
