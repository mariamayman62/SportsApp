//
//  AddDataViewController.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import <UIKit/UIKit.h>
#import "AddDelegation.h"
#import "DataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddDataViewController : UIViewController 
@property (weak, nonatomic) IBOutlet UITextField *textPriorty;

@property id <AddDelegation> addTaskDelegation;


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descripTextField;


@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@end

NS_ASSUME_NONNULL_END
