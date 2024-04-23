#
# Copyright (C) 2020-2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
TARGET_SUPPORTS_OMX_SERVICE := false
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

# Inherit from surya device
$(call inherit-product, device/xiaomi/surya/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Sony Dolby
TARGET_SHIPS_SOUND_ENHANCEMENT := true

# Project Matrixx
MATRIXX_BUILD_TYPE := Official
MATRIXX_MAINTAINER := shoya0x00

# Project Matrixx Extra
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_EXCLUDES_AUDIOFX := true

# GMS
WITH_GMS ?= true
ifeq ($(WITH_GMS),true)
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_STOCK_AICORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_WALLEFFECT := true
TARGET_CALL_RECORDING_SUPPORTED := true
WITH_GMS_COMMS_SUITE := true
endif

# Disable Matlog
ifneq ($(TARGET_BUILD_VARIANT),eng)
TARGET_DISABLE_MATLOG := true
endif

PRODUCT_NAME := lineage_surya
PRODUCT_DEVICE := surya
PRODUCT_BRAND := POCO
PRODUCT_MODEL := M2007J20CG
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="surya_global-user 12 RKQ1.211019.001 V14.0.2.0.SJGMIXM release-keys" \
    BuildFingerprint=POCO/surya_global/surya:12/RKQ1.211019.001/V14.0.2.0.SJGMIXM:user/release-keys

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
