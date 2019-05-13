clear all
clc

code = [7,3];

while 1
    fprintf('\n\n-------------------------');
    fprintf('\nTeleporter Position')
    fprintf('\nEnter X Position in')
    fprintf('\nlight years (ly).')
    fprintf('\nThen press Enter.')
    
    x = input('\nX = ');
    
    fprintf('\n\nTeleporter Position')
    fprintf('\nEnter Y Position in')
    fprintf('\nlight years (ly).')
    fprintf('\nThen press Enter.')
    
    y = input('\nY = ');
    
    if isempty(x)
        x = Inf;
    end
    if isempty(y)
        y = Inf;
    end
    
    if (x == code(1)) && (y == code(2))
        fprintf('\n\nTeleporter Position')
        fprintf('\nCorrect!\n')
        break
    else
        fprintf('\n\nTeleporter Position')
        fprintf('\nIncorrect!')
        fprintf('\nPlease try again.')
    end
    
end