-- --------------------------------------------------
--  Schema for YouTube Channel Analytics (MySQL)
-- --------------------------------------------------

  CREATE DATABASE IF NOT EXISTS youtube_analytics;

  DROP TABLE IF EXISTS youtube_videos_raw;
  CREATE TABLE youtube_videos_raw (
    video_id            VARCHAR(50)  PRIMARY KEY,
    title               TEXT,
    description         TEXT,
    published_at        DATETIME,
    duration_iso        VARCHAR(20),
    view_count          BIGINT,
    like_count          BIGINT,
    comment_count       BIGINT,
    tags                TEXT,
    category_id         INT,
    -- optional raw columns
    raw_json            JSON NULL
    );

CREATE TABLE category_dim (
    category_id   INT PRIMARY KEY,
    category_name VARCHAR(255)
);

CREATE VIEW vw_thinkmedia_metrics AS
SELECT
    v.video_id,
    v.title,
    v.description,
    v.published_at,
    v.duration_iso,
    v.view_count,
    v.like_count,
    v.comment_count,
    v.tags,
    v.category_id,
    c.category_name,

    -- Age in days since published
    DATEDIFF(CURDATE(), DATE(v.published_at))AS age_days,
 CAST(
        (
            COALESCE(REGEXP_SUBSTR(duration_iso, '(?<=PT)([0-9]+)(?=H)'), '0')
        ) AS UNSIGNED
    ) * 3600
    +
    CAST(
        (
            COALESCE(REGEXP_SUBSTR(duration_iso, '(?<=H)([0-9]+)(?=M)'), 
                     REGEXP_SUBSTR(duration_iso, '(?<=PT)([0-9]+)(?=M)'), '0')
        ) AS UNSIGNED
    ) * 60
    +
    CAST(
        (
            COALESCE(REGEXP_SUBSTR(duration_iso, '(?<=M)([0-9]+)(?=S)'), 
                     REGEXP_SUBSTR(duration_iso, '(?<=PT)([0-9]+)(?=S)'), '0')
        ) AS UNSIGNED
    ) AS duration_sec,

    CHAR_LENGTH(v.title) AS title_length_chars,
    LENGTH(TRIM(v.title)) 
      - LENGTH(REPLACE(TRIM(v.title), ' ', '')) + 1
        AS title_length_words,

    CASE 
        WHEN v.tags IS NULL OR v.tags = '' THEN 0
        ELSE LENGTH(v.tags) - LENGTH(REPLACE(v.tags, '|', '')) + 1
    END AS tags_count,

    CASE 
        WHEN DATEDIFF(CURDATE(), DATE(v.published_at)) <= 0 THEN view_count
        ELSE view_count / DATEDIFF(CURDATE(), DATE(v.published_at))
    END AS views_per_day,

    CASE 
        WHEN view_count = 0 OR view_count IS NULL THEN 0
        ELSE (COALESCE(like_count, 0) + COALESCE(comment_count, 0)) / view_count
    END AS engagement_rate

FROM youtube_videos_raw v
LEFT JOIN category_dim c
    ON v.category_id = c.category_id;
