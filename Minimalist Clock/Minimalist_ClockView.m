//
//  Minimalist_ClockView.m
//  Minimalist Clock
//
//  Created by Brendan Doney on 3/16/18.
//  Copyright © 2018 Brendan Doney. All rights reserved.
//

#import "Minimalist_ClockView.h"

@implementation Minimalist_ClockView

static NSDictionary* attr;
static NSRect textBox;
static bool withSeconds = false;
static bool amPMEnabled = true;

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        if(withSeconds) {
            [self setAnimationTimeInterval:1/30.0];
        }
        else {
            [self setAnimationTimeInterval:30.0];
        }
        NSFont* clockFont = [NSFont fontWithName:@"GillSans-Light" size:190];
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        style.alignment = NSTextAlignmentCenter;
        style.lineBreakMode = NSLineBreakByClipping;
        attr = @{
                 NSForegroundColorAttributeName: NSColor.whiteColor,
                 NSParagraphStyleAttributeName: style,
                 NSFontAttributeName: clockFont
                 };
        NSString *nullStr = @"NULL STRING";
        CGSize textSize = [nullStr sizeWithAttributes:attr];
        textBox = CGRectMake(frame.origin.x, frame.origin.y + ((frame.size.height - textSize.height) / 2.0), frame.size.width,
                             textSize.height + 25);
//                             (frame.size.height + textSize.height) / 2);
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
}

- (void)animateOneFrame
{
    // Clear the screen
    [[NSColor blackColor] setFill];
    NSRectFill(textBox);
    
    // Find the date and add it to a string
    NSDate* now = [NSDate date];
    NSDateFormatter* outputFormatter = [[NSDateFormatter alloc] init];
    
    // Add critical componenets by default
    NSString *dateFormatString = @"hh:mm";
    
    // Add attributes depending on current settings
    if(withSeconds) {
        dateFormatString = [dateFormatString stringByAppendingString:@":ss"];
    }
    if(amPMEnabled) {
        dateFormatString = [dateFormatString stringByAppendingString:@" a"];
    } else {
         dateFormatString = [dateFormatString stringByReplacingOccurrencesOfString:@"hh" withString:@"HH"];
    }
    
    // Create string based on formatter string
    [outputFormatter setDateFormat:dateFormatString];
    NSString* newDateString = [outputFormatter stringFromDate:now];
    
    // Draw the string within the text box
    [newDateString drawInRect:textBox withAttributes:attr];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
