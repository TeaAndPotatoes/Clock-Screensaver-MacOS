//
//  Minimalist_ClockView.m
//  Minimalist Clock
//
//  Created by Brendan Doney on 3/16/18.
//  Copyright © 2018 Brendan Doney. All rights reserved.
//

#import "Minimalist_ClockView.h"

@implementation Minimalist_ClockView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    [[NSColor blackColor] setFill];
    NSRectFill(self.bounds);
    
    NSString *helloStr = @"Hello screen saver plugin";
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.alignment = NSTextAlignmentCenter;
    style.lineBreakMode = NSLineBreakByClipping;
    
    NSFont *clockFont = [NSFont fontWithName:@"Helvetica" size:60];
    NSDictionary *attr = @{
                           NSForegroundColorAttributeName: NSColor.whiteColor,
                           NSParagraphStyleAttributeName: style,
                           NSFontAttributeName: clockFont
                           };
    CGSize textSize = [helloStr sizeWithAttributes:attr];
    CGSize size = self.bounds.size;
    CGPoint origin = self.bounds.origin;
    
    CGRect r = CGRectMake(origin.x,
                          origin.y + (textSize.height) / 2,
                          size.width,
                          (size.height + textSize.height) / 2);
    [helloStr drawInRect:r withAttributes:attr];
    
    [helloStr drawInRect:r withAttributes:attr];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

+ (CGSize)findHeightForText:(NSString *)text havingWidth:(CGFloat)widthValue andFont:(NSFont *)font {
    CGSize size = CGSizeZero;
    if (text) {
        //iOS 7
        CGRect frame = [text boundingRectWithSize:CGSizeMake(widthValue, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName:font } context:nil];
        size = CGSizeMake(frame.size.width, frame.size.height + 1);
    }
    return size;
}

@end
