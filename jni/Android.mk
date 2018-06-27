# Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
NDK_TOOLCHAIN_VERSION := clang
LOCAL_MODULE := android_gdnative
LOCAL_CPPFLAGS := -std=c++14
LOCAL_CPP_FEATURES := rtti exceptions
LOCAL_LDLIBS := -llog

LOCAL_SRC_FILES := $(shell find $$PWD"/src" -name "*.cpp" )

LOCAL_C_INCLUDES := \
$(PWD)/godot_headers \
$(PWD)/include \
$(PWD)/include/core

include $(BUILD_SHARED_LIBRARY)
