function [gd_cr,gd_cm,gda_cr,gda_cm,gdm_cr,gdm_cm,rp_cr,rp_cm,scg_cr,scg_cm] = optimise(x,y)

[gd_cr,gd_cm] = optimise_traingd(x,y);
[gda_cr,gda_cm] = optimise_traingda(x,y);
[gdm_cr,gdm_cm] = optimise_traingdm(x,y);
[rp_cr,rp_cm] = optimise_trainrp(x,y);
[scg_cr,scg_cm] = optimise_trainscg(x,y);

end





