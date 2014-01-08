//
//  ViewController.m
//  Ex225_ex17
//
//  Created by SDT-1 on 2014. 1. 8..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (IBAction)series:(id)sender {
    //연속 애니메이션
    [self rotate:nil];
    //delay 따로
    [self performSelector:@selector(combination:) withObject:nil afterDelay:0.7];
}

//원상복귀
- (IBAction)setOriginal:(id)sender {
    [UIView beginAnimations:@"original" context:nil];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformIdentity;
    
    [UIView commitAnimations];
    
   }

//두개의 트랜스폼 결합
- (IBAction)combination:(id)sender {
    CGAffineTransform t1 = CGAffineTransformMakeScale(1.2, 1.2);
    CGAffineTransform t2 = CGAffineTransformMakeTranslation(30, 30);
    CGAffineTransform comb = CGAffineTransformConcat(t1, t2);
    CGAffineTransform t = CGAffineTransformConcat(self.imageView.transform, comb);
    
    [UIView beginAnimations:@"id_move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = t;
    
    [UIView commitAnimations];
   
}

- (IBAction)rotate:(id)sender {
    [UIView beginAnimations:@"id_rotate" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.7];
    
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
    
    [UIView commitAnimations];
   }

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end