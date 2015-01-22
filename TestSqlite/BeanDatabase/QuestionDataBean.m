//
//  QuestionDataBean.m
//  TestSqlite
//
//  Created by MacM12 on 20/01/15.
//  Copyright (c) 2015 Beeline Softwares. All rights reserved.
//

#import "QuestionDataBean.h"

@implementation QuestionDataBean


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
               Created:(NSString *)created{
    
    if ((self = [super init])) {
        
        self.rId=rId;
        self.grade_id=gradeId;
        self.subject_id=subId;
        self.practies_id=pracId;
        
        self.question=question;
        self.passage=passage;
        self.answer=answer;
        self.rDescription=rDescription;
        self.url=url;
        
        self.is_deleted=isDeleted;
        self.free_question=freeQuestion;
        self.new_chapter=newChapter;
        self.sort=sort;
        
        self.created=created;
        
    }
    
    return self;
}
@end
