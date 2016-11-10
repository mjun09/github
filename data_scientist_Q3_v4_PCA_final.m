%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Q3: This question is required.

%% Propose a project to do while at The Data Incubator. 
% We want to know about your ability to think at a high level. 
% Try to think of projects that users or businesses will care about that are also relatively unanalyzed. 
% Here are some useful links about data sources on our blog as well as the archive of data sources on Data is Plural. 
% You can see some final projects of previous Fellows on our YouTube Page.

%% Propose a project that uses a large, publicly accessible dataset. Explain your motivation for tackling this problem, 
% discuss the data source(s) you are using, and explain the analysis you are performing. 
% At a minimum, you will need to do enough exploratory data analysis to convince someone 
% that the project is viable and generate two interesting non-trivial plots supporting this. 
% The most impressive applicants have even finished a "rough draft" of their projects and 
% have derived non-obvious meaningful conclusions from their data. Explain the plots and give url links to them. 
% Here are some factors to consider:


% # Attributes for both student-mat.csv (Math course) and student-por.csv (Portuguese language course) datasets:
% 1 school - student's school (binary: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)
% 2 sex - student's sex (binary: "F" - female or "M" - male)
% 3 age - student's age (numeric: from 15 to 22)
% 4 address - student's home address type (binary: "U" - urban or "R" - rural)
% 5 famsize - family size (binary: "LE3" - less or equal to 3 or "GT3" - greater than 3)
% 6 Pstatus - parent's cohabitation status (binary: "T" - living together or "A" - apart)
% 7 Medu - mother's education (numeric: 0 - none,  1 - primary education (4th grade), 2 ? 5th to 9th grade, 3 ? secondary education or 4 ? higher education)
% 8 Fedu - father's education (numeric: 0 - none,  1 - primary education (4th grade), 2 ? 5th to 9th grade, 3 ? secondary education or 4 ? higher education)
% 9 muob - mother's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
% 10 Fjob - father's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
% 11 reason - reason to choose this school (nominal: close to "home", school "reputation", "course" preference or "other")
% 12 guardian - student's guardian (nominal: "mother", "father" or "other")
% 13 traveltime - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)
% 14 studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
% 15 failures - number of past class failures (numeric: n if 1<=n<3, else 4)
% 16 schoolsup - extra educational support (binary: yes or no)
% 17 famsup - family educational support (binary: yes or no)
% 18 paid - extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
% 19 activities - extra-curricular activities (binary: yes or no)
% 20 nursery - attended nursery school (binary: yes or no)
% 21 higher - wants to take higher education (binary: yes or no)
% 22 internet - Internet access at home (binary: yes or no)
% 23 romantic - with a romantic relationship (binary: yes or no)
% 24 famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
% 25 freetime - free time after school (numeric: from 1 - very low to 5 - very high)
% 26 goout - going out with friends (numeric: from 1 - very low to 5 - very high)
% 27 Dalc - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
% 28 Walc - weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
% 29 health - current health status (numeric: from 1 - very bad to 5 - very good)
% 30 absences - number of school absences (numeric: from 0 to 93)
% 
% # these grades are related with the course subject, Math or Portuguese:
% 31 G1 - first period grade (numeric: from 0 to 20)
% 31 G2 - second period grade (numeric: from 0 to 20)
% 32 G3 - final grade (numeric: from 0 to 20, output target)
% 
% Additional note: there are several (382) students that belong to both datasets . 
% These students can be identified by searching for identical attributes
% that characterize each student, as shown in the annexed R file.


% filename='student-mat.csv';
filename='student-mat.mat';

if 0
    load(filename);
end

%% data initialization;
features_no=33;
case_max=395;
case_no=300; % around '80%' of case_max

if 1
    X=cell(1); %features
    normX=cell(1); %normalized features
    labels=cell(1,2);
    figure_order=0;
    
    %% 1 school - student's school (binary: "GP" - Gabriel Pereira or "MS" - Mousinho da Silveira)
