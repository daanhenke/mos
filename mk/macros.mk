BUILD_TARGETS :=
# TODO: Make add-build-target macro

MKDIR := mkdir
define ensure-parent-path-exists
	$(MKDIR) -p $(dir $1)
endef
