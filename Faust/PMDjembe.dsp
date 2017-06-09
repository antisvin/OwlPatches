import("stdfaust.lib");

process = audio <: _, an.amp_follower(follower_release)
with{
        audio = pm.djembe(freq,strikePosition,strikeSharpness,gain,gate);
	follower_release = 0.1; // in seconds
        freq = hslider("Frequency[OWL:A]",20,50,100,0.01);
        gain = hslider("Gain[OWL:B]",1,0,1,0.01);
        strikePosition = hslider("Strike Position[OWL:C]",0.5,0,1,0.01);
        strikeSharpness = hslider("Strike Sharpness[OWL:D]",0.5,0.01,5,0.01);
        gate = button("Gate[OWL:Push]");
};

