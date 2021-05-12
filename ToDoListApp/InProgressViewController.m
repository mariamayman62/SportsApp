//
//  InProgressViewController.m
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/4/21.
//

#import "InProgressViewController.h"
#import "DetailesOfCellViewController.h"
@interface InProgressViewController ()

@end

@implementation InProgressViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _myDefaults=[NSUserDefaults standardUserDefaults];

       
}
- (void)viewDidAppear:(BOOL)animated
{
    _arrayOfDef=[[_myDefaults objectForKey:@"allTask"] mutableCopy];

   _inProgressArray = [NSMutableArray new];

   for (NSMutableDictionary*dict in _arrayOfDef) {
        if ([[dict objectForKey:@"state"]isEqualToString:@"InProgress"]) {
            [_inProgressArray addObject:dict];
        }
    }
    [_tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *name=[cell viewWithTag:1];
    UILabel *date=[cell viewWithTag:2];
    UIImageView *image=[cell viewWithTag:0];
    
    NSDateFormatter *form=[[NSDateFormatter alloc] init];
    [form setDateFormat:@"dd-MM-yyyy hh:min a"];
    NSString *datestring=[form stringFromDate:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"date"]];
   
    
    date.text=datestring;
    name.text=[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    if([[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"High"])
    {
        image.image=[UIImage imageNamed:@"4"];
    }
    else if ([[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Low"])
    {
        image.image=[UIImage imageNamed:@"5"];
    }
    else if ([[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Med"])
    {
        image.image=[UIImage imageNamed:@"6"];
    }

    return  cell;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  _inProgressArray.count;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailesOfCellViewController *detaile=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailesOfTask"];
    detaile.editDict=_inProgressArray[indexPath.row];
    detaile.editIndex=indexPath;
    detaile.delegation=self;
    
    [self presentViewController:detaile animated:YES completion:nil];
    
    
   // DetailesOfCellViewController *d=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailesOfTask"];
    
    /*[d setProName:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [d setProDecription:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"description"]];
    
    [d setProPriority:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"priority"]];
    
    [d setProState:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"state"]];
    
    NSDateFormatter *form=[[NSDateFormatter alloc] init];
    [form setDateFormat:@"dd-MM-yyyy hh:min a"];
    NSString *stringDate=[form stringFromDate:[[_inProgressArray objectAtIndex:indexPath.row] objectForKey:@"date"]];
    [d setProDate:stringDate];*/
    
    //[self presentViewController:d animated:YES completion:nil];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* titleName=@"Tasks InProgress";
    return titleName;
}
@end
