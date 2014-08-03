//
//  LearningARC.m
//  ProMultiThreading
//
//  Created by mar Jinn on 8/2/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "LearningARC.h"

@implementation LearningARC
//-(void)v_oid
//{
//    {
//        id __strong obj = nil;
//        obj = [NSMutableArray array];
//    }
//    /**
//     * Equivalent ASSEMBLY for x86-64
//     * 
//     * 
//     * "-[LearningARC v_oid]":                 ## @"\01-[LearningARC v_oid]"
//     .cfi_startproc
//     Lfunc_begin0:
//     .loc	1 12 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:12:0
//     ## BB#0:
//     pushq	%rbp
//     Ltmp2:
//     .cfi_def_cfa_offset 16
//     Ltmp3:
//     .cfi_offset %rbp, -16
//     movq	%rsp, %rbp
//     Ltmp4:
//     .cfi_def_cfa_register %rbp
//     subq	$32, %rsp
//     movq	%rdi, -8(%rbp)
//     movq	%rsi, -16(%rbp)
//     .loc	1 15 0 prologue_end     ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:15:0
//     Ltmp5:
//     movq	$0, -24(%rbp)
//     .loc	1 16 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:16:0
//     movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rsi
//     movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rdi
//     movq	%rdi, -32(%rbp)         ## 8-byte Spill
//     movq	%rsi, %rdi
//     movq	-32(%rbp), %rsi         ## 8-byte Reload
//     callq	_objc_msgSend
//     movq	%rax, %rdi
//     callq	_objc_retainAutoreleasedReturnValue
//     movq	-24(%rbp), %rdi
//     movq	%rax, -24(%rbp)
//     callq	_objc_release
//     leaq	-24(%rbp), %rdi
//     movabsq	$0, %rsi
//     .loc	1 17 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:17:0
//     callq	_objc_storeStrong
//     Ltmp6:
//     .loc	1 19 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:19:0
//     addq	$32, %rsp
//     popq	%rbp
//     ret
//     Ltmp7:
//     Lfunc_end0:
//     .cfi_endproc
//     */
//    /*
//     * SKIPPING REGISTER MOVEMENT AND SWAPS
//     * LOOKING ONLY AT callq - for x86 assembly
//     * i.e the assembly functions that are being called
//     * These functions are part of objc runtime
//     * All part of x86-64.S version of objc-runtime messaging code 
//     * message.h being its public header
//     *
//     * Also ".loc" part of the assembly 
//     * probably indicates the line in the objc source - without preprocessing
//     *   
//     
//            callq	_objc_msgSend
//     
//            callq	_objc_retainAutoreleasedReturnValue
//    
//            callq	_objc_release
//     
//            callq	_objc_storeStrong
//     */
//}
/*
 pseudo code by the compiler
        id obj = objc_msgSend(NSMutableArray, @selector(array));
        objc_retainAutoreleasedReturnValue(obj);
        objc_release(obj);
 */


//+(NSMutableArray*)array
//{
//    {
//        return [[NSMutableArray alloc]init];
//    }
//    /*
//     * 	.align	4, 0x90
//     "+[LearningARC array]":                 ## @"\01+[LearningARC array]"
//     .cfi_startproc
//     Lfunc_begin0:
//     .loc	1 88 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:88:0
//     ## BB#0:
//     pushq	%rbp
//     Ltmp2:
//     .cfi_def_cfa_offset 16
//     Ltmp3:
//     .cfi_offset %rbp, -16
//     movq	%rsp, %rbp
//     Ltmp4:
//     .cfi_def_cfa_register %rbp
//     subq	$32, %rsp
//     ##DEBUG_VALUE: +[LearningARC array]:self <- undef
//     ##DEBUG_VALUE: +[LearningARC array]:_cmd <- undef
//     movq	%rdi, -8(%rbp)
//     movq	%rsi, -16(%rbp)
//     .loc	1 91 0 prologue_end     ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:91:0
//     Ltmp5:
//     movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rdi
//     movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
//     movq	_objc_msgSend@GOTPCREL(%rip), %rax
//     movq	%rax, -24(%rbp)         ## 8-byte Spill
//     callq	*%rax
//     movq	L_OBJC_SELECTOR_REFERENCES_2(%rip), %rsi
//     movq	%rax, %rdi
//     movq	-24(%rbp), %rax         ## 8-byte Reload
//     callq	*%rax
//     Ltmp6:
//     .loc	1 94 0                  ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:94:0
//     movq	%rax, %rdi
//     addq	$32, %rsp
//     popq	%rbp
//     jmp	_objc_autoreleaseReturnValue ## TAILCALL
//     Ltmp7:
//     Lfunc_end0:
//     .cfi_endproc
//     
//     
//     * Dont really understand why callq isnt used 
//     * instead movq is used
//     
//     movq	_objc_msgSend@GOTPCREL(%rip), %rax
//     jmp	_objc_autoreleaseReturnValue ## TAILCALL
//     
//     */
//    
//    /*
//    * pseudo code by the compiler
//     
//     + (id) array
//    {
//        id obj = objc_msgSend(NSMutableArray, @selector(alloc)); 
//            objc_msgSend(obj, @selector(init));
//        return objc_autoreleaseReturnValue(obj);
//    }
//     */
//}

