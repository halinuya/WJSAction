//
//  ViewController.m
//  WJSActionDemo
//
//  Created by James wu on 15/5/21.
//  Copyright (c) 2015年 James wu. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import <SpriteKit/SpriteKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SKView *skView=(SKView *)self.view;
    
    MyScene *scene = [[MyScene alloc] initWithSize:skView.bounds.size];
    
    [skView presentScene:scene];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
