//
//  RBMDestinationVC.m
//  InteractiveTransitionDemo
//
//  Created by Rafael Bartolome on 19/06/14.
//  Copyright (c) 2014 www.rafaelbartolome.es. All rights reserved.
//

#import "RBMDestinationVC.h"

@interface RBMDestinationVC () {
     float _initialX;
}

@end

@implementation RBMDestinationVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        pan.maximumNumberOfTouches = 1;
        pan.minimumNumberOfTouches = 1;
        [self.view addGestureRecognizer: pan];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated: YES];
}

#pragma mark Gesture recognizer

- (CGFloat)completionSpeed {
    return 1 - self.interactivePopTransition.percentComplete;
}


-(void)handlePan:(UIPanGestureRecognizer *) pan {


    CGPoint translate = [pan translationInView:self.view];

    float distance = (_initialX - translate.x) *100 / self.view.frame.size.width; //(0-100)

    switch (pan.state) {
        case UIGestureRecognizerStateBegan: {
            self.interactivePopTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
            self.interactionInProgress = YES;
            [self.navigationController  popViewControllerAnimated:YES];
            _initialX = translate.x;
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGFloat percent = (distance/100);
            [self.interactivePopTransition updateInteractiveTransition:(percent < 0.0) ? 0.0 : percent];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            CGFloat percent = (distance/100);

            BOOL cancelled = (percent <= 0.3);
            if (cancelled) {
                self.interactionInProgress = NO;
                [self.interactivePopTransition cancelInteractiveTransition];
            } else {
                self.interactionInProgress = NO;
                [self.interactivePopTransition finishInteractiveTransition];
            }
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            CGFloat percent = (distance/100);
            BOOL cancelled = (percent <= 0.3);
            if (cancelled) {
                self.interactionInProgress = NO;
                [self.interactivePopTransition cancelInteractiveTransition];
            } else {
                self.interactionInProgress = NO;
                [self.interactivePopTransition finishInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }

    
}


@end
