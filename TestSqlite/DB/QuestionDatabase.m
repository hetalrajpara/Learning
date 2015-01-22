//
//  QuestionDatabase.m
//  TestSqlite
//
//  Created by MacM12 on 20/01/15.
//  Copyright (c) 2015 Beeline Softwares. All rights reserved.
//

#import "QuestionDatabase.h"
#import "QuestionDataBean.h"

#define sqliteFileName @"questionsDB"
#define sqliteFileExtention @"sqlite3"

#define tableName @"question_data"

#define colID @"rID"
#define colGradID @"gradeId"
#define colSubId @"subjectId"
#define colPracId @"practicesId"
#define colQue @"question"
#define colPassage @"passage"
#define colAns @"answer"
#define colDes @"rDescription"
#define colUrl @"url"
#define colIsDel @"isDeleted"
#define colFreeQue @"freeQuestion"
#define colNewChap @"newChapter"
#define colSort @"sort"
#define colCreated @"created"

@implementation QuestionDatabase{
    NSString* sqLiteDb;
}

static QuestionDatabase *_database;

+(QuestionDatabase *)database{
    if(_database == nil){
        _database = [[QuestionDatabase alloc]init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        sqLiteDb = [[NSBundle mainBundle] pathForResource:sqliteFileName
                                                   ofType:sqliteFileExtention];
        
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


- (void) deleteData
{
    sqlite3_stmt    *statement;
    
    const char *dbpath = [sqLiteDb UTF8String];
    
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        NSString *deleteSQL = [NSString stringWithFormat: @"DELETE FROM %@ WHERE %@= 5000",tableName
                               ,colID];
        
        const char *delete_stmt = [deleteSQL UTF8String];
        
        sqlite3_prepare_v2(_database, delete_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Successfully deleted row");
        } else {
            NSLog(@"Fail to delete row");
        }
        sqlite3_finalize(statement);
        //        sqlite3_close(_database);
    }
}
- (void) saveData
{
    sqlite3_stmt    *statement;
    
    const char *dbpath = [sqLiteDb UTF8String];
    
    if (sqlite3_open(dbpath, &_database) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat: @"INSERT INTO %@ (%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@,%@) VALUES (5000, 200, 200, 200, \"question 5000\", \"passage 5000\", \"answer 5000\", \"rDescription 5000\", \"url 5000\", 200, 200, 200, 200, \"created 5000\" )",tableName
                               ,colID
                               ,colGradID
                               , colSubId
                               , colPracId
                               , colQue
                               , colPassage
                               , colAns
                               , colDes
                               , colUrl
                               , colIsDel
                               , colFreeQue
                               , colNewChap
                               , colSort
                               , colCreated];
        
        const char *insert_stmt = [insertSQL UTF8String];
        
        sqlite3_prepare_v2(_database, insert_stmt, -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"Successfully added one row");
        } else {
            NSLog(@"Fail to added one row");
        }
        sqlite3_finalize(statement);
//        sqlite3_close(_database);
    }
}
- (void)checkNewRecord {
    
    NSString *query = [NSString stringWithFormat:@"SELECT count(*) FROM %@ where %@=5000", tableName, colID];
    sqlite3_stmt *statement;
//    NSLog(@"%d",sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil));
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            NSLog(@"Total row selected are %d",sqlite3_column_int(statement, 0));
//            int rId = sqlite3_column_int(statement, 0);
//            int grade_id = sqlite3_column_int(statement, 1);
//            int subject_id = sqlite3_column_int(statement, 2);
//            int practies_id = sqlite3_column_int(statement, 3);
//            
//            char *questionChars = (char *) sqlite3_column_text(statement, 4);
//            NSString *question= [[NSString alloc] initWithUTF8String:questionChars];
//            char *passageChars = (char *) sqlite3_column_text(statement, 5);
//            NSString *passage= [[NSString alloc] initWithUTF8String:passageChars];
//            char *answerChars = (char *) sqlite3_column_text(statement, 6);
//            NSString *answer= [[NSString alloc] initWithUTF8String:answerChars];
//            char *descriptionChars = (char *) sqlite3_column_text(statement, 7);
//            NSString *rDescription= [[NSString alloc] initWithUTF8String:descriptionChars];
//            char *urlChars = (char *) sqlite3_column_text(statement, 8);
//            NSString *url= [[NSString alloc] initWithUTF8String:urlChars];
//            
//            int is_deleted = sqlite3_column_int(statement, 9);
//            int free_question = sqlite3_column_int(statement, 10);
//            int new_chapter = sqlite3_column_int(statement, 11);
//            int sort = sqlite3_column_int(statement, 12);
//            
//            char *createdChars = (char *) sqlite3_column_text(statement, 13);
//            NSString *created= [[NSString alloc] initWithUTF8String:createdChars];
//            
//            
//            QuestionDataBean *que = [[QuestionDataBean alloc] initWithUniqueId:rId
//                                                                       GradeId:grade_id
//                                                                     SubjectId:subject_id                                                PractiesId:practies_id                                                Question:question                                                Passage:passage                                                Answer:answer
//                                                                   Description:rDescription
//                                                                           Url:url
//                                                                     IsDeleted:is_deleted
//                                                                  FreeQuestion:free_question
//                                                                    NewChapter:new_chapter
//                                                                          Sort:sort
//                                                                       Created:created];
//            NSLog(@"Retrived Record is ,%@",que);
        }
        sqlite3_finalize(statement);
    }
    
}

