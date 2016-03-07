//
//  JSKeyboardTool.m
//  KeyBoard_iOS
//
//  Created by leo on 3/7/16.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSKeyboardTool.h"

@implementation JSKeyboardTool

+ (instancetype)tool {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (IBAction)previous:(id)sender {
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:JSKeyboardToolItemPrevious];
    }
}
- (IBAction)next:(id)sender {
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:JSKeyboardToolItemNext];
    }
}
- (IBAction)down:(id)sender {
    if ([self.toolbarDelegate respondsToSelector:@selector(keyboardTool:didClickItem:)]) {
        [self.toolbarDelegate keyboardTool:self didClickItem:JSKeyboardToolItemDone];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
