PROJECT_DIR := $(patsubst %/,%,$(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

KERNEL_SOURCE_DIR := $(PROJECT_DIR)/kernel

include $(PROJECT_DIR)/mk/config.mk
include $(PROJECT_DIR)/mk/macros.mk

include $(PROJECT_DIR)/targets/$(ARCH)-$(PLATFORM)/target.mk

include $(KERNEL_SOURCE_DIR)/build.mk

.PHONY: build
build: $(BUILD_TARGETS)

.PHONY: clean
clean:
	rm -r $(PROJECT_DIR)/out
