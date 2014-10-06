//
//  FungusService.h
//  FungusFramework
//
//  Created by Vasin Charoensuk on 1/4/56 BE.
//  Copyright (c) 2556 AIS. All rights reserved.
//

//Service
#pragma mark - Servvice Suffix
#define SERVICE_REQ_KEY_EXCHANGE @"getPantryPublicKey.ashx"
#define SERVICE_REQ_ORDER_ID @"RequestOrderId.ashx"
#define SERVICE_REQ_AUTHENTICATATION @"RequestAuthenticate.ashx"
#define SERVICE_REQ_LOGIN @"login.ashx"
#define SERVICE_REQ_KEEPALIVE @"keepAlive.ashx"
#define SERVICE_REQ_PAYMENT_LOGIN @"RequestPaymentLogin.ashx"
#define SERVICE_REQ_CHARGING @"Charging.ashx"
#define SERVICE_REQ_REGISTER_SUBSCRIBER_ID @"RegisterSubscriberIdentity.ashx"
#define SERVICE_REQ_REFUND @"RefundRequest.ashx"
#define SERVICE_REQ_RESERVE @"ReserveAmount.ashx"
#define SERVICE_REQ_RESERVE_ADDITIONAL @"ReserveAdditionalAmount.ashx"
#define SERVICE_REQ_CHARGE_RESERVE @"ChargeReservation.ashx"
#define SERVICE_REQ_RELEASE_RESERVE @"ReleaseReservation.ashx"
#define SERVICE_REQ_SUBSCRIBE_PUSH @"subscriber.ashx"
#define SERVICE_REQ_UNSUBSCRIBE_PUSH @"unsubscriber.ashx"



//*** Phase 2
#define SERVICE_REQ_PRIVILEGE @"PrivilegeRequest.ashx"
#define SERVICE_REQ_CUST_PROFILE @"RequestCustProfile.ashx"
#define SERVICE_REQ_GET_MSISDN @"getMsisdn.ashx"
#define SERVICE_REQ_OTP @"getOTP.ashx"
#define SERVICE_REQ_LOGIN_BY_OTP @"loginByOTP.ashx"
#define SERVICE_REQ_ADS @"ViewMAd.ashx"
#define SERVICE_REQ_CLICK_ADS @"ClickMAd.ashx"

//Request
//#define TAG_REQ_DH_KEY_EXCHANGE @"DHKeyExchange"
#define TAG_REQ_DH_KEY_EXCHANGE @"getPantryPublicKeyRequest"
#define TAG_REQ_LOGIN @"loginRequest"
#define TAG_REQ_ORDER_ID @"RequestOrderID"
#define TAG_REQ_AUTHENTICATE @"RequestDeveloperAuthenticate"
#define TAG_REQ_PAYMENT_LOGIN @"PaymentLoginRequest"

#define TAG_REQ_CHARGING @"ChargingRequest"
#define TAG_REQ_REGISTER_SUBSCRIBER_ID @"RegisterSubscriberIdentityRequest"
#define TAG_REQ_REFUND  @"RefundAmountRequest"
#define TAG_REQ_RESERVE_AMOUNT  @"ReserveAmount"
#define TAG_REQ_RESERVE_ADDITIONAL  @"ReserveAdditionalAmount"
#define TAG_REQ_CHARGE_RESERVE  @"ChargeReservation"
#define TAG_REQ_RELEASE_RESERVE  @"ReleaseReservation"
#define TAG_REQ_PRIVILEGE  @"RequestPrivilege"
#define TAG_REQ_CUST_PROFILE @"RequestCustProfileRequest"

#define TAG_REQ_GET_MSISDN @"GetMsisdnRequest"
#define TAG_REQ_GET_OTP @"GetOtpRequest"
#define TAG_REQ_LOGIN_BY_OTP @"LoginByOtpRequest"

#define TAG_REQ_VIEW_ADS @"RequestViewAd"
#define TAG_REQ_CLICK_ADS @"RequestClickAd"

//*** NewFlow
#define TAG_REQ_LOGIN @"loginRequest"
#define TAG_REQ_APP_AUTHEN @"appAuthenRequest"

//Response
//#define TAG_ROOT_SERVICE_KEY_EXCHANGE @"ResponseKeyExchange"
#define TAG_ROOT_SERVICE_KEY_EXCHANGE @"getPantryPublicKeyResponse"
#define TAG_ROOT_SERVICE_ORDER_ID @"RequestOrderIDResponse"
#define TAG_ROOT_SERVICE_AUTHENTICATE @"RequestDeveloperAuthenticateResponse"
#define TAG_ROOT_SERVICE_CUST_PROFILE @"RequestCustProfileResponse"
#define TAG_ROOT_SERVICE_GET_MSISDN @"GetMsisdnResponse"
#define TAG_ROOT_SERVICE_GET_OTP @"GetOtpResponse"
#define TAG_ROOT_SERVICE_LOGIN_BY_OTP @"LoginByOtpResponse"
#define TAG_ROOT_SERVICE_CHARGING @"ChargingResponse"
#define TAG_ROOT_SERVICE_REGISTER_SUBSCRIBER_ID @"RegisterSubscriberIdentityResponse"
#define TAG_ROOT_SERVICE_VIEW_ADS @"ResponseViewAd"
#define TAG_ROOT_SERVICE_CLICK_ADS @"ResponseClickAd"

