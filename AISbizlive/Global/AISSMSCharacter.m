//
//  AISSMSCharacter.m
//  AISbizlive
//
//  Created by Wachirawit on 6/12/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import "AISSMSCharacter.h"

@implementation AISSMSCharacter

int checkFontThai;
bool checkFomatThai;
NSString *format;
int checkShots;
NSString *formatReturn;
int checkSpecial;
int messageNo = 1;
+(NSString*)bytesString:(NSString *) characterString{
    checkFontThai = 0;
    checkSpecial = 0;
    checkFomatThai = YES;
    checkShots = 160;
    format = @"160";
    formatReturn = @"";
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < [characterString length]; i++) {
        [array addObject:[NSString stringWithFormat:@"%C", [characterString characterAtIndex:i]]];
        if ([[array objectAtIndex:i]isEqualToString:@"^"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"{"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"}"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"["]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"]"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"\\"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"|"]) {
            checkSpecial += 1;
        }
        else if([[array objectAtIndex:i]isEqualToString:@"~"]) {
            checkSpecial += 1;
        }
        NSData* bytes = [[array objectAtIndex:i] dataUsingEncoding:NSUTF8StringEncoding];
        if (bytes.length == 3) {
            if([[array objectAtIndex:i]isEqualToString:@"€"]) {
                checkSpecial += 1;
            }
            else{
                format = @"70";
                checkShots = 70;
                checkFomatThai = NO;
                checkSpecial = 0;
                break;
            }
        }
    }
    if (checkFomatThai) {
        while (characterString.length > [format intValue]) {
            format = [NSString stringWithFormat:@"%d",[format intValue]+checkShots];
        }
        formatReturn = [NSString stringWithFormat:@"%u / %@",characterString.length+checkSpecial,format];
    }
    else{
        while (characterString.length > [format intValue]) {
        format = [NSString stringWithFormat:@"%d",[format intValue]+checkShots];
        }
         formatReturn = [NSString stringWithFormat:@"%u / %@",characterString.length,format];
    }
    return formatReturn;
}
+(NSString*)messageNumber{
    if (checkFomatThai) {
        messageNo = (int) [format intValue]/160;
    }
    else{
        messageNo = (int) [format intValue]/70;
    }
    return [NSString stringWithFormat:@"%d",messageNo];
}
@end
