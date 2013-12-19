//
//  WebService.m
//  NewShopExStore
//
//  Created by kain on 11-11-25.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "WebService.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>
#import "JSON.h"
#import "ICommand.h"
#import "ManageCommand.h"
#import "WToast.h"
#import "Util.h"

@implementation WebService
static WebService *ws = nil;
+(WebService *)instance{
	if (ws == nil) {
		ws = [[super alloc] init];
	}
	return ws;
}

-(void)dealloc{
    queue.delegate = nil;
    [queue release];
    [super dealloc];
}

-(void)doGET:(NSString *)command obj:(NSObject *)obj{

    NSMutableString *param=[[NSMutableString alloc]init];
    if(obj!=nil){
        unsigned int count;
        objc_property_t *properties = class_copyPropertyList([obj class], &count);
        for (int i=0; i<count; i++) {
            objc_property_t property = properties[i];
            //获取类属性名称
            //       char *mName= property_getName(property);
            const char *mName=property_getName(property);
            NSString *astring = [[NSString alloc] initWithCString:mName encoding:NSUTF8StringEncoding];
            [param appendString:@"&"];
            NSMutableString *pStr =[[NSMutableString alloc]init];
            [pStr appendString:astring];
            [pStr appendString:@"="];
            [pStr appendString:@"%@"];
            id val =[obj valueForKey:astring];
            NSString  *value = [NSString stringWithFormat:pStr,val];
            [param appendString:value];
			NSLog(@"------val--%@",val);
            [astring release];
            value = nil;
            [pStr release];
        }
		free(properties);
    }
    if (!queue) {
        queue = [[ASINetworkQueue alloc] init];
		[queue setDelegate:self];
    }
	
    NSString *urlStr = [NSString stringWithFormat:@"http://60.191.142.186:9003/MobileService.svc//NO700002?command=NO700002&shopID=13&clientType=1&resolution=480*800&channelID=12&sign=90e9919ba55ba7f4bd94f8501bd6c44c%@",param];
    NSLog(@"\n[-------Send----[GET]---]:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
	
	
	ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:url];
	[request setDelegate:self];
//    [request setRequestHeaders:dic];
//    request setTimeOutSeconds:(NSTimeInterval)
//	[dic release];
    [queue addOperation:request];
    [queue go];
    [request release];
    
}

//
-(void)doPOST:(NSString *)command obj:(NSObject *)obj{
//	City *currentCity = [Util getCurrentCity];
//	NSMutableString *param=[[NSMutableString alloc]init];
//    NSString *time = [Util getTime];
//    NSString *globalParam =[NSString stringWithFormat:@"timestamp=%@&city=%@&deviceToken=%@&accessToken=%@&",time,currentCity.cityPinYin,[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"],[Util getAccessToken]];
//    [param appendString:globalParam];
//    if(obj!=nil){
//        unsigned int count;
//        objc_property_t *properties = class_copyPropertyList([obj class], &count);
//        for (int i=0; i<count; i++) {
//            objc_property_t property = properties[i];
//            //获取类属性名称
//            //       char *mName= property_getName(property);
//            const char *mName=property_getName(property);
//            NSString *astring = [[NSString alloc] initWithCString:mName encoding:NSUTF8StringEncoding];
//            if(i>0){
//                [param appendString:@"&"];
//            }
//            NSMutableString *pStr =[[NSMutableString alloc]init]; 
//            [pStr appendString:astring];
//            [pStr appendString:@"="];
//            [pStr appendString:@"%@"];
//            id val =[obj valueForKey:astring];
//            NSString  *value = [NSString stringWithFormat:pStr,val];
//            [param appendString:value];
//            [astring release];
//            value = nil;
//            [pStr release];
//        }
//		free(properties);
//    }
//    
//    if (!queue) {
//        queue = [[ASINetworkQueue alloc] init];
//    }
//    [queue reset];
//    [queue setMaxConcurrentOperationCount:3];
//    NSMutableString *urlStr= [[NSMutableString alloc]init];
//	
//	NSString *apiHost = [Util getAppConfig:APIHOST];
//    [urlStr appendString:[Util getAppConfig:APIURL]];
//	[urlStr appendString:[uuaha generateRequestString:command]];
//    NSString *digest=[self sha1ith64Base:param];
//    NSString *tempStr = [NSString stringWithFormat:@"%@%@",digest,time];
//    NSString *sign =[self sha1ith64Base:tempStr];
//    NSString *tempParam = [NSString stringWithFormat:@"%@&sign=%@",param,sign];
//    NSLog(@"\n[-------Send----[POST]---]:%@:8811/%@?%@",[[Util getAppConfig:APIURL] substringWithRange:NSMakeRange(0, [Util getAppConfig:APIURL].length-1)],command,tempParam);
//    NSData *postParam = [tempParam dataUsingEncoding:NSUTF8StringEncoding];
//    NSURL *serverUrl = [NSURL URLWithString:urlStr];
//    ASIHTTPRequest *request = [[ASIHTTPRequest alloc] initWithURL:serverUrl];
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
//    [dic setObject:apiHost forKey:@"Host"];
//	[dic setObject:@"application/x-www-form-urlencoded" forKey:@"Content-Type"];
//    [request setRequestHeaders:dic];
//    [request appendPostData:postParam];//追加参数
//    [request setDelegate:self];
//    [queue addOperation:request];
//	[dic release];
//    [queue go];
//    [request release];
//	
//	
//	
	
	
}