%     figure_order=figure_order+1;
%     my_var=school;
%     my_str='GP';
%     for i=1:case_max
%         if strcmp(my_var{i},my_str)
%             X{figure_order}(i)=1;
%         else
%             X{figure_order}(i)=-1;
%         end
%     end
%     % normalization
%     mu=mean(X{figure_order});
%     sigma=std(X{figure_order});
%     if sigma==0
%         normX{figure_order}=(X{figure_order}-mu)/sigma;
%         % labeling
%         labels{figure_order,1}='school';
%         labels{figure_order,2}='(GP) vs. MS';    
%     else        
%         X{figure_order}=[];
%         figure_order=figure_order-1;
%     end

    %% 2 sex - student's sex (binary: "F" - female or "M" - male)
    figure_order=figure_order+1;
    my_var=sex;
    my_str='F';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end    
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='sex';
    labels{figure_order,2}='(F) vs. M';    

    %% 3 age - student's age (numeric: from 15 to 22)
    figure_order=figure_order+1;
    X{figure_order}=age;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='age';
    labels{figure_order,2}='15 to 22';    
  
    %% 4 address - student's home address type (binary: "U" - urban or "R" - rural)
    figure_order=figure_order+1;
    my_var=address;
    my_str='U';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='address';
    labels{figure_order,2}='(U) vs. R';    

    %% 5 famsize - family size (binary: "LE3" - less or equal to 3 or "GT3" - greater than 3)
