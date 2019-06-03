classdef task < handle
    properties
        supertask = task.empty()
        subtasks = task.empty()
        i_depend_on = task.empty()
        depends_on_me = task.empty()
        i_start_percent_done = [];
        they_start_percent_done = [];
        materials = item.empty()
        start = datetime(0,0,0,0,0,0)
        dur = 0
        avaliablity
        stop = datetime(0,0,0,0,0,0)
        name
        note
        assigned_to
    end
    
    properties (Constant)
        hours_in_day = 8
        day_start = 9
        gantt_task_height = 0.5
        number_of_workers = 3
        pay_rate = 12.5
    end
    
    methods
        function self = task(name,start,duration)
            self.name = name;
            if nargin >= 2
                self.starts_when(start{:});
            end
            if nargin >= 3
                self.set_time('dur',duration);
            end
        end
        
        function add_subtask(self,tasks)
            for i = 1:length(tasks)
                tasks(i).supertask = self;
                self.subtasks = [self.subtasks,tasks(i)];

                if self.start > tasks(i).start
                    self.set_time('start',tasks(i).start)
                end
                if self.stop < tasks(i).stop
                    self.set_time('stop',tasks(i).stop)
                end
                
                if ~isempty(self.assigned_to) && isempty(tasks(i).assigned_to)
                    tasks(i).assigned_to = self.assigned_to;
                end

                disp("Subtask added to " + self.name + ": " + tasks(i).name)
            end
        end
        
        function set_time(self,change,value,also_change,constant)
            
            if ~exist('also_change','var') || isempty(also_change)
                if strcmp(change,'start')
                    also_change = 'stop';
                elseif strcmp(change,'dur')
                    also_change = 'stop';
                elseif strcmp(change,'stop')
                    also_change = 'dur';
                end
            end
            
            if ~exist('constant','var') || isempty(constant)
                options = ['start','dur','stop'];
                constant = erase(options,{change,also_change});
            end
            
            self.(change) = value;

            self.(also_change) = task.adjust(self.(constant),self.(change));
            if ~isempty(self.supertask)
                if self.supertask.start > self.start
                    self.supertask.set_time('start',self.start)
                end
                if self.supertask.stop < self.stop
                    self.supertask.set_time('stop',self.stop)
                end
            end
            
            for i = 1:length(self.i_depend_on)
                cant_start_until = task.adjust(self.i_depend_on(i).start,ceil(self.i_start_percent_done(i)*self.i_depend_on(i).dur));
                if self.start < cant_start_until
                    self.set_time('start',cant_start_until)
                end
            end
            for i = 1:length(self.depends_on_me)
                cant_start_until = task.adjust(self.start,ceil(self.they_start_percent_done(i)*self.dur));
                if cant_start_until > self.depends_on_me(i).start
                    self.depends_on_me(i).set_time('start',cant_start_until)
                end
            end
        end
        
        function starts_when(self,tasks,percents_done)
            for i = 1:length(tasks)
                self.i_depend_on(end+1) = tasks(i);
                tasks(i).depends_on_me(end+1) = self;
                self.i_start_percent_done(end+1) = percents_done(i);
                tasks(i).they_start_percent_done(end+1) = percents_done(i);
                cant_start_until = task.adjust(tasks(i).start,ceil(percents_done(i)*tasks(i).dur));
                if self.start < cant_start_until
                    self.set_time('start',cant_start_until)
                end
            end
        end
        
        function update(self,project_start,project_end,avaliablity)
            date_list = project_start:hours(1):project_end;
            task_list = self.get_tasks;
            elimination_list = [];
            for i = 1:length(date_list)
                if (date_list(i).Hour > (self.day_start + self.hours_in_day)) || (date_list(i).Hour < self.day_start)
                    elimination_list(end+1) = i; 
                elseif (weekday(date_list(i)) == 7) || (weekday(date_list(i)) == 1)
                    elimination_list(end+1) = i;
                end
            end
            date_list(elimination_list) = [];
            
            number_of_workers = zeros(size(date_list));
            for i =1:length(date_list)
                for j = 1:length(avaliablity)
                    if ~any(on_same_day(avaliablity{j},date_list(i)))
                        number_of_workers(i) = number_of_workers(i) + 1;
                    end
                end
            end
            
            for i = 1:length(date_list)
                disp(i/length(date_list));
                happening = false(size(task_list));
                for j = 1:length(task_list)
                    happening(j) = and(task_list(j).start<date_list(i),date_list(i)<task_list(j).stop);
                end
                tasks_to_move = task_list(happening);
                while length(tasks_to_move)>number_of_workers(i)
                    dependancy_count = zeros(size(tasks_to_move));
                    for j = 1:length(tasks_to_move)
                        dependancy_count(j) = length(tasks_to_move(j).depends_on_me);
                    end
