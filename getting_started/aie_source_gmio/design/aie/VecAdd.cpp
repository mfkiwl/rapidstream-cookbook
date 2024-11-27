
#include <adf.h>
#include "VecAdd.h"

VecAdd gr;
int main(int argc, char ** argv)
{
    const int BLOCK_SIZE=256;
    int32 *inputArray=(int32*)adf::GMIO::malloc(BLOCK_SIZE*sizeof(int32));
    int32 *outputArray=(int32*)adf::GMIO::malloc(BLOCK_SIZE*sizeof(int32));
    // provide input data to AI Engine in inputArray
    for (int i=0; i<BLOCK_SIZE; i++) {
        inputArray[i] = i;
    }
gr.init();
    gr.gmioIn.gm2aie_nb(inputArray, BLOCK_SIZE*sizeof(int32));
    gr.gmioOut.aie2gm_nb(outputArray, BLOCK_SIZE*sizeof(int32));
    gr.run(1);
    gr.gmioOut.wait();
    adf::GMIO::free(inputArray);
    adf::GMIO::free(outputArray);
    gr.end();
}