%     figure_order=figure_order+1;
%     my_var=famsize;
%     my_str='LE3';
%     for i=1:case_max
%         if my_var(i)<=3
%             X{figure_order}(i)=1;
%         else
%             X{figure_order}(i)=-1;
%         end
%     end
%     % normalization
%     mu=mean(X{figure_order});
%     sigma=std(X{figure_order});
%     if sigma==0
%         normX{figure_order}=(X{figure_order}-mu)/sigma;
%         % labeling
%         labels{figure_order,1}='famsize';
%         labels{figure_order,2}='(LE3) vs. GT3';    
%     else        
%         X{figure_order}=[];
%         figure_order=figure_order-1;
%     end
    
    %% 6 Pstatus - parent's cohabitation status (binary: "T" - living together or "A" - apart)
    figure_order=figure_order+1;
    my_var=Pstatus;
    my_str='T';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Pstatus';
    labels{figure_order,2}='(T) vs. A';    

    %% 7 Medu - mother's education (numeric: 0 - none,  1 - primary education (4th grade), 2 ? 5th to 9th grade, 3 ? secondary education or 4 ? higher education)
    figure_order=figure_order+1;
    X{figure_order}=Medu;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Medu';
    labels{figure_order,2}='0 to 4';    
    
    %% 8 Fedu - father's education (numeric: 0 - none,  1 - primary education (4th grade), 2 ? 5th to 9th grade, 3 ? secondary education or 4 ? higher education)
    figure_order=figure_order+1;
    X{figure_order}=Fedu;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fedu';
    labels{figure_order,2}='0 to 4';    

    %% 9 Mjob - mother's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
    figure_order=figure_order+1;
    my_var=Mjob;
    my_str='teacher';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end  
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Mjob';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='health';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='mJob';
    labels{figure_order,2}=my_str;    
        
    figure_order=figure_order+1;
    my_str='services';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='mJob';
    labels{figure_order,2}=my_str;    

    figure_order=figure_order+1;
    my_str='at_home';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='mJob';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='other';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='mJob';
    labels{figure_order,2}=my_str;    

    %% 10 Fjob - father's job (nominal: "teacher", "health" care related, civil "services" (e.g. administrative or police), "at_home" or "other")
    figure_order=figure_order+1;
    my_var=Fjob;
    my_str='teacher';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fjob';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='health';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fjob';
    labels{figure_order,2}=my_str;    
        
    figure_order=figure_order+1;
    my_str='services';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fjob';
    labels{figure_order,2}=my_str;    

    figure_order=figure_order+1;
    my_str='at_home';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fjob';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='other';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Fjob';
    labels{figure_order,2}=my_str;    

    %% 11 reason - reason to choose this school (nominal: close to "home", school "reputation", "course" preference or "other")
    figure_order=figure_order+1;
    my_var=reason;
    my_str='home';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='reason';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='reputation';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='reason';
    labels{figure_order,2}=my_str;    
        
    figure_order=figure_order+1;
    my_str='course';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='reason';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='other';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='reason';
    labels{figure_order,2}=my_str;    

    %% 12 guardian - student's guardian (nominal: "mother", "father" or "other")
    figure_order=figure_order+1;
    my_var=guardian;
    my_str='mother';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='guardian';
    labels{figure_order,2}=my_str;    
    
    figure_order=figure_order+1;
    my_str='father';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='guardian';
    labels{figure_order,2}=my_str;    
        
    figure_order=figure_order+1;
    my_str='other';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='guardian';
    labels{figure_order,2}=my_str;    

    %% 13 traveltime - home to school travel time (numeric: 1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)
    figure_order=figure_order+1;
    X{figure_order}=traveltime;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='traveltime';
    labels{figure_order,2}='1 to 4';

    %% 14 studytime - weekly study time (numeric: 1 - <2 hours, 2 - 2 to 5 hours, 3 - 5 to 10 hours, or 4 - >10 hours)
    figure_order=figure_order+1;
    X{figure_order}=studytime;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='studytime';
    labels{figure_order,2}='1 to 4';

    %% 15 failures - number of past class failures (numeric: n if 1<=n<3, else 4)
    figure_order=figure_order+1;
    X{figure_order}=failures;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='failures';
    labels{figure_order,2}='1 to 4';

    %% 16 schoolsup - extra educational support (binary: yes or no)
    figure_order=figure_order+1;
    my_var=schoolsup;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end    
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='schoolsup';
    labels{figure_order,2}='(yes) vs. no';

    %% 17 famsup - family educational support (binary: yes or no)
    figure_order=figure_order+1;
    my_var=famsup;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='famsup';
    labels{figure_order,2}='(yes) vs. no';

    %% 18 paid - extra paid classes within the course subject (Math or Portuguese) (binary: yes or no)
    figure_order=figure_order+1;
    my_var=paid;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='paid';
    labels{figure_order,2}='(yes) vs. no';

    %% 19 activities - extra-curricular activities (binary: yes or no)
    figure_order=figure_order+1;
    my_var=activities;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='activities';
    labels{figure_order,2}='(yes) vs. no';

    %% 20 nursery - attended nursery school (binary: yes or no)
    figure_order=figure_order+1;
    my_var=nursery;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='nursery';
    labels{figure_order,2}='(yes) vs. no';

    %% 21 higher - wants to take higher education (binary: yes or no)
    figure_order=figure_order+1;
    my_var=higher;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='higher';
    labels{figure_order,2}='(yes) vs. no';

    %% 22 internet - Internet access at home (binary: yes or no)
    figure_order=figure_order+1;
    my_var=internet;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='internet';
    labels{figure_order,2}='(yes) vs. no';

    %% 23 romantic - with a romantic relationship (binary: yes or no)
    figure_order=figure_order+1;
    my_var=romantic;
    my_str='yes';
    for i=1:case_max
        if strcmp(my_var{i},my_str)
            X{figure_order}(i)=1;
        else
            X{figure_order}(i)=-1;
        end
    end
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);    
    % labeling
    labels{figure_order,1}='romantic';
    labels{figure_order,2}='(yes) vs. no';

    %% 24 famrel - quality of family relationships (numeric: from 1 - very bad to 5 - excellent)
    figure_order=figure_order+1;
    X{figure_order}=famrel;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='famrel';
    labels{figure_order,2}='1 to 5';

    %% 25 freetime - free time after school (numeric: from 1 - very low to 5 - very high)
    figure_order=figure_order+1;
    X{figure_order}=freetime;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='freetime';
    labels{figure_order,2}='1 to 5';

    %% 26 goout - going out with friends (numeric: from 1 - very low to 5 - very high)
    figure_order=figure_order+1;
    X{figure_order}=goout;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='goout';
    labels{figure_order,2}='1 to 5';

    %% 27 Dalc - workday alcohol consumption (numeric: from 1 - very low to 5 - very high)
    figure_order=figure_order+1;
    X{figure_order}=Dalc;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Dalc';
    labels{figure_order,2}='1 to 5';

    %% 28 Walc - weekend alcohol consumption (numeric: from 1 - very low to 5 - very high)
    figure_order=figure_order+1;
    X{figure_order}=Walc;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='Walc';
    labels{figure_order,2}='1 to 5';

    %% 29 health - current health status (numeric: from 1 - very bad to 5 - very good)
    figure_order=figure_order+1;
    X{figure_order}=health;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='health';
    labels{figure_order,2}='1 to 5';

    %% 30 absences - number of school absences (numeric: from 0 to 93)
    figure_order=figure_order+1;
    X{figure_order}=absences;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='absences';
    labels{figure_order,2}='0 to 93';

    %% 31 G1 - first period grade (numeric: from 0 to 20)
    figure_order=figure_order+1;
    X{figure_order}=G1;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='G1';
    labels{figure_order,2}='0 to 20';

    %% 31 G2 - second period grade (numeric: from 0 to 20)
    figure_order=figure_order+1;
    X{figure_order}=G2;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='G2';
    labels{figure_order,2}='0 to 20';

    %% 32 G3 - final grade (numeric: from 0 to 20, output target)
    figure_order=figure_order+1;
    X{figure_order}=G3;
    % normalization
    mu(figure_order)=mean(X{figure_order});
    sigma(figure_order)=std(X{figure_order});
    normX{figure_order}=(X{figure_order}-mu(figure_order))/sigma(figure_order);
    % labeling
    labels{figure_order,1}='G3';
    labels{figure_order,2}='0 to 20';

    %% save information
    
    save processed_data.mat X normX labels mu sigma
