//
//  ViewController.m
//  BeautifyCRMClient
//
//  Created by wang hanqing on 13-7-8.
//  Copyright (c) 2013年 wang hanqing. All rights reserved.
//

#import "ViewController.h"
#import "WebService.h"
#import "VersionProtocol.h"
#import "VersionResultProtocol.h"
#import "VersionDetailResultProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"hello";
    }
    return self;
}

- (NSString *)tabImageName
{
	return @"image-1";
}
- (NSString *)tabTitle
{
	return @"first";
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 320, 45)];
    [btn setTitle:@"发送协议" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor yellowColor]];
    [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTag:1];
    [self.view addSubview:btn];
    
    [btn release];
    
   UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 155, 320, 45)];
    [btn1 setTitle:@"跳转(下图是异步加载)" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor purpleColor]];
    [btn1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setTag:2];
    [self.view addSubview:btn1];
    [btn1 release];
    
    
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 210, 300, 200)];
    [imageV setImageWithURL:[NSURL URLWithString:@"http://img.xiami.com/static/img/software/spark/start.jpg"] placeholderImage:[UIImage imageNamed:@"image-2"]];
    [self.view addSubview:imageV];
    [imageV release];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击处理

-(void) onClick:(UIButton *) sender{
    
    if (sender.tag == 1) {
        //发送协议
        VersionProtocol *version = [[VersionProtocol alloc] init];
        [version setVersionCode:@"1.0.0"];
        [[WebService instance] doGET:PROTOCOL_PHONE_SYSTEM_VERSION obj:version];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(VersionResult:) name:NOTIFICATION_PHONE_SYSTEM_VERSION object:nil];
    }else if (sender.tag == 2){
        
        ViewController *vc = [[ViewController alloc]  init];
        [self.navigationController pushViewController:vc animated:YES];
        [vc release];
        
    }
  
    
}

#pragma mark - http返回

-(void) VersionResult:(NSNotification *) notification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_PHONE_SYSTEM_VERSION object:nil];
    VersionResultProtocol *result = notification.object;
//    NSLog(@"====versionType===>%@<==",result);

    VersionDetailResultProtocol *versionDetail = result.VersionDetailResultProtocol;
    NSLog(@"====versionType===>%@<==",versionDetail.VersionType);
    
    [btn setTitle:[NSString stringWithFormat:@"返回的数据：%@",versionDetail.VersionType] forState:UIControlStateNormal];
}


@end
