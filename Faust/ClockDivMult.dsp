import("stdfaust.lib");

output_clock(input_trigger, input_length, divider, multiplier, output_width) = make_gate
with {
     make_gate             = current_position <= (clock_length * output_width : int);
     current_position(acc) = ba.if(input_trigger | acc >= clock_length, 0, acc + 1) ~ _;
     clock_length          = input_length * multiplier / divider : int;
};


clock_div_mul = (
	      output_clock(trigger, clock_length, clock_div1, clock_mul1, output_width),
	      output_clock(trigger, clock_length, clock_div2, clock_mul2, output_width))
with {
// This can be customised to use different set o
     get_value(n) = (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16) : ba.selectn(16, n);
     clock_div1	  = hslider("Divider1[OWL:A]", 1, 1.0, 16, 1) : int : get_value;
     clock_mul1   = hslider("Multiplier1[OWL:B]", 1.0, 1, 16, 1) : int : get_value;
     clock_div2   = hslider("Divider2[OWL:C]", 1.0, 1, 16, 1) : int : get_value;
     clock_mul2   = hslider("Multiplier2[OWL:D]", 1.0, 1, 16, 1) : int : get_value;
     output_width = hslider("Output width[OWL:E]", 0.01, 0.01, 0.99, 0.01); // Gate width, 1% by default
     trigger      = button("Gate in[OWL:Push]") : ba.impulsify;
     // Count current clock length using an accumulator.
     // On trigger, next accumulator becomes curren value and accumulator gets reset.
     reset(current, acc) = acc' + 1, 0;
     increment(current, acc) = current, acc' + 1;
     clock_length(current, acc) = ba.if(trigger, reset, increment) :> _, !;
     // Current clock length in samples.
//     clock_length(counter) = counter : (_, !);
};

process = clock_div_mul;
