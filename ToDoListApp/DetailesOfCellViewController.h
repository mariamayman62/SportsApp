//
//  DetailesOfCellViewController.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/4/21.
//

#import <UIKit/UIKit.h>
#import "myEdit.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailesOfCellViewController : UIViewController
@property id<myEdit> delegation;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDate;

@property (weak, nonatomic) IBOutlet UITextField *taskName;
@property (weak, nonatomic) IBOutlet UITextField *taskState;

@property (weak, nonatomic) IBOutlet UITextField *taskDescrip;
@property (weak, nonatomic) IBOutlet UITextField *taskPriority;

/*@property NSString *proName;
@property NSString* proDecription;
@property NSString* proPriority;
@property NSString* proDate;
@property NSString* proState;*/


@property NSMutableDictionary* editDict;
@property NSIndexPath *editIndex;

@end

NS_ASSUME_NONNULL_END
