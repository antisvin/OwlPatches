ba = library("basic.lib");
fi = library("filter.lib");
si = library("signal.lib");


maxdel = 14;
md = pow(2, maxdel);

delay = hslider("Comb delay[OWL:PARAMETER_A]", 256, 0, md, 1);
aN    = hslider("Comb neg FB gain[OWL:PARAMETER_B]", 1, 0, 1, .001);
it    = hslider("Interpolation[OWL:PARAMETER_C]", 1024, 1, 2048, 1);
mix   = hslider("Mix[OWL:PARAMETER_D]",0.5,0,1,0.01) : si.smooth(ba.tau2pole(0.005));


process(l, r) = l, r <: *(1 - mix),  *(1 - mix),  fi.allpass_comb(md : int, delay : int, aN) * mix, fi.allpass_comb(md : int, delay : int, aN) * mix :> _ , _;
