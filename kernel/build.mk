KERNEL_TARGET := $(OBJ_DIR)/kernel/mos-kernel.efi
BUILD_TARGETS += $(KERNEL_TARGET)

KERNEL_SOURCES := \
	$(KERNEL_SOURCE_DIR)/src/kmain.cc \
	$(KERNEL_SOURCE_DIR)/src/arch/x86_64/init.cc \
	$(KERNEL_SOURCE_DIR)/src/boot/uefi/entry.cc

KERNEL_INCLUDE_DIRS := \
	$(KERNEL_SOURCE_DIR)/include

KERNEL_COMPILER_FLAGS += $(GENERIC_COMPILER_FLAGS)
KERNEL_COMPILER_FLAGS += $(addprefix -I,$(KERNEL_INCLUDE_DIRS))

KERNEL_OBJECTS := $(addsuffix .o,$(patsubst $(PROJECT_DIR)/%,$(OBJ_DIR)/kernel/%,$(KERNEL_SOURCES)))

$(OBJ_DIR)/kernel/%.o: $(PROJECT_DIR)/%
	$(call ensure-parent-path-exists,$@)
	$(KERNEL_COMPILER) \
		$(KERNEL_COMPILER_FLAGS) \
		-o $@ \
		-c $< \

$(KERNEL_TARGET): $(KERNEL_OBJECTS)
	$(call ensure-parent-path-exists,$@)
	$(KERNEL_LINKER) $(KERNEL_LINKER_FLAGS) -out:$@ $^
