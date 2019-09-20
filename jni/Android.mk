# Android.mk
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
ifeq ($(SC_CLANG), true)
	NDK_TOOLCHAIN_VERSION := clang
else
	NDK_TOOLCHAIN_VERSION := gcc
endif
LOCAL_MODULE := libgodot
LOCAL_CPPFLAGS := -std=c++17 -fPIC
LOCAL_CPP_FEATURES := rtti exceptions
LOCAL_LDLIBS := -llog

ifeq ($(SC_TARGET),debug)
	LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS) -g3 -Og
else
	LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS) -O3
endif

LOCAL_SRC_FILES := $(shell find $$PWD"/src" -name "*.cpp" )

LOCAL_C_INCLUDES := \
$(PWD)/godot_headers \
$(PWD)/include \
$(PWD)/include/gen \
$(PWD)/include/core

include $(BUILD_SHARED_LIBRARY)
