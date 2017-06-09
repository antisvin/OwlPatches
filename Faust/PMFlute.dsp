import("stdfaust.lib");

process = pm.fluteModel(freq : pm.f2l, mouthPosition, pressure), 0
with{
        freq = hslider("Frequency[OWL:PARAMETER_A]",440,50,1000,0.01);
	mouthPosition = hslider("Mouth position[OWL:PARAMETER_B]",0.5,0,1,0.01);
        pressure = hslider("pressure[OWL:PARAMETER_C]", 0, 0, 1, 0.01) : si.smoo;
        blow = pm.blower(pressure, 0.05, breathGain,vibratoFreq,vibratoGain);
	vidratoFreq = hslider("Vibrato freq[OWL:PARAMETER_D]",0.1,0,10,0.01)*0.05;
	vibratoGain = 0.1;
	breathGain = hslider("Breath gain[OWL:PARAMETER_E]",0.1,0,1,0.01)*0.05;
};
