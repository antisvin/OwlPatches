import("stdfaust.lib");

process = pm.clarinetModel(freq : pm.f2l, pressure, reedStiffness, bellOpening)
with{
        freq = hslider("Frequency[OWL:PARAMETER_A]",440,50,1000,0.01);
	reedStiffness = hslider("Reed stiffnes[OWL:PARAMETER_B]",0.5,0,1,0.01);
        bellOpening = hslider("Bell opening[OWL_PARAMETER_C]",0.5,0,1,0.01);
        breathGain = hslider("Breath gain[OWL:PARAMETER_D]", 0.1,0,1,0.01)*0.05;
        pressure = hslider("pressure[OWL:PARAMETER_E]", 0, 0, 1, 0.01) : si.smoo;
        blow = pm.blower(pressure, 0.05, breaathGain,vibratoFreq,vibratoGain);
	// Don't bother with vibrato - we can modulate frequency instead
	vibratoFreq = 0.1;
	vibratoGain = 0.1;
};