//-(void)weakVoid
//{
//    id __strong obj = nil;
//    obj = [NSMutableArray array];
//    id __weak obj1 = nil;
//    obj1 = obj;
//    /* returns an error 
//     * The current deployment target does not support automated __weak references
//     * OS X 10.6
//     * moving to 10.9 fixes this
//     */
//    
//    /*
//     ASSEMBLY
//     
//     "-[LearningARC weakVoid]":              ## @"\01-[LearningARC weakVoid]"
//     .cfi_startproc
//     Lfunc_begin0:
//     .loc	1 162 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:162:0
//     ## BB#0:
//     pushq	%rbp
//     Ltmp2:
//     .cfi_def_cfa_offset 16
//     Ltmp3:
//     .cfi_offset %rbp, -16
//     movq	%rsp, %rbp
//     Ltmp4:
//     .cfi_def_cfa_register %rbp
//     subq	$48, %rsp
//     movq	%rdi, -8(%rbp)
//     movq	%rsi, -16(%rbp)
//     .loc	1 164 0 prologue_end    ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:164:0
//     Ltmp5:
//     movq	$0, -24(%rbp)
//     .loc	1 165 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:165:0
//     movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rsi
//     movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rdi
//     movq	%rdi, -40(%rbp)         ## 8-byte Spill
//     movq	%rsi, %rdi
//     movq	-40(%rbp), %rsi         ## 8-byte Reload
//     callq	_objc_msgSend
//     movq	%rax, %rdi
//     callq	_objc_retainAutoreleasedReturnValue
//     movq	-24(%rbp), %rdi
//     movq	%rax, -24(%rbp)
//     callq	_objc_release
//     leaq	-32(%rbp), %rdi
//     Ltmp6:
//     ##DEBUG_VALUE: -[LearningARC weakVoid]:obj1 <- RDI
//     .loc	1 166 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:166:0
//     movq	$0, -32(%rbp)
//     .loc	1 167 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:167:0
//     movq	-24(%rbp), %rsi
//     callq	_objc_storeWeak
//     leaq	-32(%rbp), %rdi
//     Ltmp7:
//     .loc	1 173 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:173:0
//     movq	%rax, -48(%rbp)         ## 8-byte Spill
//     callq	_objc_destroyWeak
//     leaq	-24(%rbp), %rdi
//     movabsq	$0, %rsi
//     callq	_objc_storeStrong
//     addq	$48, %rsp
//     popq	%rbp
//     ret
//     Ltmp8:
//     Lfunc_end0:
//     .cfi_endproc
//     
//     */
//    
//    /*
//     * RELEVANT CODE
//     *
//     *      callq	_objc_msgSend
//            callq	_objc_retainAutoreleasedReturnValue
//            callq	_objc_release
//            callq	_objc_storeWeak
//            callq	_objc_destroyWeak  //Called at line 173 where the scope ends
//            callq	_objc_storeStrong
//     */
//    
//    /* pseudo code by the compiler  
//        id obj1;
//        objc_initWeak(&obj1, obj);
//        objc_destroyWeak(&obj1);
//     */
//    
//}

