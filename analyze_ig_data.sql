-- 1. Which content categories generate the highest deep engagement (total saves + shares)?
SELECT content_category,
       SUM(saves + shares) AS total_saves_and_shares,
       DENSE_RANK() OVER (ORDER BY SUM(saves + shares) DESC) AS rnk
FROM ig_data
GROUP BY content_category;

-- 2. Which media type (Reel, Photo, Video, Carousel) has the highest average engagement rate?
WITH cte AS (
    SELECT media_type,
           ROUND(AVG(engagement_rate), 2) AS average_engage_rate
    FROM ig_data
    GROUP BY media_type
)
SELECT media_type,
       average_engage_rate,
       ROUND(average_engage_rate / SUM(average_engage_rate) OVER () * 100, 2) AS percentage
FROM cte
ORDER BY percentage DESC;

-- 3. Which content categories achieve the highest average engagement rate?
SELECT content_category,
       ROUND(AVG(engagement_rate), 4) AS avg_engage_rate
FROM ig_data
GROUP BY content_category
ORDER BY avg_engage_rate DESC;

-- 4. Which content category attracts the most followers?
SELECT content_category,
       SUM(followers_gained) AS total_followers_gained
FROM ig_data
GROUP BY content_category
ORDER BY total_followers_gained DESC;

-- 5. Which media type and category combination delivers the highest interaction efficiency 
--    (total interactions relative to reach)?
SELECT media_type,
       content_category,
       SUM(likes + comments + shares + saves) / SUM(reaches) AS top
FROM ig_data
GROUP BY media_type, content_category
ORDER BY top DESC;

-- 6. Which day of the week produces the highest average engagement rate?
SELECT DAYNAME(upload_date) AS day_of_week,
       ROUND(AVG(engagement_rate), 2) AS avg_engage_rate
FROM ig_data
GROUP BY day_of_week
ORDER BY avg_engage_rate DESC;

-- 7. Which content categories use the most hashtags (% share)?
WITH cte AS (
    SELECT content_category,
           SUM(hashtags_count) AS total_HT
    FROM ig_data
    GROUP BY content_category
)
SELECT content_category,
       total_HT,
       ROUND(total_HT / SUM(total_HT) OVER () * 100, 2) AS perc_per_category
FROM cte
ORDER BY total_HT DESC;

-- 8. Which content category receives the highest average impressions?
WITH cte AS (
    SELECT content_category,
           ROUND(AVG(impressions), 2) AS avg_impression
    FROM ig_data
    GROUP BY content_category
)
SELECT content_category,
       avg_impression,
       ROUND(avg_impression / SUM(avg_impression) OVER () * 100, 2) AS perc_avg_impression
FROM cte
ORDER BY avg_impression DESC;

-- 9. Which content category generates the most comments on average?
WITH cte AS (
    SELECT content_category,
           ROUND(AVG(comments), 2) AS avg_comments
    FROM ig_data
    GROUP BY content_category
)
SELECT content_category,
       avg_comments,
       ROUND(avg_comments / SUM(avg_comments) OVER () * 100, 2) AS perc_avg_comments
FROM cte
ORDER BY perc_avg_comments DESC;

-- 10. Which traffic source brings the highest number of followers?
WITH cte AS (
    SELECT traffic_source,
           SUM(followers_gained) AS followers_gained
    FROM ig_data
    GROUP BY traffic_source
)
SELECT traffic_source,
       followers_gained,
       followers_gained - LAG(followers_gained) OVER (ORDER BY followers_gained DESC) AS difference_with_prev_source
FROM cte;

-- 11. Which content category achieves the highest average CTR?
SELECT content_category,
       ROUND(AVG((likes + comments) / impressions), 3) AS CTR_rate
FROM ig_data
GROUP BY content_category
ORDER BY CTR_rate DESC;

-- 12. How does engagement rate vary depending on the number of hashtags used?
SELECT CASE
           WHEN hashtags_count = 0 THEN '0'
           WHEN hashtags_count BETWEEN 1 AND 5 THEN '1-5'
           WHEN hashtags_count BETWEEN 6 AND 10 THEN '6-10'
           ELSE '>10'
       END AS grp,
       ROUND(AVG(engagement_rate), 2) AS average_engage_rate
FROM ig_data
GROUP BY grp
ORDER BY average_engage_rate DESC;

-- 13. Which content categories receive the highest average saves?
SELECT content_category,
       ROUND(AVG(saves), 2) AS avg_saves
FROM ig_data
GROUP BY content_category
ORDER BY avg_saves DESC;

-- 14. Which month achieves the highest average engagement rate?
SELECT MONTH(upload_date) AS month,
       ROUND(AVG(engagement_rate), 2) AS avg_engage_rate
FROM ig_data
GROUP BY MONTH(upload_date)
ORDER BY avg_engage_rate DESC;
