#include <math.h>

double baseFreq = 0.5;

double wave1(t)
{
    return sin(t*baseFreq);
}

double wave2(t)
{
    return sin(t*baseFreq*2);
}

double wave3(t)
{
    return sin(t*baseFreq*3);
}

double wave4(t)
{
    return sin(t*baseFreq*4);
}

main(t)
{
    for (t=0;;t++)
    {
        // left
        putchar((int)(
            12*(wave1(t)) + exp(t/1000000.)*cos(t/20000.0)
        ));
        // right
        putchar((int)(
            12*(wave1(t)) + exp(t/1000000.)*sin(t/20000.0)
        ));
    }
}
