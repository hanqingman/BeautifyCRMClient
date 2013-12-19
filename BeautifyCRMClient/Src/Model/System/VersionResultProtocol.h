//
//  VersionResultProtocol.h
//  uuaha
//
//  Created by jetson  on 12-9-10.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VersionDetailResultProtocol.h"
#import "Jastor.h"
@interface VersionResultProtocol : Jastor

@property (nonatomic, retain) VersionDetailResultProtocol *VersionDetailResultProtocol;

@end
