//
//  TargetPRoxy.m
//  ProMultiThreading
//
//  Created by mar Jinn on 5/21/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "TargetPRoxy.h"

@implementation TargetPRoxy

-(id)initWithTargetOne:(id)targetOne targetTwo:(id)targetTwo
{
    self->realObjectOne = targetOne;
    self->realObjectTwo = targetTwo;
    
    return self;
}

-(void)dealloc
{
    self->realObjectOne = nil;
    self->realObjectTwo = nil;
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)sel
{
    NSMethodSignature* sig;
    
    sig =  [self->realObjectOne methodSignatureForSelector:sel];
    
    if (sig)
    {
        return sig;
    }
    
    sig = [self->realObjectTwo methodSignatureForSelector:sel];
    
    return sig;
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    id target;
    target =
    [self->realObjectOne methodSignatureForSelector:[invocation selector]] ?
    self->realObjectOne :
    self->realObjectTwo ;
}

-(BOOL)respondsToSelector:(SEL)aSelector
{
    if ([self->realObjectOne respondsToSelector:aSelector])
    {
        return YES;
    }
    
    if ([self->realObjectTwo respondsToSelector:aSelector])
    {
        return YES;
    }
    
    
    
    return NO;
}


@end
