UPDATE ig_data
SET upload_date = STR_TO_DATE(upload_date, '%m/%d/%Y');

ALTER TABLE ig_data
MODIFY upload_date DATE;
