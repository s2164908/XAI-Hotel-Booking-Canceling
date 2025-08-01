library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# Load the dataset from the repository
df <- read_csv("hotel (2).csv")

# Create a lead time bucket since it does not exist in the raw data
df <- df %>%
  mutate(
    lead_time_bucket = cut(
      lead_time,
      breaks = c(0, 7, 30, 90, 180, Inf),
      labels = c("0-7", "8-30", "31-90", "91-180", "180+"),
      right = TRUE,
      include.lowest = TRUE
    )
  )

# Filter out 'Undefined' market segment
df_filtered <- df %>%
  filter(market_segment != "Undefined")

# Recalculate the cancellation rate and total bookings for the filtered data
booking_stats_filtered <- df_filtered %>%
  group_by(market_segment) %>%
  summarise(cancel_rate = mean(is_canceled),
            total_bookings = n()) %>%
  arrange(desc(cancel_rate))

# Bar plot with labels for total bookings (excluding 'Undefined')
ggplot(booking_stats_filtered, aes(x = reorder(market_segment, -cancel_rate), y = cancel_rate)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = total_bookings), 
            position = position_stack(vjust = 0.5), 
            size = 4, 
            color = "black") +  # Add labels for number of bookings
  labs(title = "Cancellation Rate by Market Segment with Total Bookings (Excluding Undefined)", 
       x = "Market Segment", 
       y = "Cancellation Rate") +
  theme_minimal() 


# Filter out NA values in lead_time_bucket
df_filtered <- df %>%
  filter(!is.na(lead_time_bucket))

# Group by lead_time_bucket and calculate cancellation rate
leadtime_bucket_cancellation <- df_filtered %>%
  group_by(lead_time_bucket) %>%
  summarise(cancel_rate = mean(is_canceled),
            total_bookings = n()) %>%
  arrange(lead_time_bucket)

# View the cancellation rate by lead_time_bucket
head(leadtime_bucket_cancellation)

# Bar plot for cancellation rate by lead_time_bucket (ignoring NAs)
ggplot(leadtime_bucket_cancellation, aes(x = lead_time_bucket, y = cancel_rate)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = total_bookings), 
            position = position_stack(vjust = 0.5), 
            size = 4, 
            color = "black")+
  labs(title = "Cancellation Rate by Lead Time Bucket",
       x = "Lead Time Bucket", 
       y = "Cancellation Rate") +
  theme_minimal() 







