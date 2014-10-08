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
#define REQ_KEY_GROUP_LIST              @"groupList"
#define REQ_KEY_MOBILE_LIST             @"mobileList"
#define REQ_KEY_RECURRING_LIST          @"recurringList"
#define REQ_KEY_MESSAGE_ID              @"messageId"
#define REQ_KEY_MESSAGE                 @"message"
#define REQ_KEY_TIME_EXPIRE             @"timeExpire"
#define REQ_KEY_SEND_TYPE               @"sendType"
#define REQ_KEY_MOBILE_NO               @"mobileNo"

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
#define RES_KEY_GROUP_LIST              @"groupList"
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
#define RES_KEY_GROUP_ID                @"groupId"
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

#pragma mark - Keyword
#define KEYWORD_Y                       @"Y"
#define KEYWORD_N                       @"N"
#define KEYWORD_TH                      @"TH"
#define KEYWORD_EN                      @"EN"
#define KEYWORD_SUCCESSED               @"Successed"


