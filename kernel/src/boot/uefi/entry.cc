#include <kernel.hh>

namespace mos::kernel::uefi
{
    extern "C" void* UefiMain(void*,void*)
    {
        KMain();
        return nullptr;
    }
}
