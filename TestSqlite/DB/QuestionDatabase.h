//
//  QuestionDatabase.h
//  TestSqlite
//
//  Created by MacM12 on 20/01/15.
//  Copyright (c) 2015 Beeline Softwares. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface QuestionDatabase : NSObject{
    sqlite3 *_database;
}

+(QuestionDatabase *)database;
-(NSArray *)questionArray;


- (void) saveData;
- (void)checkNewRecord;
- (void) deleteData;
@end
