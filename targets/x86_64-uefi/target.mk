KERNEL_COMPILER := clang
KERNEL_LINKER := lld-link

KERNEL_COMPILER_FLAGS += \
	-target x86_64-pc-win32-coff \
	-fshort-wchar \
	-mno-red-zone \
	-fno-stack-protector

KERNEL_LINKER_FLAGS += \
	-subsystem:efi_application \
	-nodefaultlib \
	-entry:UefiMain
