//
//  WJSActionMgr.h
//  colorsful
//
//  Created by James wu on 15/5/21.
//  Copyright (c) 2015年 James wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#define WJSACTION [WJSAction new]
#define CGVX(x) (CGVectorMake(x,0)) 
#define CGVY(y) (CGVectorMake(0,y)) 

@interface WJSAction : NSObject

@property (nonatomic,strong) NSMutableArray *WJSChainActionArray;
@property (nonatomic,strong) SKAction *currentAction;

#pragma mark - single action
@property (nonatomic,readonly) SKAction *(^single)(void);

#pragma mark - repeate action
@property (nonatomic,readonly) WJSAction *(^repeate)(SKAction *action);
@property (nonatomic,readonly) WJSAction *(^repeateN)(SKAction *action,NSUInteger count);

#pragma mark - sequence action interface
@property (nonatomic,readonly) WJSAction *(^SeqStart)(void);
@property (nonatomic,readonly) SKAction *(^SeqEnd)(void);
@property (nonatomic,readonly) SKAction *(^Seq)(SKAction *action1,...);

#pragma mark - group action interface
@property (nonatomic,readonly) WJSAction *(^GrpStart)(void);
@property (nonatomic,readonly) SKAction *(^GrpEnd)(void);
@property (nonatomic,readonly) SKAction *(^Grp)(SKAction *action1,...);

#pragma mark - action move
@property (nonatomic,readonly) WJSAction *(^moveToX)(CGFloat x, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^moveToY)(CGFloat y, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^moveToPoint)(CGPoint point, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^moveByXY)(CGFloat deltaX, CGFloat deltaY, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^moveByV)(CGVector delta, NSTimeInterval duration);

#pragma mark - action fade
@property (nonatomic,readonly) WJSAction *(^fadeOut)(NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^fadeIn)(NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^fadeByAlpha)(CGFloat alpha, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^fadeToAlpha)(CGFloat alpha, NSTimeInterval duration);

#pragma mark - WJSAction Falloff
@property (nonatomic,readonly) WJSAction *(^falloffBy)(CGFloat falloff, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^falloffTo)(CGFloat falloff, NSTimeInterval duration);

#pragma mark - WJSAction Resize
@property (nonatomic,readonly) WJSAction *(^resizeByWH)(CGFloat width, CGFloat height, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^resizeToH)(CGFloat height, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^resizeToW)(CGFloat width, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^resizeToWH)(CGFloat width, CGFloat height, NSTimeInterval duration);

#pragma mark - WJSAction rotate
@property (nonatomic,readonly) WJSAction *(^rotateByA)(CGFloat radians,NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^rotateToA)(CGFloat radians,NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^rotateToAS)(CGFloat radians, NSTimeInterval duration,BOOL shortestUnitArc);

#pragma mark - WJSAction scale
@property (nonatomic,readonly) WJSAction *(^scaleBy)(CGFloat scale, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^scaleTo)(CGFloat scale, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^scaleByXY)(CGFloat xScale, CGFloat yScale,NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^scaleToXY)(CGFloat xScale, CGFloat yScale,NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^scaleToX)(CGFloat xScale, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^scaleToY)(CGFloat yScale, NSTimeInterval duration);

#pragma mark - WJSAction set texture
@property (nonatomic,readonly) WJSAction *(^setTexture)(SKTexture *);
@property (nonatomic,readonly) WJSAction *(^setTextureResize)(SKTexture *texture, BOOL resize);

#pragma mark - WJSAction speed
@property (nonatomic,readonly) WJSAction *(^speedBy)(CGFloat speed, NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^speedTo)(CGFloat speed, NSTimeInterval duration);

#pragma mark - WJSAction wait
@property (nonatomic,readonly) WJSAction *(^wait)(NSTimeInterval duration);
@property (nonatomic,readonly) WJSAction *(^waitRange)(NSTimeInterval duration, NSTimeInterval durationRange);

#pragma mark - action other
@property (nonatomic,readonly) WJSAction *(^removeFromParent)(void);
@property (nonatomic,readonly) WJSAction *(^unhide)(void);
@end
