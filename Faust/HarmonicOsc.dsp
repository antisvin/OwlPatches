import("oscillator.lib");
import("math.lib");
import("music.lib");
import("filter.lib");


max_partials = 20;

freq         = hslider("Frequency [OWL:PARAMETER_A]", 220, 20, 2000, .0001);
detune 	     = 0;
num_partials = hslider("Partials [OWL:PARAMETER_B]", max_partials, 1, max_partials, 1);
width	     = hslider("Width [OWL:PARAMETER_C]", 1, 1, 5, .001) : smooth(0.99);
part_bal     = hslider("Partials balance [OWL:PARAMETER_D]", 0.5, 0, 1, .0001) : smooth(0.99);


oscp2(freq,p) = os.oscsin(freq) * cos(p) + osccos(freq) * sinp);

partial(i, phase_mod) = if(i < num_partials, partial_osc, 0)
with {
     partial_osc = oscp(p_freq, (phase + phase_mod) * 2 * PI) * amp;
     p_freq      = freq * part * (1 + if(part % 2, 1, -1) * detune * i);
     part        = (i * width) : int + 1;
     amp         = amp_level / part;
     amp_level   = if(i % 2, 1 - part_bal, part_bal);
     phase       = p_freq / SR : (+ : decimal) ~ _;

};


harm_osc(phase_mod) = par(i, max_partials, partial(i, phase_mod));


process = harm_osc :> (+) : *(1 - part_bal + sqrt(width) / 2) / 2;

