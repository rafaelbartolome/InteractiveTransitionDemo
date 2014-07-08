//
//  RBMDestinationVC.h
//  InteractiveTransitionDemo
//
//  Created by Rafael Bartolome on 19/06/14.
//  Copyright (c) 2014 www.rafaelbartolome.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBMDestinationVC : UIViewController <UINavigationControllerDelegate> {
    
}


@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@property (nonatomic, assign) BOOL interactionInProgress;
@end
