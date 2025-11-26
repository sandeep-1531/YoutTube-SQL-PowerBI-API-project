YouTube Channel Analytics (API + SQL + Power BI)

This project extracts public YouTube channel data using the YouTube Data API, stores the cleaned dataset in a SQL database, and builds an analytical dashboard in Power BI to uncover trends in views, engagement, uploads, and category performance.

<img width="1489" height="855" alt="image" src="https://github.com/user-attachments/assets/4281a987-e152-44da-ab6f-bff95a84149c" />

 Project Workflow

  --> YouTube API Extraction

       - Fetch public video statistics (views, likes, comments, tags, publish date, category, etc.)

        - Convert raw JSON into structured rows.

--> SQL Database (Data Cleaning + Modeling)

     - Load raw data into SQL tables.

     - Clean and normalize the dataset.

     - Build a Star Schema model:

            - Fact Table: vw_thnkmedia_metrics

            - Dimension Table: category_dim

--> Power BI Dashboard

      - Connect SQL to Power BI

      - Build KPIs, category-level visuals, trend analysis, and combined insights.

Dataset Structure
    --> Fact Table — vw_thikmedia_metrics

          - Contains video-level metrics:

           - view_count

           - like_count

           - comment_count

           - engagement_rate

           - tags_count

           - title_length

           - views_per_day

           - published_at

           - category_id

  --> Dimension Table — category_dim

          - category_id

           - category_name

This creates a Star Schema used inside Power BI.

Architecture Diagram
YouTube Data API (Public Statistics)
                |
                v
          Raw JSON Data
                |
                v
         SQL Database
   - Raw tables
   - Cleaned fact and dim tables
                |
                v
        Power BI Desktop
   - Data model (Star Schema)
   - Visualizations & Insights

Dashboard Features
1. Key KPIs

     - Total uploaded videos
   
     - Average views per day
   
     - Average engagement rate
   
     - Average video duration
   
     - Most active category

2. Category-Level Visuals

     - Video Category by Year
   
     - Engagement by Category
   
     - Video Uploads by Category
   
     - Most Active Categories

3. Video-Level Visuals

     - Top Videos by Average Daily Views
   
     - Likes by Category
   
     - Tags Count by Category

4. Combined Trend

    - Category uploads and likes over time (dual-axis chart)

Dashboard Output (PDF)

A full Power BI dashboard PDF is included in the repository: YouTube Channel Analytics Dashboard.pdf
The PDF contains all KPI cards and visual insights.

Key Insights

     - Entertainment category dominates in views, engagement, and uploads.
   
     - People & Blogs has one of the highest average likes.
   
     - Uploads peaked in 2023.

     - Education category maintains strong consistency with stable engagement.

     - Some low-upload categories show high engagement, indicating potential opportunity.

Technologies Used

   YouTube Data API

   SQL (Data Cleaning & Modeling)

   Power BI (Visualization & Reporting)

Author
Created by Sandeep K.M.
Portfolio: https://github.com/sandeep-1531

<img width="723" height="1359" alt="image" src="https://github.com/user-attachments/assets/af8e6171-acd4-446b-96a7-1b824e16a41c" />

