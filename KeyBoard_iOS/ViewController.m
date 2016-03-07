//
//  ViewController.m
//  KeyBoard_iOS
//
//  Created by leo on 3/6/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "ViewController.h"
#import "JSKeyboardTool.h"

@interface ViewController ()<UITextFieldDelegate,JSKeyboardToolDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

/**
 *  所有的文本框数组
 */
@property (nonatomic, strong) NSArray *fields;

/**
 *  工具条
 */
@property (nonatomic, weak) JSKeyboardTool *toolbar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fields = @[self.nameField, self.emailField, self.addressField];
    
    // 加载工具条控件
    JSKeyboardTool *toolbar = [JSKeyboardTool tool];
//    toolbar.delegate = self;
    toolbar.toolbarDelegate = self;
    self.toolbar = toolbar;
    
    // 设置工具条
    self.nameField.inputAccessoryView = toolbar;
    self.emailField.inputAccessoryView = toolbar;
    self.addressField.inputAccessoryView = toolbar;
    
//    [self testInputViewAndInputAccessoryView];
    
}


#pragma mark - JSKeyboardToolDelegate
- (void)keyboardTool:(JSKeyboardTool *)tool didClickItem:(JSKeyboardToolItem)item {
    if (item == JSKeyboardToolItemPrevious) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex--;
    
        [self.fields[currentIndex] becomeFirstResponder];
    
        self.toolbar.previousItem.enabled = (currentIndex != 0);
        self.toolbar.nextItem.enabled = YES;
    } else if (item == JSKeyboardToolItemNext) {
        NSUInteger currentIndex = 0;
        for (UIView *view in self.view.subviews) {
            if ([view isFirstResponder]) {
                currentIndex = [self.fields indexOfObject:view];
            }
        }
        currentIndex++;
    
        [self.fields[currentIndex] becomeFirstResponder];
        self.toolbar.previousItem.enabled = YES;
        self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
    } else if (item == JSKeyboardToolItemDone) {
        [self.view endEditing:YES];
    }
}

//- (void)keyboardToolDidClickPreviousItem:(JSKeyboardTool *)tool {
//    NSUInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex--;
//    
//    [self.fields[currentIndex] becomeFirstResponder];
//    
//    self.toolbar.previousItem.enabled = (currentIndex != 0);
//    self.toolbar.nextItem.enabled = YES;
//    
//}
//
//- (void)keyboardToolDidClickNextItem:(JSKeyboardTool *)tool {
//    NSUInteger currentIndex = 0;
//    for (UIView *view in self.view.subviews) {
//        if ([view isFirstResponder]) {
//            currentIndex = [self.fields indexOfObject:view];
//        }
//    }
//    currentIndex++; 
//    
//    [self.fields[currentIndex] becomeFirstResponder];
//    self.toolbar.previousItem.enabled = YES;
//    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
//
//}
//
//- (void)keyboardToolDidClickDoneItem:(JSKeyboardTool *)tool {
//    [self.view endEditing:YES];
//}


- (void)testInputViewAndInputAccessoryView {
    // 更换键盘
    UIView *keyboard = [[UIView alloc] init];
    keyboard.frame = CGRectMake(0, 0, 0, 100);
    keyboard.backgroundColor = [UIColor redColor];
    self.emailField.inputView = keyboard;
    
    // 设置键盘顶部的工具条
    //    UIView *toolbar = [[UIView alloc] init];
    //    toolbar.frame = CGRectMake(0, 0, 0, 44);
    //    toolbar.backgroundColor = [UIColor blueColor];
    //    self.nameField.inputAccessoryView = toolbar;
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - <UITextFieldDelegate>
/**
 *  当点击键盘右下角return key时，调用这个方法
 *
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.nameField) {
        // emailField 成为第一响应者
        [self.emailField becomeFirstResponder];
    } else if (textField == self.emailField) {
        // addressField 成为第一响应者
        [self.addressField becomeFirstResponder];
    } else if (textField == self.addressField) {
        
//        [self.view endEditing:YES];
        [textField resignFirstResponder];
    }
   
    return YES;
}

#pragma mark - 监听键盘弹出
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSUInteger currentIndex = [self.fields indexOfObject:textField];
    
    self.toolbar.previousItem.enabled = (currentIndex != 0);
    self.toolbar.nextItem.enabled = (currentIndex != self.fields.count - 1);
}


@end
