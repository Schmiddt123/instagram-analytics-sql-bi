-- 0. Create database
CREATE DATABASE IF NOT EXISTS instagram_analytics;
USE instagram_analytics;

-- 1. Drop + create main table
DROP TABLE IF EXISTS ig_data;

CREATE TABLE ig_data (
    post_id           VARCHAR(50)      NOT NULL,
    upload_date       TEXT             NULL,          -- better: DATE or DATETIME
    media_type        VARCHAR(20)      NULL,

    likes             INT              NULL,
    comments          INT              NULL,
    shares            INT              NULL,
    saves             INT              NULL,
    reaches           INT              NULL,
    impressions       INT              NULL,

    caption_length    INT              NULL,
    hashtags_count    INT              NULL,
    followers_gained  INT              NULL,

    traffic_source    VARCHAR(50)      NULL,          -- Home Feed / Hashtags / Reels Feed / Explore / etc.
    engagement_rate   DECIMAL(10,4)    NULL,
    content_category  VARCHAR(50)      NULL           -- Beauty / Fitness / Travel / etc.
);

-- 2. Load data from CSV
LOAD DATA LOCAL INFILE 'C:/path/to/ig_data_clean.csv'
INTO TABLE ig_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    post_id,
    upload_date,
    media_type,
    likes,
    comments,
    shares,
    saves,
    reaches,
    impressions,
    caption_length,
    hashtags_count,
    followers_gained,
    traffic_source,
    engagement_rate,
    content_category
);
