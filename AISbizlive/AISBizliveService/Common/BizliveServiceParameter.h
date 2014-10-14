//
//  BizliveServiceParameter.h
//  AISbizlive
//
//  Created by Pluem Limrattanakan on 8/14/2557 BE.
//  Copyright (c) 2557 promptnow. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - Request Header
//RequestHeader
#define REQ_KEY_REQUEST_PARAM               @"requestParam"
#define REQ_KEY_REQUEST_DATA                @"requestData"

#pragma mark - Request Parameter
//Common
#define REQ_KEY_USER_TOKEN_ID           @"userTokenId"
#define REQ_KEY_USER_MOBILE_NO          @"userMobileNo"
#define REQ_KEY_LANGUAGE                @"language"
#define REQ_KEY_OPERATOR_TYPE           @"operatorType"

//Login
#define REQ_KEY_LOGIN_FIRSTNAME         @"firstName"
#define REQ_KEY_LOGIN_LASTNAME          @"lastName"
#define REQ_KEY_LOGIN_EMAIL             @"email"
#define REQ_KEY_LOGIN_MSISDN            @"msisdn"
#define REQ_KEY_LOGIN_OTP_VERIFY_CODE   @"otpVerifyCode"
#define REQ_KEY_LOGIN_EMAIL_VERIFY_CODE @"emailVerifyCode"
#define REQ_KEY_LOGIN_USER              @"user"
#define REQ_KEY_LOGIN_PASSWORD          @"password"
#define REQ_KEY_LOGIN_FACEBOOK_TOKEN    @"facebookToken"
#define REQ_KEY_LOGIN_FORGOT_TYPE       @"forgotType"
#define REQ_KEY_LOGIN_PHOTO             @"photo"

//Group
#define REQ_KEY_GROUP_CONTACT_LIST      @"groupContactList"
#define REQ_KEY_GROUP_NAME              @"groupName"
#define REQ_KEY_GROUP_ID                @"groupId"
#define REQ_KEY_GROUP_PHOTO             @"photo"


//Contact
#define REQ_KEY_CONTACT_LIST            @"contactIdList"
#define REQ_KEY_CONTACT_ID              @"contactId"
#define REQ_KEY_CONTACT_FIRSTNAME       @"firstName"
#define REQ_KEY_CONTACT_LASTNAME        @"lastName"
#define REQ_KEY_CONTACT_MOBILE_NO       @"mobileNo"
#define REQ_KEY_CONTACT_PHOTO           @"photo"
#define REQ_KEY_CONTACT_SOURCE          @"contactSource"


//Message
#define REQ_KEY_RECEIVER_LIST           @"receiverList"
#define REQ_KEY_GROUP_LIST              @"groupContactList"
#define REQ_KEY_MOBILE_LIST             @"mobileList"
#define REQ_KEY_RECURRING_LIST          @"recurringList"
#define REQ_KEY_MESSAGE_ID              @"messageId"
#define REQ_KEY_MESSAGE                 @"message"
#define REQ_KEY_TIME_EXPIRE             @"timeExpire"
#define REQ_KEY_SEND_TYPE               @"sendType"
#define REQ_KEY_MOBILE_NO               @"mobileNo"

//Template
#define REQ_KEY_TEMPLATE_ID             @"templateId"
#define REQ_KEY_TEMPLATE_NAME           @"templateName"
#define REQ_KEY_TEMPLATE_MESSAGE        @"templateMessage"

//Cashcard
#define REQ_KEY_CASHCARD_SERIALCODE     @"serialCode"

//Setting
#define REQ_KEY_SETTING_OLDPASSWORD     @"oldPassword"
#define REQ_KEY_SETTING_NEWPASSWORD     @"newPassword"


#pragma mark - Response Header
#define RES_KEY_RESPONSE_STATUS         @"responseStatus"
#define RES_KEY_RESPONSE_DATA           @"responseData"

#pragma mark - Response Parameter
//Response status
#define RES_KEY_RESPONSE_CODE           @"responseCode"
#define RES_KEY_RESPONSE_MESSAGE        @"responseMessage"

//Login
#define RES_KEY_LOGIN_USER_ID           @"userId"
#define RES_KEY_LOGIN_USER_ID_TOKEN     @"userTokenId"
#define RES_KEY_LOGIN_USERNAME          @"userName"
#define RES_KEY_LOGIN_CONTACT_QUOTA     @"contactQuota"
#define RES_KEY_LOGIN_USER_MOBILE_NO    @"userMobileNo"
#define RES_KEY_LOGIN_OPERATOR_TYPE     @"operatorType"
#define RES_KEY_LOGIN_FLAG              @"loginFlag"

//Group
#define RES_KEY_CONTACT_LIST            @"contactList"
#define RES_KEY_CONTACT_ID_LIST         @"contactIdList"
#define RES_KEY_CONTACT_GROUP           @"contactGroup"
#define RES_KEY_GROUP_LIST              @"groupContactList"
#define RES_KEY_GROUP_ID                @"groupId"
#define RES_KEY_GROUP_NAME              @"groupName"
#define RES_KEY_GROUP_PHOTO_PATH        @"photoPath"
#define RES_KEY_GROUP_LAST_UPDATE       @"lastUpdatedDate"
#define RES_KEY_GROUP_HISTORY_LIST      @"groupHistoryList"

