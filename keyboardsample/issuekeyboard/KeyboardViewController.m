//
//  KeyboardViewController.m
//  issuekeyboard
//
//  Created by KyoungYun.Kang on 19/10/2017.
//  Copyright © 2017 KyoungYun.Kang. All rights reserved.
//

#import "KeyboardViewController.h"

@interface KeyboardViewController ()
    @property (nonatomic, strong) UIButton *KORButton1;
    @property (nonatomic, strong) UIButton *KORButton2;
    @property (nonatomic, strong) UIButton *KORButton3;
    @property (nonatomic, strong) UIButton *issueDeleteButton;
    @property (nonatomic, strong) UIButton *issueAutoTestParticialButton;
    @property (nonatomic, strong) UIButton *issueAutoTestDeleteAllButton;
    @property (nonatomic, strong) UIButton *nextKeyboardButton;
    @end

@implementation KeyboardViewController
    
- (void)updateViewConstraints {
    [super updateViewConstraints];
    
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nextKeyboardButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self setKORButton1:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.KORButton1.layer.borderColor = [[UIColor blackColor]CGColor];
    self.KORButton1.layer.borderWidth = 1;
    [self.KORButton1 setFrame:CGRectMake(0, 0, 300, 40)];
    [self.KORButton1 setTitle:@"우" forState:UIControlStateNormal];
    [self.KORButton1 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.KORButton1 addTarget:self action:@selector(onTouchUpInsideKORButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.KORButton1];
    
    [self setKORButton2:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.KORButton2.layer.borderColor = [[UIColor blackColor]CGColor];
    self.KORButton2.layer.borderWidth = 1;
    [self.KORButton2 setFrame:CGRectMake(0, 40, 300, 40)];
    [self.KORButton2 setTitle:@"웅" forState:UIControlStateNormal];
    [self.KORButton2 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.KORButton2 addTarget:self action:@selector(onTouchUpInsideKORButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.KORButton2];
    
    [self setKORButton3:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.KORButton3.layer.borderColor = [[UIColor blackColor]CGColor];
    self.KORButton3.layer.borderWidth = 1;
    [self.KORButton3 setFrame:CGRectMake(0, 80, 300, 40)];
    [self.KORButton3 setTitle:@"우우" forState:UIControlStateNormal];
    [self.KORButton3 setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.KORButton3 addTarget:self action:@selector(onTouchUpInsideKORButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.KORButton3];
    
    [self setIssueDeleteButton:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.issueDeleteButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.issueDeleteButton.layer.borderWidth = 1;
    [self.issueDeleteButton setFrame:CGRectMake(300, 0, 100, 200)];
    [self.issueDeleteButton setTitle:@"DELETE" forState:UIControlStateNormal];
    //    [self.issueDeleteButton setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.issueDeleteButton addTarget:self action:@selector(onTouchUpInsideTestDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.issueDeleteButton];
    
    [self setIssueAutoTestParticialButton:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.issueAutoTestParticialButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.issueAutoTestParticialButton.layer.borderWidth = 1;
    [self.issueAutoTestParticialButton setFrame:CGRectMake(0, 120, 300, 40)];
    [self.issueAutoTestParticialButton setTitle:@"Korean type test (delete once)" forState:UIControlStateNormal];
    [self.issueAutoTestParticialButton setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.issueAutoTestParticialButton addTarget:self action:@selector(onTouchUpInsideAutoTestParticialButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.issueAutoTestParticialButton];
    
    [self setIssueAutoTestDeleteAllButton:[UIButton buttonWithType:UIButtonTypeSystem]];
    self.issueAutoTestDeleteAllButton.layer.borderColor = [[UIColor blackColor]CGColor];
    self.issueAutoTestDeleteAllButton.layer.borderWidth = 1;
    [self.issueAutoTestDeleteAllButton setFrame:CGRectMake(0, 160, 300, 40)];
    [self.issueAutoTestDeleteAllButton setTitle:@"Korean type test (delete all)" forState:UIControlStateNormal];
    [self.issueAutoTestDeleteAllButton setTranslatesAutoresizingMaskIntoConstraints:YES];
    [self.issueAutoTestDeleteAllButton addTarget:self action:@selector(onTouchUpInsideAutoTestDeleteAllButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.issueAutoTestDeleteAllButton];
    
    [self.nextKeyboardButton setTitle:NSLocalizedString(@"Next Keyboard", @"Title for 'Next Keyboard' button") forState:UIControlStateNormal];
    [self.nextKeyboardButton sizeToFit];
    self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nextKeyboardButton addTarget:self action:@selector(handleInputModeListFromView:withEvent:) forControlEvents:UIControlEventAllTouchEvents];
    
    [self.view addSubview:self.nextKeyboardButton];
    
    [self.nextKeyboardButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor].active = YES;
    [self.nextKeyboardButton.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}
    
- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}
    
- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
    
    UIColor *textColor = nil;
    if (self.textDocumentProxy.keyboardAppearance == UIKeyboardAppearanceDark) {
        textColor = [UIColor whiteColor];
    } else {
        textColor = [UIColor blackColor];
    }
    [self.nextKeyboardButton setTitleColor:textColor forState:UIControlStateNormal];
}
    
-(void)onTouchUpInsideKORButton:(id)sender {
    [self _deleteAll];
    NSString *text = [(UIButton *)sender titleForState:UIControlStateNormal];
    [self.textDocumentProxy insertText:text];
}
    
-(void)onTouchUpInsideTestDeleteButton:(id)sender {
    [self _deleteAll];
}
    
-(void)_deleteAll {
    NSString *documentContextBeforeInput = [self.textDocumentProxy documentContextBeforeInput];
    for(NSUInteger index = 0; index < [documentContextBeforeInput length]; index++) {
        [self.textDocumentProxy deleteBackward];
    }
    
    // Get only 3 chracters when we run `onTouchUpInsideAutoTestParticialButton`
    // This result show us that `documentContextBeforeInput` gave us right length
}
    
//@protocol UIKeyInput <UITextInputTraits>
//
//#if UIKIT_DEFINE_AS_PROPERTIES
//@property(nonatomic, readonly) BOOL hasText;
//#else
//- (BOOL)hasText;
//#endif
//- (void)insertText:(NSString *)text;
//- (void)deleteBackward;

// API Suggestion
/// 1. Replace former chracter and replace it instead of (void)deleteBackward; and (void)insertText:(NSString *)text;
//  - (void)replaceText:(NSString *)text;
/// 2. get range of former word range and replace it
//  - (void)replaceText:(NSString *)text from(NSRange)range;
//@end


////////////////////////////////////////////////////////////
/// Cursor should not be moved in below replace methods. ///
////////////////////////////////////////////////////////////

// [wSelf.textDocumentProxy replaceText:@"우"];
- (void)replaceText:(NSString *)text {
    [self.textDocumentProxy deleteBackward];
    [self.textDocumentProxy insertText:@"우"];
}

//[textDocumentProxy replaceText:@"우우" from:2];
- (void)replaceText:(NSString *)text from:(int)count {
    for (int i = 1; i <= count; i++) {
        [self.textDocumentProxy deleteBackward];
    }
    [self.textDocumentProxy insertText:@"우우"];
}


    
    // Test word: 우원재
    // Tset scenario: ㅇ -> 우 -> 웅 -> 우우 -> 우워 -> 우원 -> 우웑 -> 우원재
    const int64_t delaytime = 0.1; // When delay time is approximately longer than 1, it didn't happened. (However, Korean type speed is much shorter than 1)
    
-(void)onTouchUpInsideAutoTestParticialButton:(id)sender {
    __weak KeyboardViewController *wSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [wSelf.textDocumentProxy insertText:@"ㅇ"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [wSelf.textDocumentProxy replaceText:@"우"];
            [wSelf.textDocumentProxy deleteBackward];
            [wSelf.textDocumentProxy insertText:@"우"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wSelf.textDocumentProxy deleteBackward];
                [wSelf.textDocumentProxy insertText:@"웅"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [wSelf.textDocumentProxy deleteBackward];
                    [wSelf.textDocumentProxy insertText:@"우우"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [wSelf.textDocumentProxy deleteBackward];
                        [wSelf.textDocumentProxy insertText:@"워"];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"원"];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"웑"];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"원재"];
                        });
                    });
                });
            });
        });
    });
}
    
-(void)onTouchUpInsideAutoTestDeleteAllButton:(id)sender {
    __weak KeyboardViewController *wSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [wSelf.textDocumentProxy insertText:@"ㅇ"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [wSelf.textDocumentProxy deleteBackward];
            [wSelf.textDocumentProxy insertText:@"우"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [wSelf.textDocumentProxy deleteBackward];
                [wSelf.textDocumentProxy insertText:@"웅"];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [wSelf.textDocumentProxy deleteBackward];
                    [wSelf.textDocumentProxy insertText:@"우우"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [wSelf.textDocumentProxy deleteBackward];
                        [wSelf.textDocumentProxy deleteBackward];
                        [wSelf.textDocumentProxy insertText:@"우워"];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"우원"];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"우웑"];
                        });
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delaytime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy deleteBackward];
                            [wSelf.textDocumentProxy insertText:@"우원재"];
                        });
                    });
                });
            });
        });
    });
}
@end
