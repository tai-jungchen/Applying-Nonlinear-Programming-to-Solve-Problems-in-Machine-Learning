function IniPortfolio
    p_s=zeros(1,43);
    p_b=zeros(1,43);
    p_m=zeros(1,43);
    p_s=[26.81,-8.78,22.69,16.36,12.36,-10.10,23.94,11.00,-8.47,3.94,14.30,18.99,-14.69,-26.47,37.23,23.93,-7.16,6.57,18.61,32.50,-4.92,21.55,22.56,6.27,31.17,18.67,5.25,16.61,31.69,-3.10,30.46,7.62,10.08,1.32,37.58,22.96,33.36,28.58,21.04,-9.10,-11.89,-22.10,29.68]
    p_s=0.01.*p_s
    p_b=[0.1042,0.0397,0.0419,0.0520,0.0904,0.0970,0.0903,0.0746,0.0823,0.0622,0.0981,0.0536,0.0934,0.0532,0.0680,0.0885,0.1009,0.0450,0.1129,0.1006,0.0774,0.0734,0.0742,0.0830,0.0792,0.0824,0.1039,0.1021,0.0900,0.0688,0.1034,0.0811,0.0666,0.1136,0.1086,0.0825,0.0883,0.0855,0.0551,0.0626,0.0762,0.0569,0.01060]
    %for i=1:43
    %   p_b(i)=3.85+8*rand(1)
    %end
    p_m=[2.33,2.93,3.38,3.85,4.32,5.40,4.51,6.02,8.97,4.90,4.14,5.33,9.95,8.53,5.20,4.65,6.56,10.03,13.78,18.90,12.37,8.95,9.47,8.38,8.27,6.91,6.77,8.76,8.45,7.31,4.43,2.92,2.96,5.45,5.60,5.29,5.50,4.68,5.30,6.40,1.82,1.24,0.98]
    p_m=0.01.*p_m
    r_s=mean(p_s)     %arithmetic mean
    r_b=mean(p_b)
    r_m=mean(p_m)
    t_s=1;t_b=1;t_m=1;
    cov_sb=0;cov_sm=0;cov_bm=0;
    cov_ss=0;cov_bb=0;cov_mm=0;
    for i=1:43
        t_s=(1+p_s(i))*t_s;
        t_b=(1+p_b(i))*t_b;
        t_m=(1+p_m(i))*t_m;
        cov_sb=cov_sb+(p_s(i)-r_s)*(p_b(i)-r_b);
        cov_sm=cov_sm+(p_s(i)-r_s)*(p_m(i)-r_m);
        cov_bm=cov_bm+(p_b(i)-r_s)*(p_m(i)-r_m);
        cov_ss=cov_ss+(p_s(i)-r_s)^2;
        cov_bb=cov_bb+(p_b(i)-r_b)^2;
        cov_mm=cov_mm+(p_m(i)-r_m)^2;
    end
    mu_s=t_s^(1/43)-1,mu_b=t_b^(1/43)-1,mu_m=t_m^(1/43)-1    %geometric mean
    cov_sb=cov_sb/43,cov_sm=cov_sm/43,cov_bm=cov_bm/43      %covariance
    cov_bb=cov_bb/43,cov_ss=cov_ss/43,cov_mm=cov_mm/43
end