//
//  ElegentDelegation.m
//  ProMultiThreading
//
//  Created by mar Jinn on 5/31/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "ElegentDelegation.h"

/**
 *  RULES OF DELEGATION
 *  
 *   Some tips:
 
 * Use delegation to indicate a change of object state which is relatively frequent. Don't include the -kitchenSink: method.
 * Pass the delegate as many arguments as it needs to be able to discern the new event from past events, but no more. (Keep it simple.)
 * A delegate method should only have to return something if an immediate decision is required.
 * Pass the delegate the caller object using self as the first argument so that a single object can handle multiple instances of your object through delegation.
 * Create an informal protocol on NSObject to alleviate compiler warnings. The informal protocol should include all possible delegation methods.
 * The first fragment of the delegate method name should be a reduced version of the object; for example, object NSTableView has delegate methods that look like tableView:... This prevents method name conflicts and is the best place to pass self.
 */

@implementation ElegentDelegation

@end


@interface NSMethodSignature (objctypes)
+(NSMethodSignature*)signatureWithObjCTypes:(const char *)types;
@end

@implementation MDelegateManager

-(instancetype)init
{
    /**
     *  no super calls as NSProxy does not implement init
     */
    
    self->_proxiedObject      = nil;
    self->_justResponded      = NO;
    self->_logOnNoResponse    = NO;
    
    return self;
}

/*
    MESSAGE PASSING
    ---------------
    
 http://stackoverflow.com/questions/4574465/objective-c-respondstoselector-question/4574563#4574563
 First of all, the name of a method (its selector) includes all subparts and colon characters, as mvds said.
 
 Second of all, the method -respondsToSelector: is not called by the runtime, it's usually called by the user (yourself or APIs that want to know if a delegate, for example, responds to an optional method of the protocol).
 
 When you send a message to an object, the runtime will look for the implementation of the method in the class of the object (through the object's isa pointer). It's equivalent to sending -respondsToSelector: although the message itself is not dispatched. If the implementation of the method is found in the class or in its superclasses, it's called with all the arguments you passed in.
 
 If not, then the runtime gives the message a second chance to be executed. It will start by sending the message + (BOOL)resolveInstanceMethod:(SEL)name to the class of the object: this method allows you to add the method at runtime to the class: if this message returns YES, it means it can redispatch the message.
 
 If not it gives the message a third chance to be executed, it sends - (id)forwardingTargetForSelector:(SEL)aSelector with the selector, this method can return another object that may be able to respond to the selector on behalf of the actual receiver, if the returned object can respond, the method is executed and the value is returned as if it was returned by the original message. (Note: This is available beginning with OS X 10.6 or iOS 4.)
 
 If the returned object is nil or self (to avoid infinite loops), the runtime gives the message a fourth chance to execute the method… It sends the message - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector to get a method signature in order to build an invocation. If one is provided then an invocation is sent through the message - (void)forwardInvocation:(NSInvocation *)anInvocation. In this method you can parse the invocation and build other messages to send to other targets in any ways you want, and then you can set the return value of the invocation… That value will act as the return value of the original message.
 
 Finally, if no method signature is returned by the object, then the runtime sends the message - (void)doesNotRecognizeSelector:(SEL)aSelector to your object, the implementation of this method in NSObject class throws an exception.
 
 https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/nsobject_Class/Reference/Reference.html#jumpTo_42
 */



/*
 -methodSignatureForSelector is called when a compiled definition for the selector cannot be found.
 */
-(NSMethodSignature*)methodSignatureForSelector:(SEL)sel
{
    /**
     *  get method signature for the passed in selector
     */
    NSMethodSignature* sig = nil;
    sig = [[self->_proxiedObject class] instanceMethodSignatureForSelector:sel];
    
    if (sig == nil)
    {
        /**
         *  appears to be values fornm @encode function
         * -methodSignatureForSelector is called when a compiled definition for the selector cannot be found. This is where we use the secret, undocumented method to create our own dud NSMethodSignature. This is necessary because if this method returns nil, a selector not found exception is raised. The string argument to -signatureWithObjCTypes: outlines the return type and arguments to the message. To return a dud NSMethodSignature, pretty much any signature will suffice. Since the -forwardInvocation call will do nothing if the delegate does not respond to the selector, the dud NSMethodSignature simply gets us around the exception.
         *
         */
        
        /**
         *  It appears any signature would suffice
         *  NEED to experiment with @encode(const char *)
         */
        sig = [NSMethodSignature signatureWithObjCTypes:(const char *)"@^v^c"];
    }
    
    self->_justResponded = NO;
    
    return sig;
}

/**
When an object is sent a message which it does not implement, it is given a chance to respond through the -methodSignatureForSelector: and -forwardInvocation: methods. -methodSignatureForSelector: must return the NSMethodSignature associated with the selector. In the delegation case, the signature is retrieved from the delegate. -forwardInvocation: is then given the opportunity to send the message to the correct object.
 */
-(void)forwardInvocation:(NSInvocation *)invocation
{
    if (_proxiedObject == nil)
    {
        if (_logOnNoResponse == YES)
        {
            NSLog(@"Warning : proxiedObject os nil! This is a debugging message ");
            return;
        }
    }
    
    if ([_proxiedObject respondsToSelector:[invocation selector]])
    {
        [invocation invokeWithTarget:_proxiedObject];
        _justResponded = YES;
    }
    
    else if (_logOnNoResponse)
    {
        NSLog(@"Object \"%@\" failed to respond to delegate message \"%@\"! This is debuggoing message.",
              [self->_proxiedObject class],
              NSStringFromSelector([invocation selector])
              );
        
        
    }
    
    return;
}

/**
 *  GETTERS AND SETTERS
 *
 */
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
@end