- (void)requestFinished:(ASIHTTPRequest *)r{
    NSLog(@"请求成功:%i",[r responseStatusCode]);
//	NSString *commandID = [[r userInfo] valueForKey:@"commandID"];
    NSString *result = [r responseString];
	 NSLog(@"\n[-------result-------]:%@",result);
     id jsonObject=[result JSONValue];
//     NSString *commandID=[jsonObject valueForKey:@"commandID"];
//    //得到json，解析json并且得到command命令，到相应的类处理
//   
//    NSDictionary *resultCode =[jsonObject objectForKey:@"code"];
////    NSString *message= [jsonObject valueForKey:@"message"];
//    NSString *code = [NSString stringWithFormat:@"%@",resultCode];
//    if([code isEqualToString:@"200"]){
//        //服务器返回成功
    NSString *commandID=[jsonObject valueForKey:@"Command"];
        NSDictionary *body = [jsonObject objectForKey:@"Body"];
        NSMutableDictionary *commands = [ManageCommand instanceCommands];
        id<ICommand> command = [commands objectForKey:commandID];
        [command doCommand:body];  
        
//    }else {
//        //服务器返回错误
//        switch ([code intValue]) {
//            case 404:
//                [WToast showWithText:@"未找到或请求方式不正确404" forToastType:Error];
//                break;
//            case 500:
//                [WToast showWithText:@"服务器出错500" forToastType:Error];
//                break;
//            case 502:
//                [WToast showWithText:@"网关超时502" forToastType:Error];
//                break;
//            case 40301:
//                [WToast showWithText:@"授权失败" forToastType:Error];
//                break;
//            case 40302:
//                [WToast showWithText:@"请求授权失败" forToastType:Error];
//                break;
//            case 40303:
//                [WToast showWithText:@"请求参数有误" forToastType:Error];
//                break;
//            case 40304:
////                [WToast showWithText:@"请求权限有误"];
//				[WToast showWithText:@"请求权限有误" forToastType:Error];
//                break;
//            case 40305:
//                [WToast showWithText:@"请求参数类型有误，数字类型" forToastType:Error];
//                break;
//            case 40306:
//                [WToast showWithText:@"签名出错" forToastType:Error];
//                break;
//            case 40307:
//                [WToast showWithText:@"签名不匹配" forToastType:Error];
//                break;
//            case 40308:
//                [WToast showWithText:@"未提交授权" forToastType:Error];
//                break;
//            case 40309:
//                [WToast showWithText:@"请求参数类型有误，字符类型" forToastType:Error];
//                break;
//            case 40310:
//                [WToast showWithText:@"验证字符串不正确" forToastType:Error];
//                break;
//            case 60001:
//                [WToast showWithText:@"注册失败" forToastType:Error];
//                break;
//            case 60002:
//                [WToast showWithText:@"账号无效" forToastType:Error];
//                break;
//            case 60003:
//                [WToast showWithText:@"密码无效" forToastType:Error];
//                break;
//            case 60004:
//                [WToast showWithText:@"账号锁定" forToastType:Error];
//                break;
//            case 60005:
//                [WToast showWithText:@"账号已存在" forToastType:Error];
//                break;
//            case 60006:
//                [WToast showWithText:@"邮件已存在" forToastType:Error];
//                break;
//            case 60007:
//                [WToast showWithText:@"验证字符串状态更新失败" forToastType:Error];
//                break;
//            case 60008:
//                [WToast showWithText:@"密码更新失败" forToastType:Error];
//                break;
//            case 60038:
//                [WToast showWithText:@"没有好友" forToastType:Error];
//                break;
//            case 60032:
//                [WToast showWithText:@"数据权限有误" forToastType:Error];
//                break;
//            case 60027:
//                 [WToast showWithText:@"团购数据不存在" forToastType:Error];
//                break;
//            case 60021:
//                 [WToast showWithText:@"数据不存在" forToastType:Error];
//                break;
//            default:
////                NSString *codeStr = [NSString stringWithFormat:@"错误编号:%@",code];
////                [WToast showWithText:[NSString stringWithFormat:@"其他错误:%@",result] forToastType:Error];
//				[WToast showWithText:@"服务器错误!请稍候在试..." forToastType:Error];
//				
//                break;
//        }
////		    [DejalBezelActivityView removeViewAnimated:YES];
//    }
}

- (void)requestFailed:(ASIHTTPRequest *)r{
//	[DejalBezelActivityView removeViewAnimated:YES];
//    NSString *str =[NSString stringWithFormat:@"请求失败:%i",[r responseStatusCode]];
    NSLog(@"请求失败:%i--info->%@",[r responseStatusCode],[r error]);
	NSString *errorInfo = [NSString stringWithFormat:@"%@",[r error]];
	NSArray *arr=[errorInfo componentsSeparatedByString:@"The request timed out"];
    
//    BOOL isWelcome = [[NSUserDefaults standardUserDefaults] boolForKey:@"isWelcome"];
//    if(isWelcome){
//        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_ALERT_TIMEOUT object:nil];
//    } else {
        [WToast showWithText:[arr count]>0?@"请求超时":errorInfo forToastType:Error];
//    }
    
}






//SHA1加密
-(NSString *) dataToString: (NSData *) _data{
    NSMutableString *pStr = [[NSMutableString alloc] initWithCapacity: 1];
    
    UInt8 *p = (UInt8*) [_data bytes];
    int len = [_data length];
    
    for(int i = 0; i < len; i ++)
    {
        [pStr appendFormat:@"%02x", *(p+i)];
        
    }
    
    return pStr;
}
-(NSString *)sha1ith64Base:(NSString *)stringtoencode {     
    unsigned char result[CC_SHA1_DIGEST_LENGTH];      
    const char *cStr = [stringtoencode UTF8String];     
    CC_SHA1(cStr, strlen(cStr), result);     
    NSData *pwHashData = [[NSData alloc] initWithBytes:result length: sizeof result];        
    NSString *str=[self dataToString:pwHashData];    
    return  str; 
} 


@end
