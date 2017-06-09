import("filter.lib");
import("effect.lib");

threshold   = hslider("threshold [OWL:PARAMETER_A]", .8, 0, 1, .001);


wavefold(sample) = select2(abs(sample) > threshold, sample, fold(sample)) / (sqrt(threshold))
with {
     fold(sample) = abs(abs(fmod((sample - threshold), (threshold * 4.0))) - (threshold * 2.0)) - threshold;
};

process =  wavefold, wavefold;
