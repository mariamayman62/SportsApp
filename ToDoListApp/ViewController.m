//
//  ViewController.m
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/2/21.
//

#import "ViewController.h"
#import "DetailesOfCellViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myDefaults=[NSUserDefaults standardUserDefaults];
}


- (void)viewWillAppear:(BOOL)animated
{
    _arrayOfDef=[[_myDefaults objectForKey:@"allTask"] mutableCopy];

    _doneArray = [NSMutableArray new];

    for (NSMutableDictionary*dict in _arrayOfDef) {
        if ([[dict objectForKey:@"state"]isEqualToString:@"Done"]) {
            [_doneArray addObject:dict];
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
    NSString *datestring=[form stringFromDate:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"date"]];
   
    
    date.text=datestring;
    name.text=[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    if([[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"High"])
    {
        image.image=[UIImage imageNamed:@"4"];
    }
    else if ([[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Low"])
    {
        image.image=[UIImage imageNamed:@"5"];
    }
    else if ([[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Med"])
    {
        image.image=[UIImage imageNamed:@"6"];
    }

    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _doneArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* titleName=@"Tasks Done";
    return titleName;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailesOfCellViewController *detaile=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailesOfTask"];
    detaile.editDict=_doneArray[indexPath.row];
    detaile.editIndex=indexPath;
    detaile.delegation=self;
    
    [self presentViewController:detaile animated:YES completion:nil];
    
   // DetailesOfCellViewController *d=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailesOfTask"];
    
    /*[d setProName:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [d setProDecription:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"description"]];
    
    [d setProPriority:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"priority"]];
    
    [d setProState:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"state"]];
    
    NSDateFormatter *form=[[NSDateFormatter alloc] init];
    [form setDateFormat:@"dd-MM-yyyy hh:min a"];
    NSString *stringDate=[form stringFromDate:[[_doneArray objectAtIndex:indexPath.row] objectForKey:@"date"]];
    [d setProDate:stringDate];
    */
    //[self presentViewController:d animated:YES completion:nil];
    
}

@end
