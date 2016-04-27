//
//  Common.h
//  wyxc
//
//  Created by li on 16/4/26.
//  Copyright © 2016年 Fighting. All rights reserved.
//

//
//  Common.h
//  ttxc
//
//  Created by kael on 6/15/15.
//  Copyright (c) 2015 gzlz. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, OSSBizType) {
    OSSService = 1,    //图片存储服务
    PictureService = 2 //图片处理服务
};

//新增,修改,只读模式切换
typedef NS_ENUM(NSInteger, EditMode) {
    AddMode = 1,    //新增
    UpdateMode = 2, //更新
    RedMode = 3     //更新
};

/**
 *  搜索模式
 */
typedef NS_ENUM(NSInteger, SearchMode) {
    /**
     *  正常模式
     */
    SearchModeNormal = 0,
    /**
     *  搜索模式
     */
    SearchModelSearch = 1
};

/**
 *  教练审核预约申请
 */
typedef NS_ENUM(NSInteger, ApproveAction) {
    /**
     *  同意
     */
    ApproveACtionAgree = 1,
    /**
     *  拒绝
     */
    ApproveActionReject = 2,
    /**
     *  取消
     */
    ApproveActionCancel = 10
};

#pragma mark Static Dict from API Spec

typedef NS_ENUM(NSInteger, ConfirmStatus) {
    ConfirmStatus_On_Approve = -1,      //审核中
    ConfirmStatus_Approve_Rejected = 0, //已拒绝
    ConfirmStatus_Approved = 1,         //已同意
    ConfirmStatus_Approve_Outdated = 3, //预约过期
    ConfirmStatus_Approve_Invalid = 2,  //预约失效
};

typedef NS_ENUM(NSInteger, ConfirmAction) {
    ConfirmAction_Approve_Reject = 0,
    ConfirmAction_Approve_Ok = 1,
    ConfirmAction_Approve_Cancel = 2
};

typedef NS_ENUM(NSInteger, EditStudentFromType) {
    EditStudentFromTypeWizard = 1, //从导入学员(只有一个学员)进入学员编辑页面
    EditStudentFromTypeContacts = 2 //从通讯录页面进入学员编辑页面
};

// typedef NS_ENUM(UIFont, allFonts){
//
//};
// typedef NS_ENUM(NSUInteger, TTGState) {
//  TTGStateOK = 0,
//  TTGStateError,
//  TTGStateUnknow
//};
// typedef void (^SuccessFunction)(id data);
// typedef void (^FailFunction)(id data);
// typedef void (^successFunc)(id data);
// typedef void (^failFunc)(id data);
typedef void (^success)(id data);
typedef void (^failure)(id data);
typedef void (^callBackWithData)(id data);
typedef void (^callBack)();

// OSS上传文件进度回调
typedef void (^uploadProgress)(int64_t bytesSent, int64_t totalByteSent,
                               int64_t totalBytesExpectedToSend);
@interface Common : NSObject

@end