%                     new_start = tasks_to_move(find(dependancy_count==min(dependancy_count),1)).start+hours(1);
%                     if new_start.Hour > (self.day_start+self.hours_in_day)
%                         new_start.Hour = new_start.Hour - (self.day_start+self.hours_in_day)+self.hours_in_day;
%                         new_start.Day = new_start.Day + 1;
% %                         while any(self.number_of_workers)
% %                             
% %                         end
%                     end
                    tasks_to_move(find(dependancy_count==min(dependancy_count),1)).set_time('start',date_list(i+1),'stop','dur');
                    tasks_to_move(find(dependancy_count==min(dependancy_count),1)) = [];
                end
            end
        end
        
        function tasks = get_tasks(self)
            if isempty(self.subtasks)
                tasks = self;
            else
                tasks = task.empty;
                for i = 1:length(self.subtasks)
                    tasks = [tasks,self.subtasks(i).get_tasks];
                end
            end
        end
        
        function [top,bottom,task_count] = gantt(self,max_level,ax,task_count,level)
            if ~exist('max_level','var') || isempty(max_level)
                max_level = Inf;
            end
            
            if ~exist('ax','var') || isempty(ax)
                task_count = 1;
                level = 0;
                set(0,'DefaultFigureWindowStyle','docked');
                figure('Name',self.name + ' Gantt Chart');clf
                ax = axes;
                set(ax, 'Ydir', 'reverse')
                grid on
                ax.YAxis.TickValues = 0;
                ax.YAxis.TickLabels = {self.name + ' Gantt Chart'};
                hold on
            end
            cmap = colormap('lines');
            
            if ~isempty(self.subtasks) && level < max_level
                top = zeros(1,length(self.subtasks));
                bottom = zeros(1,length(self.subtasks));
                for i = 1:length(self.subtasks)
                    [top(i),bottom(i),task_count] = self.subtasks(i).gantt(max_level,ax,task_count,level+1);
                end
                top = max(top) + task.gantt_task_height/2;
                bottom = min(bottom) - task.gantt_task_height/2;
            else
                task_count = task_count + 1;
                top = task_count + task.gantt_task_height/2;
                bottom = task_count - task.gantt_task_height/2;
            end
            
            if level == 0
                ax.Children=ax.Children(end:-1:1);
            else
                fill(ax,[self.start,self.stop,self.stop,self.start],[top,top,bottom,bottom],cmap(level,:),'EdgeColor','k');
                xtickformat('MMM-d')
                try
                    [ax.YAxis.TickValues,I] = sort([ax.YAxis.TickValues,bottom]);
                catch
                    throw =1;
                end
                lables = ax.YAxis.TickLabels;
                lables{end+1} = self.name;
                lables = {lables{I}};
                ax.YAxis.TickLabels = lables;
                ylim(ax,[0,ceil(top)])
            end
        end
        
        function total_cost = budget(self,itemize,level)
            bar(1:53) = '-';
            bar(54:55) = '\n';
            first = false;
            if ~exist('level','var') || isempty(level)
                level = 0;
                fprintf('\n\n\nBudget\n')
                fprintf(bar)
                first = true;
            end
            if ~exist('itemize','var') ||isempty(itemize)
                itemize = true;
            end
            
            indent(1,1:level) = ',';
            fprintf('%-s\n',indent(1:end-1) + self.name)
            
            total_cost = 0;
            for i = 1:length([self.subtasks])
                total_cost = total_cost + self.subtasks(i).budget(itemize,level+1);
            end
            
            if itemize
                count = zeros(size(self.materials));
                for i = 1:length(self.materials)
                    for j = 1:length(self.materials)
                        if isequal(self.materials(i),self.materials(j))
                            count(i) = count(i) + 1 ;
                        end
                    end
                end
                [material,ia,~] = unique(self.materials);
                count = count(ia);
                for i =1:length(material)
                    if count(i) > 1
                        fprintf('%-s, $ %.2f\n',indent + string(count(i))+' x '+material(i).name,material(i).cost*count(i))
                    else
                        fprintf('%-s, $ %.2f\n',indent + material(i).name,material(i).cost)
                    end
                end
            end
            if isempty(self.subtasks)
                hours_cost = self.pay_rate*self.dur;
                total_cost = total_cost + hours_cost;
                fprintf('%-s, $ %.2f\n',indent + string(self.dur)+' x Man Hours',hours_cost)
            end
            
            total_cost = total_cost + sum([self.materials.cost]);
            fprintf('%-s, $ %.2f\n',indent + "TOTAL",total_cost)
            if first
                fprintf(bar);
            end
        end
        
        function [material_list,material_count,total_cost] = bill_of_materials(self,display)
            if ~exist('display','var') || isempty(display),display = true;end
            
            material_list = item.empty;
            material_count = [];
            total_cost = 0;
            for i = 1:length(self.subtasks)
                [new_materials,new_count] = self.subtasks(i).bill_of_materials(false);
                material_list = [material_list,new_materials];
                material_count = [material_count,new_count];
            end
            material_list = [material_list,self.materials];
            material_count = [material_count,ones(size(self.materials))];
            
            count = zeros(size(material_list));
            for i = 1:length(material_list)
                for j = 1:length(material_list)
                    if isequal(material_list(i),material_list(j))
                        count(i) = count(i) +  material_count(j);
                    end
                end
            end
            [material_list,ia,~] = unique(material_list);
            material_count = count(ia);
            for i = 1:length(material_list)
                total_cost = total_cost + material_list(i).cost*material_count(i);
            end
            
            if display
                fprintf('\n\nBill of Materials\n')
                star(1:53) = '*';
                star(54:55) = '\n';
                fprintf(star)
                fprintf('count,name,individual cost,total cost,website\n')
                for i = 1:length(material_list)
                    fprintf('%s, $ %.2f, $ %.2f, %s\n',string(material_count(i))+','+material_list(i).name,material_list(i).cost,material_list(i).cost*material_count(i),material_list(i).where)
                end
                fprintf('%-s, $ %.2f\n','-,TOTAL,-',total_cost)
                fprintf(star)
            end
        end
        
        function task_list(self,list_name)
            task_list = self.get_tasks;
            start_date = [task_list.start];
            [~,I] = sort(start_date);
            task_list = task_list(I);
            task_count = 0;
            bar(1:73) = '-';
            bar(74:75) = '\n';
            if exist('list_name','var') && ~isempty(list_name)
                fprintf('\n\n\n')
                fprintf(list_name)
                fprintf("'s ")
                fprintf('Task List\n')
            end
            fprintf(bar)
            for i = 1:length(task_list)
