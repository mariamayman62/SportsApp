//
//  InProgressViewController.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InProgressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray<NSMutableDictionary*> *inProgressArray;
@property NSMutableArray<NSMutableDictionary*> *arrayOfDef;
@property NSUserDefaults *myDefaults;

@end

NS_ASSUME_NONNULL_END
