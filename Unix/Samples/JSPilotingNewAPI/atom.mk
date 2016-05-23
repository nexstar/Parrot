ifeq ("$(TARGET_OS_FLAVOUR)","native")

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CATEGORY_PATH := samples
LOCAL_MODULE := JumpingSumoPilotingNewAPI
LOCAL_DESCRIPTION := Jumping Sumo Piloting

LOCAL_LIBRARIES := \
	libARSAL \
	libARController \
	libARDiscovery \
	ncurses

LOCAL_SRC_FILES := \
	$(call all-c-files-under,.)

include $(BUILD_EXECUTABLE)

endif