//Contact
#define RES_KEY_CONTACT_ID              @"contactId"
#define RES_KEY_CONTACT_FIRSTNAME       @"firstName"
#define RES_KEY_CONTACT_LASTNAME        @"lastName"
#define RES_KEY_CONTACT_MOBILE_NO       @"mobileNo"
#define RES_KEY_CONTACT_LAST_UPDATE     @"lastUpdatedDate"
#define RES_KEY_CONTACT_PHOTO_PATH      @"photoPath"
#define RES_KEY_CONTACT_IS_EXIST        @"isExist"
#define RES_KEY_CONTACT_HISTORY_LIST    @"contactHistoryList"

//Message
#define RES_KEY_RECEIVER_LIST           @"receiverList"
#define RES_KEY_RECURRING_LIST          @"recurringList"
#define RES_KEY_MOBILE_LIST             @"mobileList"
#define RES_KEY_MESSAGE_ID              @"messageId"
#define RES_KEY_MESSAGE                 @"message"
#define RES_KEY_TIME_EXPIRE             @"timeExpire"
#define RES_KEY_SEND_TYPE               @"sendType"
#define RES_KEY_SCHEDULE                @"schedule"
#define RES_KEY_START_DATE              @"startDate"
#define RES_KEY_END_DATE                @"endDate"
#define RES_KEY_SEND_TIME               @"sendTime"
#define RES_KEY_MESSAGE_SEND_DATE       @"sendDate"
#define RES_KEY_RECURRING_TYPE          @"recurringType"
#define RES_KEY_WEEKLY                  @"weekly"
#define RES_KEY_DAY_OF_WEEK             @"day_of_week"
#define RES_KEY_MONTHLY                 @"monthly"
#define RES_KEY_DAY                     @"day"

//Template
#define RES_KEY_TEMPLATE_ID             @"templateId"
#define RES_KEY_TEMPLATE_NAME           @"templateName"
#define RES_KEY_TEMPLATE_MESSAGE        @"templateMessage"
#define RES_KEY_TEMPLATE_LIST           @"templateList"

//Package
#define RES_KEY_PACKAGE_LIST            @"packageList"
#define RES_KEY_PACKAGE_CODE            @"packageCode"
#define RES_KEY_PACKAGE_NAME            @"packageName"
#define RES_KEY_PACKAGE_PRICE           @"packagePrice"
#define RES_KEY_PACKAGE_VALUE           @"packageValue"

//Topup
#define RES_KEY_TOPUP_LIST              @"topupList"
#define RES_KEY_TOPUP_ID                @"topupId"
#define RES_KEY_TOPUP_NAME              @"topupName"

//Cashcard
#define RES_KEY_CASHCARD_TOPUPBALANCE   @"topupBalance"

//Setting
#define RES_KEY_SETTING_FIRSTNAME       @"firstName"
#define RES_KEY_SETTING_LASTNAME        @"lastName"
#define RES_KEY_SETTING_MOBILENO        @"mobileNo"
#define RES_KEY_SETTING_TOPUPBALANCE    @"topupBalance"
#define RES_KEY_SETTING_TOTALSMS        @"totalSMS"
#define RES_KEY_SETTING_USEDSMS         @"usedSMS"
#define RES_KEY_SETTING_BALANCESMS      @"balanceSMS"
#define RES_KEY_SETTING_LISTPACKAGE     @"listPackage"
#define RES_KEY_SETTING_PACKAGENAME     @"packageName"
#define RES_KEY_SETTING_EXPIREDATE      @"expireDate"

//News
#define RES_KEY_NEWS_LIST               @"newsList"
#define RES_KEY_NEWS_ID                 @"newsId"
#define RES_KEY_NEWS_TITLE              @"title"
#define RES_KEY_NEWS_DETAIL             @"detail"
#define RES_KEY_NEWS_PHOTOSMALLPATH     @"photoSmallPath"
#define RES_KEY_NEWS_PHOTONORMALPATH    @"photoNormalPath"
#define RES_KEY_NEWS_DATE               @"newsDate"

//History
    //SendMessage
#define RES_KEY_SEND_MESSAGE_LIST       @"sendMessageHistoryList"
#define RES_KEY_SEND_MESSAGE_MESSAGE    @"message"
#define RES_KEY_SEND_MESSAGE_DATE       @"sendDate"
#define RES_KEY_SEND_MESSAGE_SUCCESSED  @"successed"
#define RES_KEY_SEND_MESSAGE_FAILED     @"failed"
    //Topup
#define RES_KEY_HISTORY_TOPUP_LIST              @"topupHistoryList"
#define RES_KEY_HISTORY_TOPUP_CHANNEL           @"channel"
#define RES_KEY_HISTORY_TOPUP_DATE              @"topupDate"
#define RES_KEY_HISTORY_TOPUP_AMOUNT            @"amount"
#define RES_KEY_HISTORY_TOPUP_MOBILENO          @"mobileNo"



//Information
#define RES_KEY_INFORMATION            @"infoDetail"



#pragma mark - Keyword
#define KEYWORD_Y                       @"Y"
#define KEYWORD_N                       @"N"
#define KEYWORD_TH                      @"TH"
#define KEYWORD_EN                      @"EN"
#define KEYWORD_SUCCESSED               @"Successed"


