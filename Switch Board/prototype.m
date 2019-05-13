clear all
clc

rng default

dimensions = [5,10];

start = [5,1];
stop = [1,10];

figure(1),clf
hold on
axis([0,dimensions(2)+1,0,dimensions(1)+1])
set(gca,'YDir','reverse')

points = zeros(dimensions);

x_names = 1:27;
y_names = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

for i = 1:dimensions(1)
    for j = 1:dimensions(2)
        x = rand*(dimensions(2)-1)+1;
        y = rand*(dimensions(1)-1)+1;
        points(i,j,1:2) = [x,y];
    end
end

for i = 1:dimensions(1)
    for j = 1:dimensions(2)
        if i>1,plot([points(i-1,j,1),points(i,j,1)],[points(i-1,j,2),points(i,j,2)],'-k'),end
        if j>1,plot([points(i,j-1,1),points(i,j,1)],[points(i,j-1,2),points(i,j,2)],'-k'),end
        if i>1 && j>1,plot([points(i-1,j-1,1),points(i,j,1)],[points(i-1,j-1,2),points(i,j,2)],'-k'),end
        if i<dimensions(1),plot([points(i+1,j,1),points(i,j,1)],[points(i+1,j,2),points(i,j,2)],'-k'),end
        if j<dimensions(2),plot([points(i,j+1,1),points(i,j,1)],[points(i,j+1,2),points(i,j,2)],'-k'),end
        if i<dimensions(1) && j<dimensions(2),plot([points(i+1,j+1,1),points(i,j,1)],[points(i+1,j+1,2),points(i,j,2)],'-k'),end
        if i>1 && j<dimensions(2),plot([points(i-1,j+1,1),points(i,j,1)],[points(i-1,j+1,2),points(i,j,2)],'-k'),end
        if j>1 && i<dimensions(1),plot([points(i+1,j-1,1),points(i,j,1)],[points(i+1,j-1,2),points(i,j,2)],'-k'),end
    end
end

for i = 1:dimensions(1)
    for j = 1:dimensions(2)
        text(points(i,j,1),points(i,j,2),y_names(i)+string(x_names(j)))
    end
end

position = start;
new_position = start;
step = 0;
while any(position ~= stop)
    step = step + 1;
    boarders = zeros(2,2);
    if position(1)>1,boarders(1,1) = -1;end
    if position(2)>1,boarders(2,1) = -1;end
    if position(1)<dimensions(1),boarders(1,2) = 1;end
    if position(2)<dimensions(2),boarders(2,2) = 1;end
    move(1) = randi(boarders(1,:));
    move(2) = randi(boarders(2,:)); 
    new_position = position + move;
    plot([points(position(1),position(2),1),points(new_position(1),new_position(2),1)],[points(position(1),position(2),2),points(new_position(1),new_position(2),2)],'-b',"LineWidth",1.5)
    position = new_position;
    disp(step)
end

