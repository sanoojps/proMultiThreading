//
//  TargetPRoxy.h
//  ProMultiThreading
//
//  Created by mar Jinn on 5/21/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TargetPRoxy : NSProxy
{
    id realObjectOne;
    id realObjectTwo;
}

-(id)initWithTargetOne:(id)targetOne targetTwo:(id)targetTwo;

@end
