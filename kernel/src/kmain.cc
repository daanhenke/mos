#include <kernel.hh>
#include <arch.hh>

namespace mos::kernel
{
    void KMain()
    {
        arch::InitializeCPU();
    }
}
