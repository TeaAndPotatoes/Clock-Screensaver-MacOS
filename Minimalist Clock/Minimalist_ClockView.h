//
//  Minimalist_ClockView.h
//  Minimalist Clock
//
//  Created by Brendan Doney on 3/16/18.
//  Copyright © 2018 Brendan Doney. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>

@interface Minimalist_ClockView : ScreenSaverView

+ (CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(NSFont *)font;

@end
