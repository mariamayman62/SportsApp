//
//  ToDoListViewController.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import <UIKit/UIKit.h>
#import "AddDelegation.h"
#import "myEdit.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate, AddDelegation,myEdit>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property NSMutableArray<NSMutableDictionary*> *tasks;
@property NSMutableArray<NSMutableDictionary*>*editOnTable;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
