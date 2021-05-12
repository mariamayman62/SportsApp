//
//  ViewController.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/2/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray<NSMutableDictionary*> *doneArray;
@property NSMutableArray<NSMutableDictionary*> *arrayOfDef;
@property NSUserDefaults *myDefaults;

@end

