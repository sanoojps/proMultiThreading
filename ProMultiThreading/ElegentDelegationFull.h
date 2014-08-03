//
//  ElegentDelegationFull.h
//  ProMultiThreading
//
//  Created by mar Jinn on 6/2/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElegentDelegationFull : NSProxy

{
    id _proxiedObject;
    BOOL _justResponded;
    BOOL _logOnNoResponse;
    
}

-(void)forwardInvocation:(NSInvocation *)invocation;

/**
 *  getter and setter for _proxiedObject
 */
-(id)proxiedObject;
-(void)setProxiedObject:(id)proxied;

/**
 *  getter  for _justResponded
 */
-(BOOL)justResponded;

/**
 *  getter and setter for _logOnNoResponse
 */
-(BOOL)logOnNoResponse;
-(void)setLogOnNoResponse:(BOOL)log;

@end



@interface Gonk : NSObject

{
    ElegentDelegationFull* _delegate;
}

-(void)setDelegate:(id)delegate;
-(id)delegate;

-(void)somethingHappened;



@end