
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := tuna_hdcp_keys
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE
LOCAL_MODULE_SUFFIX := -timestamp

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): HDCP_KEYS_FILE := /factory/hdcp.keys
$(LOCAL_BUILT_MODULE): SYMLINK := $(TARGET_OUT_VENDOR)/firmware/hdcp.keys
$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Symlink: $(SYMLINK) -> $(HDCP_KEYS_FILE)"
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(SYMLINK))
	$(hide) rm -rf $@
	$(hide) rm -rf $(SYMLINK)
	$(hide) ln -sf $(HDCP_KEYS_FILE) $(SYMLINK)
	$(hide) touch $@

include $(call all-makefiles-under,$(LOCAL_PATH))
