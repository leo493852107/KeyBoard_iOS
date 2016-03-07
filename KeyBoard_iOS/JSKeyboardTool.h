//
//  JSKeyboardTool.h
//  KeyBoard_iOS
//
//  Created by leo on 3/7/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    JSKeyboardToolItemPrevious,
    JSKeyboardToolItemNext,
    JSKeyboardToolItemDone
} JSKeyboardToolItem;

@class JSKeyboardTool;

@protocol JSKeyboardToolDelegate <NSObject>

@optional
- (void)keyboardTool:(JSKeyboardTool *)tool didClickItem:(JSKeyboardToolItem)item;

@end

@interface JSKeyboardTool : UIToolbar


@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *previousItem;
@property (weak, nonatomic, readonly) IBOutlet UIBarButtonItem *nextItem;


+ (instancetype)tool;

/**
 *  代理
 */
@property (nonatomic, weak) id<JSKeyboardToolDelegate> toolbarDelegate;

@end
