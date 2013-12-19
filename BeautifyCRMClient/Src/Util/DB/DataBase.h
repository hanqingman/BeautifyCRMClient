//
//  DB.h
//  TianWei
//
//  Created by newuser on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
@interface DataBase : NSObject{
    sqlite3 *database;
    char *errorMsg;
}

-(int)execObject:(NSString *)sql;
-(sqlite3_stmt *)queryObject:(NSString *)sql;
-(int)onCreate:(NSString *)createSql;
+(DataBase *)getConnect;

@end