//New Flow
#define TAG_ROOT_SERVICE_POST_LOGIN @"loginResponse"
#define TAG_ROOT_SERVICE_APP_AUTHEN @"appAuthenResponse"

//Tag Item
//	#define TAG_ITEM_AUTHENTICATE @"RequestAuthenticateResponse"
#define TAG_ITEM_KEY_EXCHANGE_INFO @"KeyExchangeInfo"
#define TAG_ITEM_OPERATION_STATUS @"OperationStatus"
#define TAG_ITEM_TRANSACTION_INFO @"OrderIDInfo"
#define TAG_ITEM_PERMISSION_INFO @"PermissionFeaturedInfo"
#define TAG_ITEM_ARRAY_PERMISSION @"Permissions"
#define TAG_ITEM_PERMISSION @"Permission"
#define TAG_ITEM_CHANGE_INFO @"ChargeAmountInfo"
#define TAG_ITEM_PAYMENT_LOGIN_INFO @"PaymentLoginInfo"
#define TAG_ITEM_REFUND_AMOUT_INFO @"RefundAmountInfo"
#define TAG_ITEM_SESSION_INFO @"SessionInfo"
#define TAG_ITEM_RESERVE_AMOUNT @"ReserveAmountInfo"
#define TAG_ITEM_CHARGE_RESERVATION @"ChargeReservationInfo"
#define TAG_ITEM_RESERVE_ADDITIONAL_AMOUNT @"ReserveAdditionalAmountInfo"
#define TAG_ITEM_PRIVILEGE_RESPONSE @"RequestPrivilegeResponse"
#define TAG_ITEM_PRIVILEGE_INFO @"PrivilegeResponse"
#define TAG_ITEM_ARRAY_POI @"ArrayPoiResponse"
#define TAG_ITEM_POI @"PoiResponse" //"POI"

#define TAG_ITEM_CUST_PROFILE @"CustProfileInfo"
#define TAG_ITEM_GET_MSISDN @"MSISDN"
#define TAG_ITEM_ADS_REQUEST @"ServiceAdsInfo"

//Tag Request

#define TAG_PRIME @"Modulus"
#define TAG_BASE @"Exponent"


#define TAG_APP_ID @"AppID"
#define TAG_TRANSACTION_TYPE @"TransactionType"
#define TAG_APP_VERSION @"AppVersion"
#define TAG_FUNGUS_VERSION @"FungusVersion"
#define TAG_FINGER_PRINT @"FingerPrint"
#define TAG_ACCESS_TOKEN @"accessToken"
#define TAG_CERTIFICATE @"Certificate"
#define TAG_ORDER_ID @"OrderID" //"TransactionID"
#define TAG_SSID @"SSID"
#define TAG_CCSSID @"CCSSID"
#define TAG_USERNAME @"Username"
#define TAG_PASSWORD @"Password"
#define TAG_AUTH_CODE @"authCode"
#define TAG_CC_SUBSESSION_ID @"CCSubSessionId"
#define TAG_SUBSESSION_TYPE @"SubscriptionIdType"
#define TAG_CHANGING_INFORMAION_DESCRIPTION @"ChargingInformationDescription"
#define TAG_CHANGING_INFORMAION_CURRENCY @"ChargingInformationCurrency"
#define TAG_CHANGING_INFORMAION_AMOUNT @"ChargingInformationAmount"
#define TAG_REFUND_INFORMAION_DESCRIPTION @"RefundInformationDescription"
#define TAG_REFUND_INFORMAION_CURRENCY @"RefundInformationCurrency"
#define TAG_REFUND_INFORMAION_AMOUNT @"RefundInformationAmount"
#define TAG_RESERVE_INFORMAION_DESCRIPTION @"ReservingInformationDescription"
#define TAG_RESERVE_INFORMAION_CURRENCY @"ReservingInformationCurrency"
#define TAG_RESERVE_INFORMAION_AMOUNT @"ReservingInformationAmount"
#define TAG_RESERVE_IDENTIFIER @"ReservationIdentfier"
#define TAG_RESERVE_LIFE_CYCLE @"ReservationLifecycle"
#define TAG_REFERENCE_CODE @"ReferenceCode"
#define TAG_USER_TOKEN @"UserToken"
//***** Phase 2.0
#define TAG_SERIAL_NUMBER @"SerialNumber"
#define TAG_MODEL_DEVICE @"ModelDevice"


