function t_matrix = tTest(dt,ann,cbr)

    empty = struct;
    empty.tstat = 0;
    empty.df = 0;
    empty.sd = 0;
    
    t_matrix = repmat(make_node('','','',empty),6,3);

    dt = error_rate(dt);
    ann = error_rate(ann);
    cbr = error_rate(cbr);
    
    for i = 1:6
        [h,p,ci,stats] = ttest2(dt(i, :), ann(i, :), 'alpha', 0.01667);
        t_matrix(i, 1) = make_node(h, p, ci, stats);
    end

    for i = 1:6
        [h,p,ci,stats] = ttest2(dt(i, :), cbr(i, :), 'alpha', 0.01667);
        t_matrix(i, 2) = make_node(h, p, ci, stats);
    end

    for i = 1:6
        [h,p,ci,stats] = ttest2(ann(i, :), cbr(i, :), 'alpha', 0.01667);
        t_matrix(i, 3) = make_node(h, p, ci, stats);
    end
    
end

function node = make_node(h,p,ci,stats)
    node = struct;
    node.h = h;
    node.p = p;
    node.ci = ci;
    node.tstat = stats.tstat;
    node.df = stats.df;
    node.sd = stats.sd;
end




