//
//  QuestionDataBean.h
//  TestSqlite
//
//  Created by MacM12 on 20/01/15.
//  Copyright (c) 2015 Beeline Softwares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionDataBean : NSObject

@property (nonatomic, assign) int rId;
@property (nonatomic, assign) int grade_id;
@property (nonatomic, assign) int subject_id;
@property (nonatomic, assign) int practies_id;

@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *passage;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *rDescription;
@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) int is_deleted;
@property (nonatomic, assign) int free_question;
@property (nonatomic, assign) int new_chapter;
@property (nonatomic, assign) int sort;

@property (nonatomic, copy) NSString *created;

- (id)initWithUniqueId:(int)rId
               GradeId:(int)gradeId
             SubjectId:(int)subId
            PractiesId:(int)pracId
              Question:(NSString *)question
               Passage:(NSString *)passage
                Answer:(NSString *)answer
           Description:(NSString *)rDescription
                   Url:(NSString *)url
             IsDeleted:(int)isDeleted
          FreeQuestion:(int)freeQuestion
            NewChapter:(int)newChapter
                  Sort:(int)sort
               Created:(NSString *)created;
@end
