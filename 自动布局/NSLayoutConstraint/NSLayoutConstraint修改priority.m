
#import "NSLayoutConstraint+priority.h"

@implementation NSLayoutConstraint (priority)
-(instancetype)updatePriority:(CGFloat)priority {
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondItem attribute:self.secondAttribute multiplier:self.multiplier constant:self.constant];
    [newConstraint setPriority:priority];
    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    newConstraint.active = true;

    [NSLayoutConstraint deactivateConstraints:[NSArray arrayWithObjects:self, nil]];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:newConstraint, nil]];
    //NSLayoutConstraint.activateConstraints([newConstraint])
    return newConstraint;
}
@end
