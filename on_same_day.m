function output = on_same_day(day1,day2)
    output = false(size(day1));
    for i = 1:length(output)
        if (day1(i).Day == day2.Day) && (day1(i).Month == day2.Month) && (day1(i).Year == day2.Year)
            output(i) = true;
        end
    end
end