#define TAG_MSISDN @"MSISDN"
#define TAG_GSSO_TRANSECTION_ID @"GssoTransactionId"
#define TAG_OTP @"OTP"
#define TAG_RADIUS @"Radius"
#define TAG_CURRENT_LATITUDE @"LatCurrent"
#define TAG_CURRENT_LONGITUDE @"LonCurrent"
#define TAG_SERVICE_TYPE @"ServiceType"
#define TAG_PAGE_REQUEST @"Page_Req"
#define TAG_RESULT_PER_PAGE @"Result_per_Page"
#define TAG_SORT_BY @"SortBy"
#define TAG_SORT_TYPE @"SortType"
#define TAG_LANGUAGE @"Language"
#define TAG_VALIDATION_DATE_TIME @"Validation_Date_Time"
#define TAG_BUSINESS_NAME @"BusinessName"
#define TAG_STREET_NAME @"StreetName"
#define TAG_BUILDING_NAME @"BuildingName"
#define TAG_DISTRICT @"District"
#define TAG_SUBDISTRICT @"SubDistrict"
#define TAG_PROVINCE @"Province"
#define TAG_COUNTRY @"Country"
#define TAG_Volume @"Volume"
#define TAG_CCT @"CCT"
#define TAG_ACC @"acc"
#define TAG_ADSPACE @"adSpace"
#define TAG_CLICK_URL @"ClickURL"
#define TAG_USER_AGENT @"ua"


#define TAG_SERVICE_NUMBER @"ServiceNumber"

//Tag Respond
//#define TAG_RES_IV @"Independent"
#define TAG_RES_IV @"ernitialVectee"
//#define TAG_RES_PUBLIC_KEY @"Identify"
#define TAG_RES_PUBLIC_KEY @"peeblickup"
#define TAG_RES_ORDER_REF @"orderRef"
#define TAG_RES_CODE @"resultCode"
#define TAG_RES_DESCRIPTION @"resultDescription"

#define TAG_RES_APP_ENVIRONMENT_TYPE @"appEnvironmentType"

#define TAG_RES_ORDER_ID @"OrderID" //*** Change from TransactionID
//	#define TAG_RES_TRANSACTION_ID @"TransactionID"
#define TAG_RES_CHARGING @"Charging"
#define TAG_RES_REFUND @"Refund"
#define TAG_RES_RESERVE @"Reserve"
#define TAG_RES_RESERVE_ADDITION @"ReserveAddition"
#define TAG_RES_CHANGE_RESERVE @"ChargeReserve"
#define TAG_RES_RELEASE_RESERVE @"ReleaseReserve"
#define TAG_RES_CHARGE_AMOUNT @"AccumulateChargeAmount"
#define TAG_RES_USER_TOKEN @"UserToken"
#define TAG_RES_REFUND_AMOUNT @"AccumulateRefundAmount"
#define TAG_RES_RESERVE_IDENTIFIER @"ReservationIdentifier"
#define TAG_RES_RESERVE_EXPIRE @"ReservationExpiryTime"
#define TAG_RES_RESERVE_AMOUNT @"AccumulateReservedAmount"
#define TAG_RES_CHARGING_CONFIRM_ID @"ChargingConfirmID"


//***** Phase 2.0
#define TAG_RES_VM_URL @"VmUrl"
#define TAG_RES_VM_IP @"VmIP"
#define TAG_RES_MSISDN @"MSISDN"
#define TAG_RES_GSSO_TRANSACTION_ID @"GssoTransactionId"
#define TAG_RES_TOKENID @"TokenID"
#define TAG_RES_USER_STATUS @"UserStatus"
#define TAG_RES_APP_STATUS @"AppStatus"
#define TAG_RES_POLL_INTERVAL_TIME @"Poll_IntervalTime"
#define TAG_RES_PAGE_REQUEST @"Page_Req"
#define TAG_RES_RESULT_PER_PAGE @"Result_per_Page"
#define TAG_RES_TOTAL_RESULT_RETURNED @"Total_Result_Returned"
#define TAG_RES_TOTAL_RESULT_AVAILABLE @"Total_Result_Available"
#define TAG_RES_PRIVILEGE_ID @"PrivID"
#define TAG_RES_PRIVILEGE_NAME @"PrivName"
#define TAG_RES_PRIVILEGE_DESCRIPTION @"PrivDescription"
#define TAG_RES_PRIVILEGE_CATEGORY @"PrivCategory"
#define TAG_RES_PRIVILEGE_CODE @"PrivCode"
#define TAG_RES_PRIVILEGE_PHOTO @"Photo"
#define TAG_RES_POI_ID @"POIID"
#define TAG_RES_LATITUDE_POI @"Latpoi"
#define TAG_RES_LONGITUDE_POI @"Lonpoi"
#define TAG_RES_BIZ_NAME @"BizName"
#define TAG_RES_BRANCH @"Branch"
#define TAG_RES_ADDRESS @"Address"
#define TAG_RES_BUILDING_NAME @"BuildingName"
#define TAG_RES_FLOOR @"Floor"
#define TAG_RES_SOI @"Soi"
#define TAG_RES_STREET @"Street"
#define TAG_RES_SD_NAME @"SDName"
#define TAG_RES_DT_NAME @"DTName"
#define TAG_RES_PV_NAME @"PVName"
#define TAG_RES_REGION @"Region"
#define TAG_RES_POSTCODE @"PostCode"
#define TAG_RES_URL @"www"
#define TAG_RES_COUNTRY @"Country"
#define TAG_RES_TELEPHONE @"Telephone"
//#define TAG_RES_PERMISSION_NAME @"PermissionName"
#define TAG_RES_PERMISSION_NAME @"apiName"

