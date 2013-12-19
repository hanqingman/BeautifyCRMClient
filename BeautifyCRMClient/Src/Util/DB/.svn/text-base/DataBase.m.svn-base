//
//  DB.m
//  TianWei
//
//  Created by newuser on 12-5-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DataBase.h"

@interface DataBase()
-(void)databaseFilePath;  
-(id)init;

@end
static DataBase *db;
@implementation DataBase

-(id)init{
    return self;
}


+(DataBase *)getConnect{
    
    if(db==nil){
        db = [[DataBase alloc]init];
    }
    return db;
}

//获取数据库路径
-(void)databaseFilePath{
    
    NSString *databaseFilePath = [[NSBundle mainBundle] pathForResource:@"kain" ofType:@"sqlite"];
//    NSLog(@"----path--->%@",databaseFilePath);
//    NSArray *documentsPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory
//                                                                , NSUserDomainMask 
//                                                                , YES); 
//    NSString *databaseFilePath=[[documentsPaths objectAtIndex:0] stringByAppendingPathComponent:@"kain.sqlite"];
//    
    if (sqlite3_open([databaseFilePath UTF8String], &database)==SQLITE_OK) { 
        NSLog(@"open sqlite db ok."); 
    }
}

//创建表
-(int)onCreate:(NSString *)createSql{   
    [self databaseFilePath];
    int result=0;
    if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errorMsg)==SQLITE_OK) { 
        NSLog(@"create ok."); 
        result=1;
    }else{
        NSLog(@"DBERROR%s",errorMsg);
        sqlite3_free(errorMsg);
    }
    sqlite3_close(database); 
    
    return result;
}

//执行增删改
-(int)execObject:(NSString *)sql{
    [self databaseFilePath];
    int result =0;
    if (sqlite3_exec(database, [sql UTF8String], NULL, NULL, &errorMsg)==SQLITE_OK) { 
        NSLog(@"execObject ok."); 
        result = 1;
    }else{
        NSLog(@"DBERROR%s",errorMsg);
        sqlite3_free(errorMsg);
    }
    sqlite3_close(database);
    
    return result;
}
//执行查询
-(sqlite3_stmt *)queryObject:(NSString *)sql{
    [self databaseFilePath];
    sqlite3_stmt *statement=nil; 
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil)==SQLITE_OK) { 
        NSLog(@"queryObject ok."); 
    }else{
        NSLog(@"DBERROR%s",errorMsg);
        sqlite3_free(errorMsg);
        
    }
    //sqlite3_finalize(statement);
    sqlite3_close(database);
    return  statement;
}

@end
