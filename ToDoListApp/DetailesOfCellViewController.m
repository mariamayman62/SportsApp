//
//  DetailesOfCellViewController.m
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/4/21.
//

#import "DetailesOfCellViewController.h"
#import "AddDataViewController.h"
#import "DataModel.h"

@interface DetailesOfCellViewController ()

@end

@implementation DetailesOfCellViewController
{
    NSMutableDictionary *editArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    editArray=[NSMutableDictionary new];
    /*_taskName.text=_proName;
    _taskDescrip.text=_proDecription;
    _taskPriority.text=_proPriority;
    _taskDate.text=_proDate;
    _taskState.text=_proState;*/
    _taskName.text=[_editDict objectForKey:@"name"];
    _taskDescrip.text=[_editDict objectForKey:@"description"];
    _taskPriority.text=[_editDict objectForKey:@"priority"];
    _taskDate.date=[_editDict objectForKey:@"date"];
    _taskState.text=[_editDict objectForKey:@"state"];

}
- (IBAction)edit:(id)sender {
    
    DataModel *model=[DataModel new];
    model.taskName=_taskName.text;
    model.taskDescription=_taskDescrip.text;
    model.taskState=_taskState.text;
    model.taskDate=_taskDate.date;
    model.taskPriority=_taskPriority.text;
    
    
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"You sure to Edit Your Task?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * yesBtn = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self->editArray setObject:model.taskName forKey:@"name"];
        [self->editArray setObject:model.taskDescription forKey:@"description"];
        [self->editArray setObject:model.taskState forKey:@"state"];
        [self->editArray setObject:model.taskDate forKey:@"date"];
        [self->editArray setObject:model.taskPriority forKey:@"priority"];
        
        [self->_delegation myEditDelegation:self->editArray :self->_editIndex.row];
        
        [self.navigationController popViewControllerAnimated:YES];
       
    }];
    UIAlertAction * cancelBtn = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        self->_taskName.text=[self->_editDict objectForKey:@"name"];
        self->_taskDescrip.text=[self->_editDict objectForKey:@"description"];
        self->_taskPriority.text=[self->_editDict objectForKey:@"priority"];
        self->_taskDate.date=[self->_editDict objectForKey:@"date"];
        self->_taskState.text=[self->_editDict objectForKey:@"state"];
    
    }];
    
    
    //add action to alert
    [alert addAction:yesBtn];
    [alert addAction:cancelBtn];
    //present alert
    [self presentViewController:alert animated:YES completion:nil];
    
}



@end
