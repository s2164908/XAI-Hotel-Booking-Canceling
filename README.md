# XAI-Hotel-Booking-Canceling

## Overview
The guven dataset contains hotel booking data from two hotels in Portugal: a resort hotel (H1) and a city hotel (H2). The dataset spans from July 1, 2015, to August 31, 2017, and includes bookings that were either canceled or completed. It is structured with 31 variables for each hotel booking observation.

The dataset is useful for research in areas such as revenue management, machine learning, data mining, and predictive analytics, particularly for modeling booking cancellations.

## Variables

The variables in the dataset are classified into **Numeric**, **Integer**, **Categorical**, and **Date** types.

### 1. **Numeric Variables**
- **ADR**: Average Daily Rate – Calculated by dividing the sum of all lodging transactions by the total number of staying nights. (BO, BL, TR)

### 2. **Integer Variables**
- **Adults**: Number of adults staying in the booking. (BO, BL)
- **Babies**: Number of babies (aged less than 3 years) in the booking. (BO, BL)
- **BookingChanges**: Number of changes or amendments made to the booking from creation until check-in or cancellation. (BO, BL)
- **Children**: Number of children (aged 3-12 years) in the booking. (BO, BL)
- **DaysInWaitingList**: Number of days the booking was on the waiting list before confirmation. (BO)
- **LeadTime**: Number of days between the booking's creation and the arrival date. (BO, BL)
- **PreviousBookingsNotCanceled**: Number of previous bookings by the customer that were not canceled. (BO, BL)
- **PreviousCancellations**: Number of previous bookings by the customer that were canceled. (BO, BL)
- **RequiredCarParkingSpaces**: Number of car parking spaces required by the guest. (BO, BL)
- **StaysInWeekendNights**: Number of weekend nights (Saturday, Sunday) the guest stayed or booked to stay. (BO, BL)
- **StaysInWeekNights**: Number of weeknights (Monday to Friday) the guest stayed or booked to stay. (BO, BL)
- **TotalOfSpecialRequests**: Number of special requests made by the guest (e.g., twin bed, high floor). (BO, BL)

### 3. **Categorical Variables**
- **Agent**: ID of the travel agency that made the booking. (BO, BL)
- **ArrivalDateMonth**: Month of the arrival date (e.g., January, February, etc.). (BO, BL)
- **ArrivalDateWeekNumber**: Week number of the arrival date (1-52). (BO, BL)
- **ArrivalDateYear**: Year of the arrival date (2015, 2016, 2017). (BO, BL)
- **AssignedRoomType**: Code of the room type assigned. Codes anonymized for privacy. (BO, BL)
- **Company**: ID of the company responsible for the booking. Codes anonymized for privacy. (BO, BL)
- **Country**: Country of origin of the booking, represented by ISO 3166-3:2013 format. (BO, BL, NT)
- **CustomerType**: Type of customer:
  - **Contract**: Booking under a contractual allotment.
  - **Group**: Booking as part of a group.
  - **Transient**: Individual booking, not part of a group or contract.
  - **Transient-party**: Booking for individual customers associated with at least one other transient booking. (BO, BL)
- **DepositType**: Type of deposit made by the customer:
  - **No Deposit**
  - **Non Refundable**
  - **Refundable** (BO, TR)
- **DistributionChannel**: Channel through which the booking was made (e.g., TA/TO: Travel Agents/Tour Operators). (BO, BL, DC)
- **IsCanceled**: Indicates if the booking was canceled (1) or not (0). (BO)
- **IsRepeatedGuest**: Indicates if the customer was a repeated guest (1) or not (0). (BO, BL, C)
- **MarketSegment**: Market segment to which the booking belongs (e.g., Travel Agents, Corporate, Direct, etc.). (BO, BL, MS)
- **Meal**: Type of meal package booked:
  - **Undefined/SC**: No meal package.
  - **BB**: Bed and Breakfast.
  - **HB**: Half Board (breakfast and one additional meal).
  - **FB**: Full Board (breakfast, lunch, dinner). (BO, BL, ML)
- **ReservationStatus**: Final status of the reservation:
  - **Canceled**: Booking was canceled.
  - **Check-Out**: Customer checked in and has already checked out.
  - **No-Show**: Customer did not check-in and provided no reason. (BO)
- **ReservedRoomType**: Code for the reserved room type. Codes anonymized for privacy. (BO, BL)

### 4. **Date Variables**
- **ArrivalDateDayOfMonth**: Day of the month the guest was scheduled to arrive (1-31). (BO, BL)
- **ReservationStatusDate**: Date when the reservation's last status was set (e.g., when it was canceled or the customer checked out). (BO)

---

## Sources of Variables
- **BO**: Booking table.
- **BL**: Booking Log table.
- **TR**: Transaction table.
- **NT**: Nationalities table.
- **DC**: Distribution Channels table.
- **MS**: Market Segments table.
- **ML**: Meal Plans table.
- **C**: Customer table.

## Data Engineering Notes
- Some variables were directly extracted from hotel databases, while others were engineered using combinations of data fields (e.g., total number of special requests).
- Values for some categorical variables such as **Agent** and **Company** are anonymized(NA/NULL) for privacy.

