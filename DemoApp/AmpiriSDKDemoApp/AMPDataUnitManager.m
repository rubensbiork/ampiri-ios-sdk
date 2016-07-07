//
//  AMPDataUnitManager.m
//  AmpiriSDKTestApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"

static NSInteger const kAMPUnitsCount = 10;

static NSString* const kAMPUnitDefaultText_1 = @"The domestic cat (Latin: Felis catus) or the feral cat (Latin: Felis silvestris catus) is a small, typically furry, carnivorous mammal. They are often called house cats";
static NSString* const kAMPUnitDefaultTitle_1 = @"Cat";

static NSString* const kAMPUnitDefaultText_2 = @"The domestic dog (Canis lupus familiaris or Canis familiaris)[2] is a domesticated canid which has been selectively bred over millennia for various behaviours, sensory capabilities, and physical attributes.";
static NSString* const kAMPUnitDefaultTitle_2 = @"Dog";

static NSString* const kAMPUnitDefaultText_3 = @"Monkeys are haplorhine (\"dry-nosed\") primates, a paraphyletic group generally possessing tails and consisting of approximately 260 known living species. Many monkey species are tree-dwelling (arboreal), although there are species that live primarily on the ground, such as baboons. Most species are also active during the day (diurnal). Monkeys are generally considered to be intelligent, particularly Old World monkeys.";
static NSString* const kAMPUnitDefaultTitle_3 = @"Monkey";

@implementation AMPDataUnitManager

+ (NSArray*)createDataUnitList {
    NSMutableArray *units  = [NSMutableArray new];
    NSArray *rawData  = @[@{@"title" : kAMPUnitDefaultTitle_1, @"text" : kAMPUnitDefaultText_1, @"template": @"image_cat"},
                          @{@"title" : kAMPUnitDefaultTitle_2, @"text" : kAMPUnitDefaultText_2, @"template": @"image_dog"},
                          @{@"title" : kAMPUnitDefaultTitle_3, @"text" : kAMPUnitDefaultText_3, @"template": @"image_monkey"}];
    
    for (NSDictionary *item in rawData) {
        NSString *title = item[@"title"];
        NSString *text = item[@"text"];
        NSString *template = item[@"template"];
        for (int i = 1; i <= kAMPUnitsCount; i++ ) {
            NSString *name = [NSString stringWithFormat:@"%@ #%d",title, i];
            UIImage *photo = [UIImage imageNamed:[NSString stringWithFormat:@"%@-%d.jpg", template, (i % 5) + 1]];
            AMPDataUnit *unit = [[AMPDataUnit alloc] initDataUnitWithName:name andSpecification:text andPhoto:photo];
            [units addObject:unit];
        }
    }
    
    return units;
}

@end
