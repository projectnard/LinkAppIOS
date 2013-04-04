//
//  ViewController.m
//  linkApp
//
//  Created by Ryan Mord on 3/14/13.
//  Copyright (c) 2013 Ryan Mord. All rights reserved.
//

#import "Scrollview.h"

@implementation CLScrollview
@synthesize customDelegate;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self.customDelegate respondsToSelector:@selector(userTouch)]) {
        [self.customDelegate userTouch];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self.customDelegate respondsToSelector:@selector(userDrag)]) {
        [self.customDelegate userDrag];
    }
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    
	if (!self.dragging) {
		[self.nextResponder touchesEnded: touches withEvent:event];
	}
	[super touchesEnded: touches withEvent: event];
    
    if ([self.customDelegate respondsToSelector:@selector(userEndTouch)]) {
        [self.customDelegate userEndTouch];
    }
}

@end