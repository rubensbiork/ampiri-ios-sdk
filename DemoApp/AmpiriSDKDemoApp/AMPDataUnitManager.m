//
//  AMPDataUnitManager.m
//  AmpiriSDKDemoApp
//
//  Created by Glispa GmbH on 20/06/16.
//  Copyright © 2016 Glispa GmbH. All rights reserved.
//

#import "AMPDataUnitManager.h"
#import "AMPDataUnit.h"

static NSString *const kAMPUnitDefaultText_1 = @"The domestic cat (Latin: Felis catus) or the feral cat (Latin: Felis silvestris catus) is a small, typically furry, carnivorous mammal. They are often called house cats";
static NSString *const kAMPUnitDefaultTitle_1 = @"Cat";

static NSString *const kAMPUnitDefaultText_2 = @"The domestic dog (Canis lupus familiaris or Canis familiaris)[2] is a domesticated canid which has been selectively bred over millennia for various behaviours, sensory capabilities, and physical attributes.";
static NSString *const kAMPUnitDefaultTitle_2 = @"Dog";

static NSString *const kAMPUnitDefaultText_3 = @"Monkeys are haplorhine (\"dry-nosed\") primates, a paraphyletic group generally possessing tails and consisting of approximately 260 known living species. Many monkey species are tree-dwelling (arboreal), although there are species that live primarily on the ground, such as baboons. Most species are also active during the day (diurnal). Monkeys are generally considered to be intelligent, particularly Old World monkeys.";
static NSString *const kAMPUnitDefaultTitle_3 = @"Monkey";

@implementation AMPDataUnitManager

+ (nonnull NSArray<AMPDataUnit *> *)createDataUnitList:(NSUInteger)count {
    return [AMPDataUnitManager createDataUnitList:count from:1];
}


+ (nonnull NSArray<AMPDataUnit *> *)createDataUnitList:(NSUInteger)count from:(NSUInteger)from {
    NSMutableArray *units = [NSMutableArray new];
    NSArray *rawData = @[@{@"title" : kAMPUnitDefaultTitle_1, @"text" : kAMPUnitDefaultText_1, @"template" : @"image_cat"},
            @{@"title" : kAMPUnitDefaultTitle_2, @"text" : kAMPUnitDefaultText_2, @"template" : @"image_dog"},
            @{@"title" : kAMPUnitDefaultTitle_3, @"text" : kAMPUnitDefaultText_3, @"template" : @"image_monkey"}];

    NSUInteger i = from;
    while (i <= count + from - 1) {
        for (NSDictionary *item in rawData) {
            if (i <= count + from - 1) {
                NSString *title = item[@"title"];
                NSString *text = item[@"text"];
                NSString *template = item[@"template"];
                NSString *name = [NSString stringWithFormat:@"%@ #%lu", title, (unsigned long) i];
                NSString *photo = [NSString stringWithFormat:@"%@-%u.jpg", template, (i % 5) + 1];
                AMPDataUnit *unit = [[AMPDataUnit alloc] initDataUnitWithName:name andSpecification:text andPhoto:photo];
                [units addObject:unit];
                i++;
            }
        }
    }

    return units;
}

@end
