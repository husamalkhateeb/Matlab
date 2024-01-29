fx1 = @(x) (x^4) + 3.*(x.^3) - 2.*(x^2);
untitled(fx1,-2.7,-2.5,-2.4)

function[xe] = untitled(func,x1,x2,x3)
%the function accepts a function handle and the 3 points we want to operate
%on, and returns the point that is the root
%a formula
a = (((x2-x3).*func(x1)) + ((x3-x1).*func(x2)) + ((x1-x2).*func(x3)))/(x1-x2).*((x1.*x2)-(x1.*x3)-(x2.*x3) + (x3.^2))

es = 0.01;
xe = 0;

while 1
%we enter the loop and calculate xe
    xe = ((0.5).*(((x2.^2 - x3.^2).*func(x1))+((x3.^2-x1.^2).*func(x2))+((x1.^2-x2.^2).*func(x3))))/(((x2 - x3).*func(x1))+((x3-x1).*func(x2))+((x1-x2).*func(x3)));
    % here we check a if its bigger or smaller than 0 to find if its a
    % minimum or a maximum
    if a > 0
        %this if statement to check if we reached es yet or not
        if (abs((x1 - xe)/xe) < es) || (abs((x2 - xe)/xe) < es) || (abs((x3 - xe)/xe) < es)
            break
            %these if statement to check which one of the points have the
            %highest value so we can replace it with xe
        elseif func(x1) >= func(x2) && func(x1)>= func(x3)
            x1 = xe;
        elseif func(x2) >= func(x1) && func(x2) >= func(x3)
            x2 = xe;
        elseif func(x3) > func(x2) && func(x3) >= func(x1)
            x3 = xe;
        end

    % here we check a if its bigger or smaller than 0 to find if its a
    % minimum or a maximum
    elseif a < 0
        %this if statement to check if we reached es yet or not
        if (abs((x1 - xe)/xe) < es) || (abs((x2 - xe)/xe) < es) || (abs((x3 - xe)/xe) < es)
            break
            %these if statement to check which one of the points have the
            %lowest value so we can replace it with xe
        elseif func(x1) <= func(x2) && func(x1)>= func(x3)
            x1 = xe;
        elseif func(x2) <= func(x1) && func(x2) >= func(x3)
            x2 = xe;
        elseif func(x3) <= func(x2) && func(x3) >= func(x1)
            x3 = xe;
        end
    end


end
disp(xe)
disp(func(xe))
end

