//
//  main.m
//  ProMultiThreading
//
//  Created by mar Jinn on 5/21/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TargetPRoxy.h"
#import <stdio.h>
#import <stdlib.h>
///// A pointer to the function of a method implementation.
//#if !OBJC_OLD_DISPATCH_PROTOTYPES
//typedef void (*IMP)(void /* id, SEL, ... */ );
//#else
//typedef id (*IMP)(id, SEL, ...);
//#endif

/*
 
 - (int)foo:(NSString *)str
 
 int result = [obj foo:@"hello"];
 
 convertedTo
 
 int foo(id self ,SEL _cmd,NSString* str);
 
 functionPointer to the aboveFun
 
 objc_msgSend
 ------------
 id objc_msgSend(id self, SEL op, ...)
 
 //int result = ((int (*)(id, SEL, NSString *))objc_msgSend)(@"obj", @selector(description), @"hello");
 
 
 
 */




int foo(id self ,SEL _cmd,NSString* str);

/* returnedFunctionsReturnType(*thisfunctionName (thisFunctions's input params )) ( returnedFunctions input Parameters )*/

/*  (int (*) (id,SEL,NSString*)) */
int (*funcReturningFuncP (void)) (id,SEL,NSString*)
{
    return (int (*) (id,SEL,NSString*)) &foo;
}


int foo(id self ,SEL _cmd,NSString* str)
{
    return INT_MAX;
}

void inVokeTheFuncThatReturnsAFuncPointer (void)
{
    int (*Blue) (id,SEL,NSString*)  = NULL; /* a var of type " (int (*) (id,SEL,NSString*)) " */
    
    Blue = &foo;
    
    int result = 0;
    
    /**
     * Since Blue is of type "(int (*) (id,SEL,NSString*))"
     * to invoke Blue  or dereference it
     
     */
    //result =  (* (int (*) (id,SEL,NSString*))Blue) (@"self",@selector(description),@"holla");
    
    /**
     * if you simple case " (int (*) (id,SEL,NSString*))" to Blue while invoking
     * you get 
     * Cast to 'int (*)(__strong id, SEL, NSString *__strong)' from smaller integer type 'int'
     */
    //result = (int (*) (id,SEL,NSString*))Blue (@"self",@selector(description),@"holla") ;
    
    /**
     *  So you include Blue within parantheses as well
     *  This is bcos Blue when invoked basically returns an "int" and result expects that 
     * Hence the message
     * Cast to 'int (*)(__strong id, SEL, NSString *__strong)' from smaller integer type 'int'
     */
    
     result = ((int (*) (id,SEL,NSString*))Blue) (@"self",@selector(description),@"holla") ;
    
    /**
     *  The very same can be achieved by
     * Here we are dereferencing the functionPointer ie. *Blue 
     *  For instance
     * (lldb) po *Blue(@"self",@selector(description),@"holla")
                    error: indirection requires pointer operand ('int' invalid)
                    error: 1 errors parsing expression
        (lldb) po (*Blue)(@"self",@selector(description),@"holla")
                    2147483647
     *  Why ?
     * bcos Blue is a pointer to a function that returns "int" Hence Blue as a whole (Blue) is "int" 
     * So the following works
     
     *  (lldb) po Blue
                (ProMultiThreading`foo at main.m:52)
     
        (lldb) po Blue(@"self",@selector(description),@"holla")
                2147483647
     
     Blue is of type "(int (*) (id,SEL,NSString*)"  *Blue invokes a function that returns "int"
     
     */
    result = (* (int (*) (id,SEL,NSString*))Blue) (@"self",@selector(description),@"holla");
    
}


/**
 *  ObjC message send test
 */

#include <Cocoa/Cocoa.h>
#import "ElegentDelegationFull.h"
#define SECONDS 4
@interface Foo : NSObject
{
@public
    unsigned val;
}
- (void)increment;
@end

@implementation Foo : NSObject
- (void)increment
{
    val++;
}

-(void)gonk:(Gonk*)gonk somethingHappened:(BOOL)continue_
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
}

@end

Foo* gFoo;

void signal_handler(int signal)
{
    printf("%d\n", gFoo->val / SECONDS);
    exit(0);
}

void sigkill_signal_handler(int signal)
{
    printf("%d\n", signal);
    
    NSLog(@"%@",[NSThread callStackSymbols]);
    
    exit(0);
}



