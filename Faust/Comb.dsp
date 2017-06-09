import("filter.lib");

maxdel = 12;
md = pow(2, maxdel);

comb_delay = hslider("Comb delay [OWL:A]", 512, 0, 4096, 1);
b0    = hslider("Delay gain [OWL:B]", 1.0, 0, 1, .001);
aN    = hslider("Comb neg FB gain [OWL:C]", 1.0, 0, 1, .001);
//it    = hslider("Interpolate [OWL:C]", 1024, 1, 2048, 1);



process = ffcombfilter(4096, comb_delay, b0), _;
