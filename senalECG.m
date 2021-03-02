function [bpm,ecg]=senalECG(FC,AmpP,AmpQ,AmpR,AmpS,AmpT)
bpm=60/FC;
[x1,l1]=rectas(0.080*bpm);
[x2,p]=curvas(2*0.134*bpm,AmpP);
[x3,l2]=rectas(0.107*bpm);
[x4,Q]=curvas(0.026*bpm*2,AmpQ);
[x5,R]=curvas(0.080*bpm*2,AmpR);
[x6,S]=curvas(0.037*2*bpm,AmpS);
[x7,L3]=rectas(0.198*bpm);
[x8,T]=curvas(0.241*2*bpm,AmpT);
[x9,L4]=rectas(0.091*bpm);
ecg= horzcat(l1,p,l2,Q,R,S,L3,T,L4);
end