end    

%%
if 1
   load processed_data.mat

   features_no=size(labels,1);
   Big_sigma=zeros(2,2);%features_no,features_no);
    for i=1:case_no
        x=[];
%         for j=features_no-2:features_no-1
%             x(j-(features_no-2)+1,1)=normX{j}(i);
%         end      
        x(1,1)=normX{features_no-2}(i);
        x(2,1)=normX{features_no}(i);
        Big_sigma=Big_sigma+x*x';
    end
    Big_sigma=Big_sigma/case_no;
    [V,D] = eig(Big_sigma);  

    diag_D=diag(D);
    max_diag_D=diag_D(end);

    k=1;
    u=(V(:,end-k+1:end));
       
    save PCA_training_results_dim2.mat V D diag_D u   
end    
    %% test
    load PCA_training_results_dim2.mat
    features_no=size(labels,1);
    x_test=[];
    x_test(1,:)=normX{features_no-2}(case_no+1:case_max)';
    x_test(2,:)=normX{features_no-2}(case_no+1:case_max)';
    y1=u(2)/u(1)*x_test(1,:)*sigma(end)+mu(end);

    %% plot
    figure();
    hold off;
    plot(y1, X{end}(case_no+1:case_max), 'o')
    axis([0 22 0 22])
    hold on
    plot([0,22], [0,22], '--r');
    xlabel('predicted final exam score based on midterm 1 score')
    ylabel('actual final exam score')
    
    %
    figure();
    hold off;
    plot(X{end-2}(case_no+1:case_max), X{end}(case_no+1:case_max), 'bo')
    axis([0 22 0 22])
    hold on
    plot(X{end-2}(case_no+1:case_max), y1, 'r+')
    xlabel('midterm 1 score')
    ylabel('actual final exam score')
    legend('actual final exam score', 'predicted final exam score');


