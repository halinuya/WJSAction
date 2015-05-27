//
//  MyScene.m
//  WJSActionDemo
//
//  Created by James wu on 15/5/21.
//  Copyright (c) 2015年 James wu. All rights reserved.
//

#import "MyScene.h"
#import "WJSAction.h"

@interface MyScene ()
@property (nonatomic,strong) SKSpriteNode *sprite;

@end

@implementation MyScene
- (id)initWithSize:(CGSize)size
{
    self = [super initWithSize:size];
    if (self) {
        self.sprite = [[SKSpriteNode alloc] initWithColor:[UIColor greenColor] size:CGSizeMake(50, 50)];
        [self.sprite setPosition:CGPointMake(50, 50)];
        [self addChild:self.sprite];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKAction *move = [SKAction moveBy:CGVectorMake(100, 0) duration:1];
    SKAction *move2 =[SKAction moveBy:CGVectorMake(0, 100) duration:1];
    SKAction *move3 = [SKAction moveBy:CGVectorMake(-50, 0) duration:1];
    SKAction *move4 = [SKAction moveBy:CGVectorMake(0, 100) duration:1];
    SKAction *seq = [SKAction sequence:@[move,move2,move3,move4]];
    [self.sprite runAction:seq completion:^{
        [self.sprite runAction:[WJSACTION.SeqStart().moveByV(CGVX(100),1).moveByV(CGVY(100),1).moveByV(CGVX(-50),1).moveByV(CGVY(100),1).SeqEnd() reversedAction]];
    }];
    
    
}


@end
