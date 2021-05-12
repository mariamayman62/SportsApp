//
//  ToDoListViewController.m
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import "ToDoListViewController.h"
#import "AddDataViewController.h"
#import "DetailesOfCellViewController.h"

@interface ToDoListViewController ()
{
    NSUserDefaults *defaults;
    NSMutableArray *filterDefaults;
    BOOL isFiltered;
}

@end

@implementation ToDoListViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    isFiltered=false;
    self.searchBar.delegate=self;
    
    
    defaults=[NSUserDefaults standardUserDefaults];
    
    if([[defaults objectForKey:@"allTask"] mutableCopy] == nil)
    {
        _tasks=[NSMutableArray new];
    }
    else
    {
        _tasks=[[defaults objectForKey:@"allTask"] mutableCopy];
    }
    
 
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length==0) {
        isFiltered=false;
    } else {
        isFiltered=true;
        
        filterDefaults=[[NSMutableArray alloc] init];
        for (NSMutableDictionary* task in _tasks) {
            NSRange nameRange =[[task objectForKey:@"name"] rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(nameRange.location != NSNotFound)
            {
                [filterDefaults addObject:task];
            }
        }
    }
    [self.tableView reloadData];
}


- (IBAction)addAction:(id)sender {
    AddDataViewController *add=[self.storyboard instantiateViewControllerWithIdentifier:@"addTask"];
    [add setAddTaskDelegation:self];
    [self.navigationController pushViewController:add animated:YES];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UILabel *name=[cell viewWithTag:1];
    UILabel *date=[cell viewWithTag:2];
    UIImageView *image=[cell viewWithTag:3];
    
    
    
    NSDateFormatter *form=[[NSDateFormatter alloc] init];
    [form setDateFormat:@"dd-MM-yyyy hh:min a"];
    NSString *datestring=[form stringFromDate:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"date"]];
   
    if(isFiltered)
    {
        name.text=[[filterDefaults objectAtIndex:indexPath.row] objectForKey:@"name"];
    }
    
    else{
    date.text=datestring;
    name.text=[[_tasks objectAtIndex:indexPath.row] objectForKey:@"name"];
    
    if([[[_tasks objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"High"])
    {
        image.image=[UIImage imageNamed:@"4"];
    }
    else if ([[[_tasks objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Low"])
    {
        image.image=[UIImage imageNamed:@"5"];
    }
    else if ([[[_tasks objectAtIndex:indexPath.row] objectForKey:@"priority"] isEqualToString:@"Med"])
    {
        image.image=[UIImage imageNamed:@"6"];
    }
    }
    return  cell;
    
    

}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if(isFiltered)
    {
        return  filterDefaults.count;
    }
    return [_tasks count];
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DetailesOfCellViewController *detaile=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailesOfTask"];
    detaile.editDict=_tasks[indexPath.row];
    detaile.editIndex=indexPath;
    detaile.delegation=self;
    
    [self.navigationController pushViewController:detaile animated:YES];
  /*  [detaile setProName:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"name"]];
    [detaile setProDecription:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"description"]];
    
    [detaile setProPriority:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"priority"]];
    
    [detaile setProState:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"state"]];
    
    NSDateFormatter *form=[[NSDateFormatter alloc] init];
    [form setDateFormat:@"dd-MM-yyyy hh:min a"];
    NSString *stringDate=[form stringFromDate:[[_tasks objectAtIndex:indexPath.row] objectForKey:@"date"]];
    [detaile setProDate:stringDate];
   
    
    */

}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tasks removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    [defaults setObject:_tasks forKey:@"allTask"];
    [defaults synchronize];
    [_tableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)addTask:(nonnull NSMutableDictionary *)dataDictionary {
    [_tasks addObject:dataDictionary];
    [defaults setObject:_tasks forKey:@"allTask"];
    [defaults synchronize];
    [_tableView reloadData];
    
}


- (void)myEditDelegation:(nonnull NSMutableDictionary *)editDict :(NSInteger)index {
    
    if (editDict==nil) {
        [self.tableView reloadData];
    }
    else
    {
        [_tasks removeObjectAtIndex:index];
        [_tasks insertObject:editDict atIndex:index];
        [defaults setObject:_tasks forKey:@"allTask"];
        [defaults synchronize];
        [self.tableView reloadData];
        
    }
    
    
}



@end
