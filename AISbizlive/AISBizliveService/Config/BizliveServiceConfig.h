//
//  BizliveServiceConfig.h
//  TestBizlive
//
//  Created by Pluem Limrattanakan on 10/7/2557 BE.
//  Copyright (c) 2557 Pluem Limrattanakan. All rights reserved.
//

#import <Foundation/Foundation.h>



#define SERVER_PREFIX_URL @"http://10.252.224.6:8081"

//Login
#define SERVICE_LG_01_FORGET_PASSWORD_URL               @"/bizlive/login/forgotpwd"
#define SERVICE_LG_02_SIGNUP_EMAIL_URL                  @"/bizlive/signup/email"
#define SERVICE_LG_03_REQUEST_OTP_URL                   @"/bizlive/verify/reqNewOtp"
#define SERVICE_LG_04_REQUEST_EMAIL_URL                 @"/bizlive/verify/reqNewEmail"
#define SERVICE_LG_05_VERIFY_OTP_URL                    @"/bizlive/verify/otp"
#define SERVICE_LG_06_VERIFY_EMAIL_URL                  @"/bizlive/verify/email"
#define SERVICE_LG_07_LOGIN_URL                         @"/bizlive/login/user"

//Contact
#define SERVICE_CT_01_GETCONTACTLIST_URL                @"/bizlive/contact/getAllContact"
#define SERVICE_CT_02_ADDCONTACT_URL                    @"/bizlive/contact/addContact"
#define SERVICE_CT_03_EDIT_CONTACT_URL                  @"/bizlive/contact/editContact"
#define SERVICE_CT_04_DELETE_CONTACT_URL                @"/bizlive/contact/deleteContact"
#define SERVICE_CT_05_CONTACT_MESSAGE_HISTORY_URL       @"/bizlive/contact/viewContact"
#define SERVICE_CT_06_GETGROUPCONTACT_URL               @"/bizlive/contactGroup/getAllContactGroup"
#define SERVICE_CT_07_ADDGROUP_URL                      @"/bizlive/contactGroup/addContactGroup"
#define SERVICE_CT_08_GROUP_MESSAGE_HISTORY_URL         @"/bizlive/contactGroup/viewContactGroup"
#define SERVICE_CT_09_GETCONTACTLIST_TOEDITGROUP_URL    @"/bizlive/contactGroup/manageContactOfGroup"
#define SERVICE_CT_10_EDIT_GROUP_URL                    @"/bizlive/contactGroup/editContactGroup"
#define SERVICE_CT_11_DELETE_GROUP_URL                  @"/bizlive/contactGroup/deleteContactGroup"
#define SERVICE_CT_12_IMPORT_CONTACT_URL                @"/bizlive/contact/importContact"

//Message
#define SERVICE_MS_01_SEND_MESSAGE_URL                  @"/bizlive/msgSetting/setupMessage"
#define SERVICE_MS_02_SAVE_SCHEDULE_URL                 @"/bizlive/msgSetting/setupMessage"

//Recurring
#define SERVICE_RC_01_GET_SCHEDULE_URL                  @"/bizlive/msgSetting/getAllSchedule"
#define SERVICE_RC_02_DELETE_SCHEDULE_URL               @"/bizlive/msgSetting/deleteSchedule"
#define SERVICE_RC_03_EDIT_SCHEDULE_URL                 @"/bizlive/msgSetting/editSchedule"

//Template
#define SERVICE_TP_01_ADD_TEMPLATE_URL                  @"/bizlive/template/addTemplate"
#define SERVICE_TP_02_GET_TEMPLATELIST_URL              @"/bizlive/template/getAllTemplate"
#define SERVICE_TP_03_EDIT_TEMPLATE_URL                 @"/bizlive/template/editTemplate"
#define SERVICE_TP_04_DELETE_TEMPLATE_URL               @"/bizlive/template/deleteTemplate"

//Package
#define SERVICE_PK_01_GET_PACKAGELIST_URL               @"/bizlive/package/getAllPackage"
#define SERVICE_PK_02_GET_TOPUPLIST_URL                 @"/bizlive/topup/getAllTopup"
#define SERVICE_PK_03_CASHCARD_URL                      @"/bizlive/payment/cashcard"
#define SERVICE_PK_04_BILLING_URL                       @"/bizlive/payment/billing"
#define SERVICE_PK_05_MPAY_URL                          @"/bizlive/payment/mpay"
#define SERVICE_PK_06_CREDIT_CARD_URL                   @"/bizlive/payment/creditcard"

//Setting
#define SERVICE_ST_01_SETTING_PROFILE_URL               @"/bizlive/setting/profile"
#define SERVICE_ST_02_CHANGE_PASSWORD_URL               @"/bizlive/setting/changePwd"

//News
#define SERVICE_NW_01_GET_NEWS_URL                      @"/bizlive/content/news"

//History
#define SERVICE_HT_01_GET_SENDMESSAGE_HISTORY_URL       @"/bizlive/history/sendMessage"
#define SERVICE_HT_02_GET_TOPUP_HISTORY_URL             @"/bizlive/history/topup"
#define SERVICE_HT_03_GET_BALANCE_HISTORY_URL           @"/bizlive/history/balance"

//Information
#define SERVICE_IN_01_GET_HELP_URL                      @"/bizlive/info/help"
#define SERVICE_IN_02_GET_PRIVACY_URL                   @"/bizlive/info/privacy"
#define SERVICE_IN_03_GET_TERM_URL                      @"/bizlive/info/termCondition"
#define SERVICE_IN_04_GET_ABOUT_URL                     @"/bizlive/info/about"

//Logout
#define SERVICE_LO_01_LOGOUT_URL                        @""



