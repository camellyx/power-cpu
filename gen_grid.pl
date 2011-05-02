$grid_size = 10;

for ($i=1;$i<=$grid_size;$i++) {
	for ($j=1;$j<=$grid_size;$j++) {
		$core_num=$grid_size*($i-1)+$j;
		print "*** core #$core_num ***\n";
		#generating vdd line
		print "Rc_p_$i\_$j 1 net_Rc_p_$i\_$j Rc\n";
		print "Lc_p_$i\_$j net_Rc_p_$i\_$j net_Lc_p_$i\_$j Lc\n\n";
		#generating Idc
		print "Idc_$i\_$j net_Lc_p_$i\_$j net_Lc_g_$i\_$j Icurrent\n\n";
		#generating gnd line
		print "Lc_g_$i\_$j net_Lc_g_$i\_$j net_Rc_g_$i\_$j Lc\n";
		print "Rc_g_$i\_$j net_Rc_g_$i\_$j 8 Rc\n\n";
		#generating coupling cap line
		print "Lc_C_$i\_$j 1 net_Lc_C_$i\_$j Lc_C\n";
		print "Cc_$i\_$j net_Lc_C_$i\_$j net_Cc_$i\_$j Cc\n";
		print "Rc_C_$i\_$j net_Cc_$i\_$j 8 Rc_C\n\n";
	}
}

for ($i=1;$i<=$grid_size;$i++) {
	for ($j=1;$j<$grid_size;$j++) {
		$j_plus_one = $j+1;
		print "*** core($i, $j) & core($i, $j_plus_one) ***\n";
		print "Rh_p_$i\_$j net_Lc_p_$i\_$j net_Rh_p_$i\_$j Ri\n";
		print "Lh_p_$i\_$j net_Rh_p_$i\_$j net_Lh_p_$i\_$j Li\n";
		print "Lh_p_$i\_$j net_Lh_p_$i\_$j net_Lc_p_$i\_$j_plus_one Ci\n\n";
		print "Rh_g_$i\_$j net_Lc_g_$i\_$j net_Rh_g_$i\_$j Ri\n";
		print "Lh_g_$i\_$j net_Rh_g_$i\_$j net_Lh_g_$i\_$j Li\n";
		print "Lh_g_$i\_$j net_Lh_g_$i\_$j net_Lc_g_$i\_$j_plus_one Ci\n\n";
	}
}

for ($i=1;$i<$grid_size;$i++) {
	for ($j=1;$j<=$grid_size;$j++) {
		$i_plus_one = $i+1;
		print "*** core($i, $j) & core($i_plus_one, $j) ***\n";
		print "Rv_p_$i\_$j net_Lc_p_$i\_$j net_Rv_p_$i\_$j Ri\n";
		print "Lv_p_$i\_$j net_Rv_p_$i\_$j net_Lv_p_$i\_$j Li\n";
		print "Lv_p_$i\_$j net_Lv_p_$i\_$j net_Lc_p_$i_plus_one\_$j Ci\n\n";
		print "Rv_g_$i\_$j net_Lc_g_$i\_$j net_Rv_g_$i\_$j Ri\n";
		print "Lv_g_$i\_$j net_Rv_g_$i\_$j net_Lv_g_$i\_$j Li\n";
		print "Lv_g_$i\_$j net_Lv_g_$i\_$j net_Lc_g_$i_plus_one\_$j Ci\n\n";
	}
}