%                 if(strcmp(task_list(i).name,'Speakers'))
%                     disp(i)
%                 end
                if exist('list_name','var') && ~isempty(list_name)
                    if ~isempty(task_list(i).assigned_to) && contains(task_list(i).assigned_to,list_name,'IgnoreCase',true)
                        fprintf('%-s, %s, %s\n',task_list(i).supertask.name() + ": " + task_list(i).name,datestr(task_list(i).start,'dd-mmm HH:MM'),datestr(task_list(i).stop,'dd-mmm HH:MM'))
                        task_count = task_count + 1;
                    end
                else
                    fprintf('%-s, %s, %s\n',task_list(i).supertask.name() + ": " + task_list(i).name,datestr(task_list(i).start,'dd-mmm HH:MM'),datestr(task_list(i).stop,'dd-mmm HH:MM'))
                    task_count = task_count + 1;
                end
            end
            fprintf('Task Count,%i\n',task_count)
            fprintf(bar)
        end
    end
        
    methods (Static)
        function output = adjust(base1,base2)
            if isa(base1,'datetime') && isa(base2,'datetime')
                start = min(base1,base2);
                stop = max(base1,base2);
                day_count = split(between(start,stop,'Days'),'days');
                day_list = start:stop;
                for i = 1:length(day_list)
                    if ((weekday(day_list(i)) == 1) || (weekday(day_list(i)) == 7))
                        day_count = day_count-1;
                    end
                end
                hours = day_count*task.hours_in_day;
                output = hours + stop.Hour-start.Hour;
            else
                if isa(base1,'double')
                    hours_left = base1;
                    second_date = base2;
                elseif isa(base2,'double')
                    hours_left = base2;
                    second_date = base1;
                end

                while hours_left > task.hours_in_day
                    if ((sign(hours_left) == 1) && (weekday(second_date) == 6)) || ((sign(hours_left) == -1) && (weekday(second_date) == 2))
                        second_date.Day = second_date.Day+sign(hours_left)*3;
                    else
                        second_date.Day = second_date.Day+sign(hours_left);
                    end
                    hours_left = hours_left-sign(hours_left)*task.hours_in_day;
                end

                if (second_date.Hour+hours_left)>(task.day_start + task.hours_in_day)
                    if ((sign(hours_left) == 1) && (weekday(second_date) == 6)) || ((sign(hours_left) == -1) && (weekday(second_date) == 2))
                        second_date.Day = second_date.Day+sign(hours_left)*3;
                    else
                        second_date.Day = second_date.Day+sign(hours_left);
                    end
                    hours_left = ((second_date.Hour+hours_left)-(task.day_start + task.hours_in_day));
                    start_point = task.day_start;
                else
                    start_point = second_date.Hour;
                end
            
                second_date.Hour = start_point+hours_left;
                
                if second_date.Day == 18
                    throw = 1;
                end
                
                output = second_date;
            end
        end
    end
end