-(void)weakToStrong
{
    id volatile __weak obj = nil;
    obj = [[NSObject alloc]init];
}
/*
 *  "-[LearningARC weakToStrong]":          ## @"\01-[LearningARC weakToStrong]"
 .cfi_startproc
 .cfi_personality 155, ___objc_personality_v0
 Leh_func_begin0:
 .cfi_lsda 16, Lexception0
 Lfunc_begin0:
 .loc	1 252 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:252:0
 ## BB#0:
 pushq	%rbp
 Ltmp7:
 .cfi_def_cfa_offset 16
 Ltmp8:
 .cfi_offset %rbp, -16
 movq	%rsp, %rbp
 Ltmp9:
 .cfi_def_cfa_register %rbp
 subq	$80, %rsp
 ##DEBUG_VALUE: -[LearningARC weakToStrong]:self <- undef
 ##DEBUG_VALUE: -[LearningARC weakToStrong]:_cmd <- undef
 movq	%rdi, -8(%rbp)
 movq	%rsi, -16(%rbp)
 .loc	1 254 0 prologue_end    ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:254:0
 Ltmp10:
 movq	$0, -24(%rbp)
 .loc	1 255 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:255:0
 movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rdi
 movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rsi
 Ltmp0:
 movq	_objc_msgSend@GOTPCREL(%rip), %rax
 callq	*%rax
 Ltmp1:
 movq	%rax, -48(%rbp)         ## 8-byte Spill
 jmp	LBB0_1
 LBB0_1:
 movq	L_OBJC_SELECTOR_REFERENCES_2(%rip), %rsi
 Ltmp2:
 movq	_objc_msgSend@GOTPCREL(%rip), %rax
 movq	-48(%rbp), %rdi         ## 8-byte Reload
 callq	*%rax
 Ltmp3:
 movq	%rax, -56(%rbp)         ## 8-byte Spill
 jmp	LBB0_2
 LBB0_2:
 leaq	-24(%rbp), %rdi
 movq	-56(%rbp), %rax         ## 8-byte Reload
 movq	%rax, %rcx
 movq	%rcx, %rsi
 movq	%rax, -64(%rbp)         ## 8-byte Spill
 callq	_objc_storeWeak
 movq	-64(%rbp), %rcx         ## 8-byte Reload
 movq	%rcx, %rdi
 movq	%rax, -72(%rbp)         ## 8-byte Spill
 callq	_objc_release
 leaq	-24(%rbp), %rdi
 .loc	1 256 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:256:0
 callq	_objc_destroyWeak
 addq	$80, %rsp
 popq	%rbp
 ret
 LBB0_3:
 Ltmp4:
 leaq	-24(%rbp), %rdi
 .loc	1 255 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:255:0
 movl	%edx, %ecx
 movq	%rax, -32(%rbp)
 movl	%ecx, -36(%rbp)
 .loc	1 256 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:256:0
 callq	_objc_destroyWeak
 ## BB#4:
 movq	-32(%rbp), %rdi
 callq	__Unwind_Resume
 Ltmp11:
 Lfunc_end0:

 */

/*
 movq	_objc_msgSend@GOTPCREL(%rip), %rax
 movq	_objc_msgSend@GOTPCREL(%rip), %rax
 callq	_objc_storeWeak
 callq	_objc_release
 callq	_objc_destroyWeak
 callq	_objc_destroyWeak
 */

-(void)unsafeToStrong
{
    id __unsafe_unretained obj = nil;
    obj = [[NSObject alloc]init];
}
/*
 "-[LearningARC unsafeToStrong]":        ## @"\01-[LearningARC unsafeToStrong]"
 .cfi_startproc
 Lfunc_begin1:
 .loc	1 343 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:343:0
 ## BB#0:
 pushq	%rbp
 Ltmp14:
 .cfi_def_cfa_offset 16
 Ltmp15:
 .cfi_offset %rbp, -16
 movq	%rsp, %rbp
 Ltmp16:
 .cfi_def_cfa_register %rbp
 subq	$32, %rsp
 movq	%rdi, -8(%rbp)
 movq	%rsi, -16(%rbp)
 .loc	1 345 0 prologue_end    ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:345:0
 Ltmp17:
 movq	$0, -24(%rbp)
 .loc	1 346 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:346:0
 movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rsi
 movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rdi
 movq	%rdi, -32(%rbp)         ## 8-byte Spill
 movq	%rsi, %rdi
 movq	-32(%rbp), %rsi         ## 8-byte Reload
 callq	_objc_msgSend
 movq	L_OBJC_SELECTOR_REFERENCES_2(%rip), %rsi
 movq	%rax, %rdi
 callq	_objc_msgSend
 movq	%rax, %rsi
 movq	%rsi, -24(%rbp)
 movq	%rax, %rdi
 callq	_objc_release
 .loc	1 347 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:347:0
 addq	$32, %rsp
 popq	%rbp
 ret
 Ltmp18:
 Lfunc_end1:
 .cfi_endproc
 */

