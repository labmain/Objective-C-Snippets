#import "NSLayoutConstraint+mutiplier.h"

@implementation NSLayoutConstraint (mutiplier)

-(instancetype)updateMultiplier:(CGFloat)multiplier {
    
    [NSLayoutConstraint deactivateConstraints:@[self]];
    
    NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:self.firstItem
                                                                     attribute:self.firstAttribute
                                                                     relatedBy:self.relation
                                                                        toItem:self.secondItem
                                                                     attribute:self.secondAttribute
                                                                    multiplier:multiplier
                                                                      constant:self.constant];
    [newConstraint setPriority:self.priority];
    newConstraint.shouldBeArchived = self.shouldBeArchived;
    newConstraint.identifier = self.identifier;
    newConstraint.active = true;
    
    [NSLayoutConstraint activateConstraints:@[newConstraint]];
    //NSLayoutConstraint.activateConstraints([newConstraint])
    return newConstraint;
}

@end
