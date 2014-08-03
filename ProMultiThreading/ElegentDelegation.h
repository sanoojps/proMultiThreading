//
//  ElegentDelegation.h
//  ProMultiThreading
//
//  Created by mar Jinn on 5/31/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ElegentDelegation : NSObject

@end


@interface MDelegateManager : NSProxy
{
    id _proxiedObject;
    BOOL _justResponded;
    BOOL _logOnNoResponse;
}

-(void)forwardInvocation:(NSInvocation *)invocation;

-(id)proxiedObject;
-(void)setProxiedObject:(id)proxied;

-(BOOL)justResponded;

-(BOOL)logOnNoResponse;
-(void)setLogOnNoResponse:(BOOL)log;

@end