/*
 callq	_objc_msgSend
 callq	_objc_msgSend
 callq	_objc_release
 */


-(void)varNotAssigned
{
    (void)[[NSObject alloc]init];
}
/*
 "-[LearningARC varNotAssigned]":        ## @"\01-[LearningARC varNotAssigned]"
 .cfi_startproc
 Lfunc_begin2:
 .loc	1 398 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:398:0
 ## BB#0:
 pushq	%rbp
 Ltmp21:
 .cfi_def_cfa_offset 16
 Ltmp22:
 .cfi_offset %rbp, -16
 movq	%rsp, %rbp
 Ltmp23:
 .cfi_def_cfa_register %rbp
 subq	$32, %rsp
 movq	%rdi, -8(%rbp)
 movq	%rsi, -16(%rbp)
 .loc	1 400 0 prologue_end    ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:400:0
 Ltmp24:
 movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rsi
 movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rdi
 movq	%rdi, -24(%rbp)         ## 8-byte Spill
 movq	%rsi, %rdi
 movq	-24(%rbp), %rsi         ## 8-byte Reload
 callq	_objc_msgSend
 movq	L_OBJC_SELECTOR_REFERENCES_2(%rip), %rsi
 movq	%rax, %rdi
 callq	_objc_msgSend
 movq	%rax, %rdi
 callq	_objc_release
 .loc	1 401 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:401:0
 addq	$32, %rsp
 popq	%rbp
 ret
 Ltmp25:
 Lfunc_end2:
 .cfi_endproc

 */

/*
 callq	_objc_msgSend
 callq	_objc_msgSend
 callq	_objc_release

 */
-(void)varNotAssignedWithMethodCall
{
    (void)[[[NSObject alloc]init]hash];
}
/*
 "-[LearningARC varNotAssignedWithMethodCall]": ## @"\01-[LearningARC varNotAssignedWithMethodCall]"
 .cfi_startproc
 Lfunc_begin3:
 .loc	1 448 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:448:0
 ## BB#0:
 pushq	%rbp
 Ltmp28:
 .cfi_def_cfa_offset 16
 Ltmp29:
 .cfi_offset %rbp, -16
 movq	%rsp, %rbp
 Ltmp30:
 .cfi_def_cfa_register %rbp
 subq	$48, %rsp
 movq	%rdi, -8(%rbp)
 movq	%rsi, -16(%rbp)
 .loc	1 450 0 prologue_end    ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:450:0
 Ltmp31:
 movq	L_OBJC_CLASSLIST_REFERENCES_$_(%rip), %rsi
 movq	L_OBJC_SELECTOR_REFERENCES_(%rip), %rdi
 movq	%rdi, -24(%rbp)         ## 8-byte Spill
 movq	%rsi, %rdi
 movq	-24(%rbp), %rsi         ## 8-byte Reload
 callq	_objc_msgSend
 movq	L_OBJC_SELECTOR_REFERENCES_2(%rip), %rsi
 movq	%rax, %rdi
 callq	_objc_msgSend
 movq	L_OBJC_SELECTOR_REFERENCES_4(%rip), %rsi
 movq	%rax, %rdi
 movq	%rax, -32(%rbp)         ## 8-byte Spill
 callq	_objc_msgSend
 movq	-32(%rbp), %rsi         ## 8-byte Reload
 movq	%rsi, %rdi
 movq	%rax, -40(%rbp)         ## 8-byte Spill
 callq	_objc_release
 .loc	1 451 0                 ## /Users/marjinn/Dropbox/NewBeginnings/OBJ_BEG_TO/ProMultiThreading/ProMultiThreading/LearningARC.m:451:0
 addq	$48, %rsp
 popq	%rbp
 ret
 Ltmp32:
 Lfunc_end3:
 .cfi_endproc
 */

/*
 callq	_objc_msgSend
 callq	_objc_msgSend
 callq	_objc_msgSend
 callq	_objc_release
 
 */

@end
