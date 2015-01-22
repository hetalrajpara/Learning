//
//  ViewController.m
//  TestSqlite
//
//  Created by MacM12 on 20/01/15.
//  Copyright (c) 2015 Beeline Softwares. All rights reserved.
//

#import "ViewController.h"

#import "QuestionDatabase.h"
#import "QuestionDataBean.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    QuestionDatabase* database = [QuestionDatabase database];
    
    [database checkNewRecord];
    [database saveData];
    [database checkNewRecord];
    [database deleteData];
    [database checkNewRecord];
    
//    NSArray *questionList = [database questionArray];
//    for (QuestionDataBean *que in questionList) {
//        NSLog(@"%d: %@, %@, %@", que.rId, que.question, que.rDescription, que.answer);
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
