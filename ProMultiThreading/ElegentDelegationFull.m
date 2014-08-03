//
//  ElegentDelegationFull.m
//  ProMultiThreading
//
//  Created by mar Jinn on 6/2/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "ElegentDelegationFull.h"

@implementation ElegentDelegationFull


-(id)proxiedObject
{
	return _proxiedObject;
}

-(void)setProxiedObject:(id)proxied
{
	_proxiedObject=proxied; //do not retain- could create circular references
}

-(BOOL)justResponded
{
	return _justResponded;
}

-(void)setLogOnNoResponse:(BOOL)log
{
	_logOnNoResponse=log;
}

-(BOOL)logOnNoResponse
{
	return _logOnNoResponse;
}

-(id)init
{
	_proxiedObject=nil;
	_justResponded=NO;
	_logOnNoResponse=NO;
	return self;
}

-(NSMethodSignature*)methodSignatureForSelector:(SEL)selector
{
	NSMethodSignature *sig;
	sig=[[_proxiedObject class] instanceMethodSignatureForSelector:selector];
	if(sig==nil)
	{
        NSString *typesNS = [NSString stringWithFormat: @"%s%s%s",
                             @encode(id),
                             @encode(id), @encode(id)]
                             ;
        
        const char *typesC = [typesNS UTF8String];
		
        sig=[NSMethodSignature signatureWithObjCTypes:"^v@^c"];
	}
	_justResponded=NO;
	return sig;
}

-(void)forwardInvocation:(NSInvocation*)invocation
{
	if(_proxiedObject==nil)
	{
		if(_logOnNoResponse)
			NSLog(@"Warning: proxiedObject is nil! This is a debugging message!");
		return;
	}
	if([_proxiedObject respondsToSelector:[invocation selector]])
	{
		[invocation invokeWithTarget:_proxiedObject];
		_justResponded=YES;
	}
	else if(_logOnNoResponse)
	{
		NSLog(@"Object \"%@\" failed to respond to delegate message \"%@\"! This is a debugging message.",[[self proxiedObject] class],NSStringFromSelector([invocation selector]));
	}
	return;
}



@end


/**
 *  A new informal protocol ...extends the ElegentDelegationFull
 */

@interface ElegentDelegationFull (GonkDelegate)

-(void)gonk:(Gonk*)gonk somethingHappened:(BOOL)continue_;

@end

@implementation Gonk

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self->_delegate = [[ElegentDelegationFull alloc]init];
        
        [self->_delegate setLogOnNoResponse:YES];
    }
    return self;
}

-(void)setDelegate:(id)delegate
{
    [self->_delegate setProxiedObject:delegate];
}

-(id)delegate
{
    return [self->_delegate proxiedObject];
}


-(void)somethingHappened
{
    [_delegate gonk:(Gonk*)self somethingHappened:YES];
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end
