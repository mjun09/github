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
filename='wicdf_set.csv';
ind_scenario=2;
ind_sex=5;
ind_education=6;

if 0
    [scenario_str, sex_str, education_str]=csvimport(filename, 'columns', [ind_scenario, ind_sex, ind_education], 'noHeader', true);
    save Q3_data.mat scenario_str sex_str education_str 
else
    load Q3_data.mat
end

scenario=(strrep(scenario_str(2:end),'"',''));
education=(strrep(education_str(2:end),'"',''));
sex=(strrep(sex_str(2:end),'"',''));

% define category sets
scenario_unique=unique(scenario);
education_unique=unique(education);
sex_unique=unique(sex);

% initialize
scenario_cate=zeros(length(scenario),1);
education_cate=zeros(length(education),1);
sex_cate=zeros(length(sex),1);

% define scenario_category
for i=1:length(scenario_unique)
    temp=(strcmp(scenario,scenario_unique(i)));
    scenario_cate=scenario_cate+temp*i;    
end

% define education_catetegory
for i=1:length(education_unique)
    temp=strcmp(education,education_unique(i));
    education_cate=education_cate+(temp)*i;
end
% define sex_category
for i=1:length(sex_unique)
    temp=strcmp(sex,sex_unique(i));
    sex_cate=sex_cate+(temp)*i;
end

% analysis between education level and scenario
education_for_scenario=[];
for i=1:length(scenario_unique)
    education_for_scenario_i=education_cate(find(scenario_cate==i));
    
    for j=1:length(education_unique)
        education_for_scenario(i,j)=sum(education_for_scenario_i==j);
    end
end

% analysis between education level and scenario
sex_for_scenario=[];
for i=1:length(scenario_unique)
    sex_for_scenario_i=sex_cate(find(scenario_cate==i));
    
    for j=1:length(sex_unique)
        sex_for_scenario(i,j)=sum(sex_for_scenario_i==j);
    end
end


figure
subplot(3,1,1);
stem(1:length(education_unique),education_for_scenario(1,:));
xlabel('education level: from 1 to 8')
ylabel('# people')
title('material level:1')

subplot(3,1,2);
stem(1:length(education_unique),education_for_scenario(2,:));
xlabel('education level: from 1 to 8')
ylabel('# people')
title('material level:2')

subplot(3,1,3);
stem(1:length(education_unique),education_for_scenario(3,:));
xlabel('education level: from 1 to 8')
ylabel('# people')
title('material level:3')


figure
subplot(3,1,1);
stem(1:length(sex_unique),sex_for_scenario(1,:));
xlabel('gender: male (1) or female(2)')
ylabel('# people')
title('material level:1')

subplot(3,1,2);
stem(1:length(sex_unique),sex_for_scenario(2,:));
xlabel('gender: male (1) or female(2)')
ylabel('# people')
title('material level:2')

subplot(3,1,3);
stem(1:length(sex_unique),sex_for_scenario(3,:));
xlabel('gender: male (1) or female(2)')
ylabel('# people')
title('material level:2')


% While their potential is important, projects are assessed primarily based on the success of analysis performed. 
% We are looking for data scientists who are able to deliver value, not just promise it.
% We're looking for creative, original thinkers who can find novel questions to ask about different datasets. 
% While your work does not have to be completely original, you should Google around to see if your dataset has already been studied extensively. 
% Using other challenge question datasets demonstrates a lack of creativity.
% High-impact problems of general interest are more interesting than academic research problems. 
% If you solve the problem, will anyone care? Identifying interesting problems is half the challenge when leaving the academy.
% Proposals that explain a non-obvious thesis supported by your plots are the most compelling. 
% Generic exploratory plots of arbitrarily-chosen raw data columns are not as impressive as plots of processed data 
% that convey some insight about your dataset.
% Downloading a pre-formatted, pre-cleaned dataset intended for machine learning 
% (e.g. UCI or Kaggle datasets) is less impressive than pulling data from an API or scraping a webpage. 
% Most real-world data does not come neatly pre-packaged.
% All things being equal, analysis of larger datasets is more impressive than analysis of smaller ones.
% All things being equal, people who demonstrate the ability to use git and Heroku will be viewed more favorably. 
% To get started, try following this git tutorial or these Heroku tutorials in your favorite language.

%% Propose a project.* 

%% Link to public description of data source.* 
% http://blog.thedataincubator.com/tag/data-sources/

%% Link to 1st plot. You are highly encouraged to use a Heroku apps domain for your hosting.* 
% http://real-cheap-eats.herokuapp.com

%% Link to 2nd plot. You are highly encouraged to use a Heroku apps domain for your hosting.* 
% http://real-cheap-eats.herokuapp.com

%% How much data did you analyze (in MB)?* 
% 1234
% How did you obtain your dataset? (Please check all that apply.)
% 
% I downloaded a dataset available online.
% I used a provided API.
% I scraped data from a webpage.
% Other (please explain).
% 
%% We want to know your communication style. 
% Record a video of yourself giving a high-level proposal of your project to a non-technical person. 
% The video should be no longer than 1 minute and should be at a higher level than the previous explanation.
% 
% Record a video of yourself and upload it to YouTube (and not another video hosting service). 
% Be sure to make the video unlisted (but not private!) 
% so people without the link cannot find it on Google 
% (go here, click "Edit" on your video, select unlisted from the privacy dropdown menu, and save your changes). 
% You can use either your webcam or a smartphone.
% 
% Once complete, please provide the embed URL of the video. To find this URL (NOT the entire iframe tag), 
% on the video's normal watch page, you can click Share ? Embed, and take the link from inside the 'src' attribute of the tag. 
% It looks something like this: https://www.youtube.com/embed/y9tX5whl2U
% 
% Please provide the EMBED URL to your video*

