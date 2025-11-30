📊 Instagram Analytics — SQL, Data Cleaning & BI Dashboard (In Progress)

An end-to-end analytics project based on Instagram performance metrics.
The goal is to build a complete analytics workflow from raw data to SQL modeling and a BI dashboard.

📌 Power BI dashboard is currently in progress.
(All SQL analysis is completed.)

🔍 Project Overview

This project includes:

Data cleaning and preparation (Power Query + SQL)

SQL table creation and data structuring

Analytical SQL exploration (engagement, impressions, reach, CTR, etc.)

Generating insights for Power BI visualizations

Preparing a multi-theme dashboard (light & dark)

🗂 Dataset

The dataset contains Instagram post-level metrics:

Media types

Content categories

Likes, comments, shares, saves

Impressions & reach

Engagement rate (ER)

Followers gained

Hashtags count

Traffic sources

Upload dates (date, month, weekday)

🧱 SQL Data Model
ig_data ( fact table )
Scripts included:
create_table_ig_data.sql
prepare_ig_data.sql
analyze_ig_data.sql

📈 Key Insights from SQL Analysis
1. Fitness generates the highest deep engagement (saves + shares).

Fitness leads with 30.63M deep interactions, followed closely by Technology and Photography.
This shows Fitness content creates the strongest “save-worthy” and shareable value.

2. Video has the highest average engagement rate.

Video posts dominate with an average engagement rate of 14.62%, outperforming Reels (14.54%) and Carousel posts (14.32%).
Videos consistently drive the strongest interaction.

3. Beauty achieves the highest average engagement rate among content categories.

Beauty leads with 15.66%, followed by Photography (14.82%) and Lifestyle (14.69%).
Beauty content is the most engaging segment overall.

4. Music attracts the highest number of followers.

Music content brought in 1.54M followers, slightly ahead of Lifestyle (1.53M) and Photography (1.52M).
Music posts are the strongest for follower acquisition.

5. Photo + Technology combination delivers the highest interaction efficiency.

Photo posts in the Technology category achieve the top efficiency score of 0.1251, meaning they convert reach into interactions better than any other pair.

6. Wednesday generates the highest engagement rate.

Wednesday leads with an average ER of 15.11%, followed by Saturday (14.79%) and Sunday (14.42%).
Mid-week content performs best.

7. Fashion uses the most hashtags.

Fashion posts account for 46,298 hashtags (10.37%), followed closely by Lifestyle and Technology.
Fashion creators rely heavily on hashtag strategies.

8. Comedy receives the highest average impressions.

Comedy leads with 1.28M avg impressions, then Fitness (1.26M) and Beauty (1.25M).
Comedy content reaches the largest audiences.

9. Lifestyle generates the most comments on average.

Lifestyle content averages 5,071 comments, meaning users are most talkative on Lifestyle posts.

10. Home Feed brings the most new followers.

Home Feed generated 2.54M followers, significantly outperforming Profile and Reels Feed as acquisition sources.

11. Beauty has the highest CTR.

Beauty posts achieve a CTR of 0.144, ahead of Photography (0.136) and Lifestyle (0.134).
Beauty drives the most effective traffic relative to impressions.

12. Posts with zero hashtags have the highest engagement rate.

Posts using 0 hashtags outperform all other groups with 18.61% ER.
Moderate hashtag usage (1–5) is the worst-performing group at 13.69%.

13. Fitness receives the highest average saves.

Fitness leads with 7,689 saves, followed by Technology (7,617) and Food (7,519).
Fitness content is most “save-worthy”.

14. March has the highest average engagement rate.

March leads with 15.52%, followed by April (15.13%) and November (14.83%).
Spring months show the strongest engagement peaks.

🚀 Next Steps

Finalize Power BI dashboard (visual storytelling, KPIs, themes)

Add DAX measures for CTR, ER trends, and YoY/MoM growth

Publish both Light & Dark dashboard themes

Upload dashboard preview screenshots
