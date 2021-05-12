//
//  DataModel.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/3/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataModel : NSObject
@property NSString* taskName;
@property NSString* taskDescription;
@property NSString* taskPriority;
@property NSDate* taskDate;
@property NSString* taskState;
@end
NS_ASSUME_NONNULL_END
