 Dataset Structure

This project outputs two main tables:

Fact Table — vw_thinkmedia_metrics

Contains video-level performance metrics:

view_count

like_count

comment_count

engagement_rate

tags_count

title_length

views_per_day

published_at

category_id

Dimension Table — category_dim

Contains category metadata:

category_id

category_name

➡ Modeled as a Star Schema inside Power BI.

Project Architecture

A clean GitHub-friendly architecture diagram:

          ┌──────────────────────┐
          │  YouTube Data API    │
          │  (Public Video Stats)│
          └────────────┬─────────┘
                       │
                       ▼
              Raw API JSON Data
                       │
                       ▼
          ┌────────────────────────┐
          │      SQL Database      │
          │ (Cleaned Fact + Dim)   │
          └────────────┬───────────┘
                       │
                       ▼
                Star Schema Model
                       │
                       ▼
          ┌────────────────────────┐
          │        Power BI        │
          │   Dashboards + KPIs    │
          └────────────────────────┘

 Dashboard Features
1. Key KPIs (Top Row)

Total Videos

Avg Views per Day

Avg Engagement Rate

Avg Video Duration

Most Active Category

2. Category-Level Visuals

Video Category by Year

Engagement by Category

Video Uploads by Category

Most Active Categories

3. Video-Level Analysis

Top Videos by Average Daily Views

Tags Count by Category

Likes by Category

4. Combined Trend Charts

Category Upload Trend + Likes Trend (Dual Axis)

📄 Dashboard PDF

📎 View full dashboard:
YouTube Channel Analytics Dashboard.pdf
✅ a better architecture diagram (SVG style)

Just tell me!
