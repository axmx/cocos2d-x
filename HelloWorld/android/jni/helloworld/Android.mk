LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := helloworld

LOCAL_SRC_FILES := main.cpp \
../../../AppDelegate.cpp \
../../../HelloWorldScene.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../../../cocos2dx \
                    $(LOCAL_PATH)/../../../../cocos2dx/platform \
                    $(LOCAL_PATH)/../../../../cocos2dx/include \
                    $(LOCAL_PATH)/../../../../cocos2dx/lua_support \
                    $(LOCAL_PATH)/../../../../CocosDenshion/include \
                    $(LOCAL_PATH)/../../..

# it is used for ndk-r4
# if you build with nkd-r4, uncomment it                    
# LOCAL_LDLIBS := -L$(LOCAL_PATH)/../../libs/armeabi -lcocos2d -llog -lcocosdenshion \
#                -L$(LOCAL_PATH)/../../../../cocos2dx/platform/third_party/android/libraries -lcurl

# it is used for ndk-r5  
# if you build with ndk-r4, comment it  
# because the new Windows toolchain doesn't support Cygwin's drive
# mapping (i.e /cygdrive/c/ instead of C:/)  
LOCAL_LDLIBS := -L$(call host-path, $(LOCAL_PATH)/../../libs/armeabi) \
                -lcocos2d -llog -lcocosdenshion \
                -L$(call host-path, $(LOCAL_PATH)/../../../../cocos2dx/platform/third_party/android/libraries) -lcurl
            
include $(BUILD_SHARED_LIBRARY)