//#define TAG_RES_PERMISSION_STATUS @"PermissionStatus"
#define TAG_RES_PERMISSION_STATUS @"apiAuthenRequire"
#define TAG_RES_TOKEN_KEY @"TokenKey"
#define TAG_RES_IMAGE_URL @"ImgURL"
#define TAG_RES_CLICK_URL @"ClickURL"
#define TAG_RES_BEACON_URL @"BeaconURL"

#define TAG_RES_AUTH_CODE @"authCode"
#define TAG_RES_ACCESS_TOKEN @"accessToken"
#define TAG_RES_AUTH_LEVEL @"authenLevel"
#define TAG_RES_EXPIRE_IN @"expire_in"
#define TAG_RES_ID_TYPE @"idType"
#define TAG_RES_ID_VALUE @"idValue"
#define TAG_RES_LIST_OF_API @"listOfAPI"
#define TAG_RES_OPEN_ID_FLAG @"openIDFlag"
#define TAG_RES_REGISTRATION_LEVEL @"registrationLevel"








#pragma mark - Key Header
#define KEY_HEADER_ORDER_REF            @"x-orderRef"
#define KEY_HEADER_COOKIE               @"cookie"
#define KEY_HEADER_SESSION_ID           @"x-session-id"
#define KEY_HEADER_APP                  @"x-app"
#define KEY_HEADER_USER_ID              @"x-user-id"
#define KEY_HEADER_ACCESS_TOKEN         @"x-access-token"

#pragma mark - Key Request Body
//Request ServiceKeyExchange
#define KEY_REQ_PUBLIC_KEY              @"peeblickup"
#define KEY_REQ_CLIENT_ID               @"ptsClientId"
#define KEY_REQ_BEARER_ID               @"bearerID"
//Request ServiceLogin
#define KEY_REQ_IMEI                    @"imei"
#define KEY_REQ_MAC_ADDRESS             @"mac"
#define KEY_REQ_IMSI                    @"imsi"
//Resuest PushNotification
#define KEY_REQ_USER_ID                 @"userId"
#define KEY_REQ_DEVICE_MODEL            @"deviceModel"
#define KEY_REQ_DEVICE_TOKEN            @"deviceToken"
#define KEY_REQ_APP_ID                  @"appID"
#define KEY_REQ_APP_NAME                @"appName"
#define KEY_REQ_APP_VERSION             @"appVersion"
#define KEY_REQ_PLATFORM                @"platform"
#define KEY_REQ_PLATFORM_VERSION        @"platformVersion"
#define KEY_REQ_EVENT_NAME              @"eventName"
#define KEY_REQ_SENDER                  @"sender"


#pragma mark - Key Response Body
//Response ServiceKeyExchange
#define KEY_RES_PUBLIC_KEY              @"peeblickup"
#define KEY_RES_INITIAL_VECTOR          @"ernitialVectee"
#define KEY_RES_REDIRECT_URL            @"redirectURL"
#define KEY_RES_APP_ENVIRONMENT_TYPE    @"ptsAppEnvironmentType"
//Response ServiceLogin, ServcieKeepAlive
#define KEY_RES_AUTH_CODE               @"authCode"




#pragma mark - Key Request Common

#pragma mark - Key Response Common
#define KEY_RES_ORDER_REF               @"orderRef"
#define KEY_RES_DEV_MESSAGE             @"developerMessage"
#define KEY_RES_USER_MESSAGE            @"userMessage"
#define KEY_RES_RESULT_CODE             @"resultCode"
#define KEY_RES_MORE_INFO               @"moreInfo"






//Response Code
static const int RESPONSE_SUCCESS = 0;
static const int RESPONSE_NOT_FOUND_MOBILE_NUMBER = 304;
static const int RESPONSE_USER_SESSION_EXPIRED = 454;
