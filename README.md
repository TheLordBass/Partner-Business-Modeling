# Uber Driver Bonus Scheme Analysis

This project evaluates and compares two proposed driver bonus structures for a high-demand Saturday scenario. Using SQL, the analysis calculates total payouts, driver qualification rates, and key performance behaviors to determine the most cost-effective and motivating incentive structure.

---

### Project Overview

An influx of demand is expected for an upcoming busy Saturday, requiring a significant increase in active drivers. To incentivise drivers to go online, two distinct bonus structures are under evaluation:

*   **Option 1:** A flat **\$50** bonus for each driver who:
    *   Works at least **8 supply hours**.
    *   Maintains an **acceptance rate of $\ge$ 90%**.
    *   Completes at least **10 trips**.
    *   Maintains a rating of **$\ge$ 4.7**.
*   **Option 2:** A performance-based **\$4 per completed trip** bonus for all drivers who:
    *   Complete at least **12 trips**.
    *   Maintain a rating of **$\ge$ 4.7**.

---

### Dataset Schema

The queries in this repository run against `uber_dataset.csv`, which contains the following primary columns:
*   `Driver_ID`: Unique identifier for each driver.
*   `Supply_Hours`: Total hours the driver was online.
*   `Trips_Completed`: Number of successfully finished trips.
*   `Acceptance_percentage`: The percentage of trip requests accepted by the driver.
*   `Rating`: The driver's average rating.

---


