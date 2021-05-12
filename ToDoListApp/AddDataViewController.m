//
//  AddDataViewController.m
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import "AddDataViewController.h"
#import "ToDoListViewController.h"
@interface AddDataViewController ()
{
    //NSArray *priorityArray;
    //NSString *priority;
    
    NSMutableDictionary *dataDictionary;
}
@end

@implementation AddDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataDictionary =[NSMutableDictionary new];
    
    //priorityArray=@[@"High",@"Mdium",@"Low"];
    
   // priority=[NSString new];
   // self.priorityPicker.delegate = self;
    
   // self.priorityPicker.dataSource = self;
}

- (IBAction)save:(id)sender {
    
    DataModel *model=[DataModel new];
    model.taskName=_nameTextField.text;
    model.taskDescription=_descripTextField.text;
    model.taskDate=_datePicker.date;
    model.taskState=_stateTextField.text;
    model.taskPriority=_textPriorty.text;
 /*   if (priority==nil)
    {
        model.taskPriority=priorityArray[0];
    }
    else
    {
        model.taskPriority=priority;
    }*/
    [dataDictionary setObject:model.taskName forKey:@"name"];
    [dataDictionary setObject:model.taskDescription forKey:@"description"];
    [dataDictionary setObject:model.taskPriority forKey:@"priority"];
    [dataDictionary setObject:model.taskDate forKey:@"date"];
    
    [dataDictionary setObject:model.taskState forKey:@"state"];
    
    [_addTaskDelegation addTask:dataDictionary];
    [self.navigationController popViewControllerAnimated:YES];
    

}


/*- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSInteger numberOfRow=[priorityArray count];
    
    return numberOfRow;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *titleOfRow=priorityArray[row];
    return titleOfRow;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    priority=priorityArray[row];
}*/

@end
    
