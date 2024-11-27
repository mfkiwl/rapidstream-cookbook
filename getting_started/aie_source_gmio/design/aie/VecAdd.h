#include "weighted_sum.h"

using namespace adf;

class VecAdd: public adf::graph
{
private:
  adf::kernel k_m;
public:
  adf::output_gmio gmioOut;
  adf::input_gmio gmioIn;
  VecAdd()
  {
    k_m = adf::kernel::create(weighted_sum);
    gmioOut = adf::output_gmio::create("gmioOut", 64, 1000);
    gmioIn = adf::input_gmio::create("gmioIn", 64, 1000);
    adf::connect<adf::window<1024,32>>(gmioIn.out[0], k_m.in[0]);
    adf::connect<adf::window<1024>>(k_m.out[0], gmioOut.in[0]);
    adf::source(k_m) = "weighted_sum.cc";
    adf::runtime<adf::ratio>(k_m)= 0.9;
}; };