int main(int argc, const char * argv[])
{

    inVokeTheFuncThatReturnsAFuncPointer();
    
    /*
    Foo* foo = [[Foo alloc] init];
    gFoo = foo;
    signal(SIGALRM, signal_handler);
    alarm(SECONDS);
    for (;;)
    {
        [foo increment];
    }
     */
    
   

    /**
     *  PROXY DELEGATE
     */
    Gonk* gonk = nil;
    gonk = [Gonk new];
    
    Foo* fooder = nil;
    fooder = [Foo new];
    
    [gonk setDelegate:(id)fooder];
    
    [gonk somethingHappened];
    
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        /**
         *  Alloc and retain count
         */
        struct objc_layout
        {
            NSUInteger retained;
        };
        
        int size = INT_MIN;
        size = 2 * sizeof(struct objc_layout);
        
        struct objc_layout* p = NULL;
        p = calloc(1, size);
        
        printf("\n%lu\n",(unsigned long)p->retained);
    
        
        
        
        
        NSMutableString* string = nil;
        string = [NSMutableString new];
        NSLog(@"string reference count = %ld",
              CFGetRetainCount((__bridge CFTypeRef) string));

        
        NSMutableString* stringTmp = nil;
        stringTmp = [NSMutableString string];
        NSLog(@"stringTmp reference count = %ld",
              CFGetRetainCount((__bridge CFTypeRef) string));

        NSMutableArray* array = nil;
        array  = [NSMutableArray array];
        
        id proxy = nil;
        proxy = [[TargetPRoxy alloc]initWithTargetOne:string targetTwo:array];
        
        [proxy appendString:@"This"];
        [proxy appendString:@"is "];
        
        [proxy addObject:string];
        
        [proxy appendString:@"a "];
        [proxy appendString:@"test!"];
        
        NSLog(@"count should be 1, it is : %lu", (unsigned long)[proxy count]);
        
        if ([[proxy objectAtIndex:0] isEqualToString:@"This is a test!"])
        {
            NSLog(@"Appending successful. '%@'",proxy);
        }
        else
        {
            NSLog(@"Appending failed, got: '%@'", proxy);
        }
        
        NSLog(@"Example finished without errors.");
        
        
        
        
        
        
        /*
         * Bridge __bridge cast
         * N0 change in ownership
         */
        id obj = nil;
        obj = [NSObject new];
        
        void* ptr = NULL;
        ptr = (__bridge void *)(obj);
        
        id o = nil;
        o = (__bridge id)(ptr);
        
        /**
         *  __bridge_retained
         * Both Objects have ownershio
         * prsent owner and previous owner
         */
        id obj_r = nil;
        obj_r = [NSObject new];
        
        void* ptr_r = NULL;
        ptr_r = (__bridge_retained void*)obj;
        
       id obj__R = 0;
        obj__R = (__bridge id)ptr_r;
        
        
        id __strong anObj = nil;
        anObj = [NSObject new];
        
        void* ptrToAnObject = NULL;
        ptrToAnObject = (__bridge void*)anObj;
        
        /**
         * __bridge_transfer OBJC type transfer of ownership
         * previous owner will be released
         * non-ARC
         *   id obj = (id)p;
         *   [obj retain]; 
         *   [(id)p release];
         */
        id newObjFromAnObj = nil;
        newObjFromAnObj = (__bridge_transfer id)ptrToAnObject;
        
        /**
         * CFBridgingReatin
         */
        CFMutableArrayRef cfObj = NULL;
        
        {
            id objc_obj = nil;
            objc_obj = [NSMutableArray new];
            
            cfObj = CFBridgingRetain(objc_obj);
            
            CFShow((CFTypeRef)cfObj);
            
            printf("retainCount = %ld\n",CFGetRetainCount(cfObj));
            
        }
        
        printf("retainCountAfterScope = %ld\n",CFGetRetainCount(cfObj));
        if(cfObj)
        {
                CFRelease(cfObj);
        }
        
        
        {
        /**
         * CFBridgingRelease
         */
        CFMutableArrayRef cfArrayM = NULL;
        cfArrayM =
        CFArrayCreateMutable
        (
         kCFAllocatorDefault,
         0,
         NULL
         );
        
        printf("retainCountForArray = %ld\n",CFGetRetainCount(cfArrayM));
        
        id objM = nil;
        objM =  CFBridgingRelease(cfArrayM);
        
        printf("retainCountForArray after the cast = %ld\n",CFGetRetainCount(cfArrayM));
        
        NSLog(@"class= %@",objM);
        
        }
        
        /**
         *  dynamic objc c-style array
         */
        id __strong * Darray = nil;
        Darray = (id __strong *)calloc(2, sizeof(id));
        
        Darray[0] = [NSObject new];
        Darray[1] = [NSObject new];
        
        for(NSUInteger i = 0; i < 2; i++)
        {
            Darray[i] = nil;
        }
        
        if (Darray)
        {
             free((void *)Darray);
        }
       
        
    }
    return 0;
}





