//
//  RBMMainVC.m
//  InteractiveTransitionDemo
//
//  Created by Rafael Bartolome on 19/06/14.
//  Copyright (c) 2014 www.rafaelbartolome.es. All rights reserved.
//

#import "RBMMainVC.h"
#import "KMPSettingsPopAnimationController.h"
#import "KMPSettingsPushAnimationController.h"
#import "RBMDestinationVC.h"

@interface RBMMainVC ()

@end

@implementation RBMMainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (IBAction)goButtonPressed:(id)sender {

    RBMDestinationVC *destinationVC = [[RBMDestinationVC alloc] init];
    [self.navigationController pushViewController:destinationVC animated:YES];
}

#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {


    if (operation == UINavigationControllerOperationPush) {

        if ( [fromVC isKindOfClass:[RBMMainVC class]] ) {
            return [[KMPSettingsPushAnimationController alloc] init];
        }

    }

    if (operation == UINavigationControllerOperationPop) {

        if ( [fromVC isKindOfClass:[RBMDestinationVC class]] ) {
            return [[KMPSettingsPopAnimationController alloc] initWithViewController:fromVC];
        }

    }

    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {

    UIPercentDrivenInteractiveTransition *transicionController = nil;


    if ([animationController isKindOfClass:[KMPSettingsPopAnimationController class]]) {

        if ([(RBMDestinationVC*)[(KMPSettingsPopAnimationController*)animationController masterVC] interactionInProgress]) {
            transicionController = [(RBMDestinationVC*)[(KMPSettingsPopAnimationController*)animationController masterVC] interactivePopTransition];
        }
        
    }
    
    
    return transicionController;
}





@end