- (NSArray *)questionArray {
    
    NSMutableArray *retval = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM %@", tableName];
    sqlite3_stmt *statement;
//    NSLog(@"%d",sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil));
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
        == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            
            int rId = sqlite3_column_int(statement, 0);
            int grade_id = sqlite3_column_int(statement, 1);
            int subject_id = sqlite3_column_int(statement, 2);
            int practies_id = sqlite3_column_int(statement, 3);
            
            char *questionChars = (char *) sqlite3_column_text(statement, 4);
            NSString *question= [[NSString alloc] initWithUTF8String:questionChars];
            char *passageChars = (char *) sqlite3_column_text(statement, 5);
            NSString *passage= [[NSString alloc] initWithUTF8String:passageChars];
            char *answerChars = (char *) sqlite3_column_text(statement, 6);
            NSString *answer= [[NSString alloc] initWithUTF8String:answerChars];
            char *descriptionChars = (char *) sqlite3_column_text(statement, 7);
            NSString *rDescription= [[NSString alloc] initWithUTF8String:descriptionChars];
            char *urlChars = (char *) sqlite3_column_text(statement, 8);
            NSString *url= [[NSString alloc] initWithUTF8String:urlChars];
            
            int is_deleted = sqlite3_column_int(statement, 9);
            int free_question = sqlite3_column_int(statement, 10);
            int new_chapter = sqlite3_column_int(statement, 11);
            int sort = sqlite3_column_int(statement, 12);
            
            char *createdChars = (char *) sqlite3_column_text(statement, 13);
            NSString *created= [[NSString alloc] initWithUTF8String:createdChars];
            
            
            QuestionDataBean *que = [[QuestionDataBean alloc] initWithUniqueId:rId
                                                                       GradeId:grade_id
                                                                     SubjectId:subject_id                                                PractiesId:practies_id                                                Question:question                                                Passage:passage                                                Answer:answer
                                                                   Description:rDescription
                                                                           Url:url
                                                                     IsDeleted:is_deleted
                                                                  FreeQuestion:free_question
                                                                    NewChapter:new_chapter
                                                                          Sort:sort
                                                                       Created:created];
            [retval addObject:que];
        }
        sqlite3_finalize(statement);
    }
    return retval;
    
}

@end
