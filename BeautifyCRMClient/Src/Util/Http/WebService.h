//
//  WebService.h
//  NewShopExStore
//
//  Created by kain on 11-11-25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"



@interface WebService : NSObject<ASICacheDelegate,ASIHTTPRequestDelegate,ASIProgressDelegate>{
     ASIFormDataRequest  *formDataRequest;
   
     ASINetworkQueue *queue;
}
+(WebService *)instance;
-(void)doPOST:(NSString *)command obj:(NSObject *)obj;
-(void)doGET:(NSString *)command obj:(NSObject *)obj;
@end
