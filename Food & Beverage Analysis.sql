# Demographic Insights
# Who prefers energy drink more?
SELECT Gender, count(Gender) as Count
FROM food_beverage.dataset_dim_repondents
group by Gender
Order by Count desc;

# Which age group prefers energy drinks more?
SELECT Age, count(Age) as Count
FROM food_beverage.dataset_dim_repondents
group by Age
Order by Count desc;

# Which type of marketing reaches the most Youth (15-30)?
SELECT Marketing_channels, COUNT(Marketing_channels) AS count
FROM food_beverage.fact_survey_responses
JOIN dataset_dim_repondents ON food_beverage.fact_survey_responses.Respondent_ID = dataset_dim_repondents.Respondent_ID
WHERE age = "15-18"
GROUP BY Marketing_channels
ORDER BY count Desc;

# Consumer Preferences
# What are the preferred ingredients of energy drinks among respondents?
SELECT Ingredients_expected, count(Ingredients_expected) as Count
FROM food_beverage.fact_survey_responses
group by Ingredients_expected
Order by Count desc;

# What packaging preferences do respondents have for energy drinks?
SELECT Packaging_preference, count(Packaging_preference) as Count
FROM food_beverage.fact_survey_responses
group by Packaging_preference
Order by Count desc;

# Competitive Analysis
# Who are the current market leader?
SELECT Current_brands, count(Current_brands) as count 
FROM food_beverage.fact_survey_responses
Group by Current_brands
Order by Count desc
Limit 1;

#What are the primary reasons consumers prefer those brands over ours?
SELECT Current_brands, Reasons_for_choosing_brands 
FROM food_beverage.fact_survey_responses
Group by Current_brands,Reasons_for_choosing_brands;

# Marketing Channels and Brand Awarness
# Which marketing channel can be used to reach more customers?
select Marketing_channels,count(Marketing_channels) as count
From food_beverage.fact_survey_responses
group by Marketing_channels
order by count desc;

SELECT Marketing_channels
FROM food_beverage.fact_survey_responses
GROUP BY Marketing_channels
ORDER BY COUNT(*) DESC
LIMIT 1;

#How effective are different marketing strategies and channels in reaching our customers? 
select Marketing_channels,count(Marketing_channels) as count
From food_beverage.fact_survey_responses
group by Marketing_channels
order by count desc;

# Brand Penetration :
# What do people think about our brand? (overall rating)
SELECT Brand_perception
FROM food_beverage.fact_survey_responses
GROUP BY Brand_perception
ORDER BY COUNT(*) DESC
LIMIT 1;

# Which cities do we need to focus more on?
SELECT City, COUNT(dataset_dim_repondents.Respondent_ID) AS count
FROM dim_cities
JOIN dataset_dim_repondents ON dim_cities.City_ID = dataset_dim_repondents.City_ID
GROUP BY City
ORDER BY count ASC
Limit 5;

#Purchase Behavior:
# Where do respondents prefer to purchase energy drinks?
select Purchase_location
From fact_survey_responses
group by Purchase_location
order by count(*) desc
Limit 1;

# What are the typical consumption situations for energy drinks among respondents?
select Typical_consumption_situations
From fact_survey_responses
group by Typical_consumption_situations
order by count(*) desc
Limit 1;

#What factors influence respondents' purchase decisions, such as price range and limited edition packaging?
select price_range, count(dataset_dim_repondents.Respondent_ID) as count
From fact_survey_responses
join dataset_dim_repondents on dataset_dim_repondents.Respondent_ID= fact_survey_responses.Respondent_ID
group by Price_range
order by count desc;

select Limited_edition_packaging, count(dataset_dim_repondents.Respondent_ID) as count
From fact_survey_responses
join dataset_dim_repondents on dataset_dim_repondents.Respondent_ID= fact_survey_responses.Respondent_ID
group by Limited_edition_packaging
order by count desc;

# Product Development:
# Which area of business should we focus more on our product development? 
# Branding -
select Heard_before,count(*) as count
from fact_survey_responses
group by Heard_before
order by count desc;

# Taste-
Select Taste_experience,count(*) as count
from fact_survey_responses
group by Taste_experience
order by count desc;

# Availiability-
select Reasons_preventing_trying, count(*) as count
from fact_survey_responses
group by Reasons_preventing_trying	
order by count desc;
 
