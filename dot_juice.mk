#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit device configurations
$(call inherit-product, device/xiaomi/juice/device.mk)

# Inherit some common dotOS stuff.
$(call inherit-product, vendor/dot/config/common.mk)
TARGET_INCLUDE_PIXEL_CHARGER  := true
TARGET_SUPPORTS_BLUR := true

# Gapps
#WITH_GAPPS := true
ifeq ($(WITH_GAPPS), true)
TARGET_GAPPS_ARCH := arm64
# Hotword
PRODUCT_PACKAGES += \
    HotwordEnrollmentOKGoogleHEXAGON \
    HotwordEnrollmentXGoogleHEXAGON

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/hotword/hotword-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hotword-hiddenapi-package-whitelist.xml \
    $(LOCAL_PATH)/hotword/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    $(LOCAL_PATH)/hotword/com.android.hotwordenrollment.common.util.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.android.hotwordenrollment.common.util.xml \
    $(LOCAL_PATH)/hotword/com.android.hotwordenrollment.common.util.jar:$(TARGET_COPY_OUT_SYSTEM_EXT)/framework/com.android.hotwordenrollment.common.util.jar
else
#TARGET_GAPPS_ARCH := arm64
endif

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := dot_juice
PRODUCT_DEVICE := juice
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := SM6115
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
