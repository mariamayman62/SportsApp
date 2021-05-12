//
//  myEdit.h
//  ToDoListApp
//
//  Created by Mariam Ayman on 3/5/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol myEdit <NSObject>
-(void)myEditDelegation:(NSMutableDictionary*)editDict :(NSInteger) index;
@end

NS_ASSUME_NONNULL_END
