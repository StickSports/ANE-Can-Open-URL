//
//  CanOpenUrlIosExtension.m
//  CanOpenUrlIosExtension
//
//  Created by Richard Lord on 02/04/2012.
//  Copyright (c) 2012 Stick Sports Ltd. All rights reserved.
//

#import "FlashRuntimeExtensions.h"
#import <UIKit/UIKit.h>

#define DEFINE_ANE_FUNCTION(fn) FREObject (fn)(FREContext context, void* functionData, uint32_t argc, FREObject argv[])

DEFINE_ANE_FUNCTION( canOpenUrl )
{
    uint32_t length = 0;
    const uint8_t* urlParam = NULL;
    
    if( FREGetObjectAsUTF8( argv[0], &length, &urlParam ) != FRE_OK ) return NULL;
    NSString* url = [NSString stringWithUTF8String: (char*) urlParam];
    
    Boolean canOpen = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]];
    
    FREObject result;
    if( FRENewObjectFromBool( canOpen, &result ) == FRE_OK )
    {
        return result;
    }
    return NULL;
}

void CanOpenUrlContextInitializer( void* extData, const uint8_t* ctxType, FREContext ctx, uint32_t* numFunctionsToSet, const FRENamedFunction** functionsToSet )
{
	*numFunctionsToSet = 1;
    
	FRENamedFunction* func = (FRENamedFunction*) malloc( sizeof(FRENamedFunction) );
    
	func[0].name = (const uint8_t*) "canOpenUrl";
	func[0].functionData = NULL;
    func[0].function = &canOpenUrl;
	
	*functionsToSet = func;
}

void CanOpenUrlContextFinalizer( FREContext ctx )
{
	return;
}

void CanOpenUrlExtensionInitializer( void** extDataToSet, FREContextInitializer* ctxInitializerToSet, FREContextFinalizer* ctxFinalizerToSet ) 
{ 
    extDataToSet = NULL;  // This example does not use any extension data. 
    *ctxInitializerToSet = &CanOpenUrlContextInitializer; 
    *ctxFinalizerToSet = &CanOpenUrlContextFinalizer; 
}

void CanOpenUrlExtensionFinalizer()
{
    return;
}