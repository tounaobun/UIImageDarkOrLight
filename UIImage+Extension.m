//
//  UIImage+Extension.m
//  WeiXinMovie
//
//  Created by Benson on 5/4/16.
//  Copyright © 2016 Benson. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (BOOL)isDarkImage {
    
    BOOL isDark = NO;
    
    CFDataRef imageData = CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage));
    const UInt8 *pixels = CFDataGetBytePtr(imageData);
    
    int darkPixels = 0;
    
    NSUInteger length = CFDataGetLength(imageData);
    int const darkPixelThreshold = (self.size.width*self.size.height)*.45;
    
    for(int i=0; i<length; i+=4)
    {
        int r = pixels[i];
        int g = pixels[i+1];
        int b = pixels[i+2];
        
        //luminance calculation gives more weight to r and b for human eyes
        float luminance = (0.299*r + 0.587*g + 0.114*b);
        if (luminance<150) darkPixels ++;
    }
    
    if (darkPixels >= darkPixelThreshold)
        isDark = YES;
    
    CFRelease(imageData);
    
    return isDark;
    
}

@end
