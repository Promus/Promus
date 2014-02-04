//
//  BuyBread.m
//  Promus
//
//  Created by John on 02/02/2014.
//  Copyright (c) 2014 USE-Software. All rights reserved.
//

#import "BuyBread.h"

@interface BuyBread ()

@end

@implementation BuyBread

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

//-(void) buyBread
//{
//    int sLen = 4;
//    char aChar[4] = {0};
//    char seedChars1[] = "BDFHJLNPRTVXZ02468";
//    
//    int i;
//    for(i = 0; i < sLen; i++)
//    {
//        aChar[i] = seedChars1[arc4random()%18];
//    }
//    
//    int rLen = 18;
//    char bChar[18] = {0};
//    char seedChars2[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
//    
//    for(i = 0; i < rLen; i++)
//    {
//        bChar[i] = seedChars2[arc4random()%36];
//    }
//    
//    char xChar = 'X';
//    char oChar = '-';
//    
//    unsigned char bread[28] = {aChar[0], bChar[0], bChar[1], bChar[2], bChar[3], oChar,
//        aChar[1], bChar[4], bChar[5], bChar[6], bChar[7], oChar,
//        aChar[2], bChar[8], bChar[9], bChar[10], bChar[11], oChar,
//        aChar[3], bChar[12], bChar[13], xChar, bChar[14], bChar[15],
//        bChar[16], bChar[17], aChar[4]};
//}
//
//-(void) seeToBread
//{
//    for (charIndex = 0; charIndex < [bread length]; charIndex++)
//    {
//        NSCharacterSet *allowed = [[NSCharacterSet
//                                       characterSetWithCharactersInString:@"BDFHJLNPRTVWXZ02468"] invertedSet];
//        NSRange range = [inputString rangeOfCharacterFromSet:allowed];
//        
//        char testChar1 = [bread characterAtIndex:0];
//        char testChar2 = [bread characterAtIndex:6];
//        char testChar3 = [bread characterAtIndex:12];
//        char testChar4 = [bread characterAtIndex:18];
//        
//        unsigned char breadLiterals = {testChar1, testChar2, testChar3, testChar4};
//        BOOL unauthorized = (range.location != NSNotFound);
//        
//        if (unauthorized == NO)
//        {
//            NSString *enteredBread = @"I can buy bread now.";
//        } else
//        {
//            NSString *enteredBread = @"I cannot buy bread now.";
//        }
//    }
//}
//
//- (IBAction) controlDidEndTextEditing
//{
//    if (enteredBread == simpleBread)
//    {
//        NSLog(@"I can buy bread now.");
//    }
//    else
//    {
//        NSLog(@"I cannot buy bread now.");
//    }
//}

@end
