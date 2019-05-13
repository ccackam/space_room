clear all
clc

code = 'BR3@DM@K3SY0UF@T';
input_code = '';
tries = 5108962345;

while 1
    fprintf("\n\nCaptian's Computer")
    input_code = input("\nType Password then press enter: ",'s');
    
    if strcmp(code,input_code)
        fprintf("\nAccess Granted!\n")
        break
    else
        tries = tries - 1;
        fprintf('\nIncorrect! You have %i tries left.',tries);
    end
end