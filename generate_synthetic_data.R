set.seed(42)
library(dplyr)

n <- 1200

# Create synthetic healthcare dataset with realistic mess
healthcare_raw <- data.frame(
  patient_id = sample(10000:99999, n, replace = TRUE),
  
  # Age: mostly realistic, some missing/erroneous values
  age = sample(c(0:95, NA, -5, 150), n, replace = TRUE, prob = c(rep(1, 96), 5, 2, 2)),
  
  # Gender: mixed formats
  gender = sample(c("Male", "Female", "M", "F", NA), n, replace = TRUE, prob = c(0.48, 0.48, 0.02, 0.02, 0.01)),
  
  # Insurance: mixed case to simulate dirty data
  insurance = sample(c("Medicare", "Medicaid", "Private", "Self-pay", "private", "MEDICARE"), n, replace = TRUE),
  
  # Diagnosis: mixed coding
  diagnosis = sample(c("Hypertension", "Diabetes", "COPD", "Heart Failure", "Asthma", "HTN"), n, replace = TRUE),
  
  # Length of stay: realistic with some extreme/missing
  length_of_stay = sample(c(1:30, NA, 0, 120), n, replace = TRUE),
  
  # Total charges: log-normal distribution, realistic hospital costs
  total_charges = round(rlnorm(n, meanlog = 9, sdlog = 0.7), 2), 
  
  # Discharge status
  discharge_status = sample(c("Home", "Transferred", "Expired"), n, replace = TRUE),
  
  # Admission date: realistic range
  admission_date = sample(seq(as.Date("2018-01-01"), as.Date("2024-12-31"), by ="day"), n, replace = TRUE),
  
  # Readmitted within 30 days: mixed encoding
  readmitted_30_days = sample(c("Yes", "No", "Y", "N", NA), n, replace = TRUE, prob = c(0.3, 0.5, 0.1, 0.08, 0.02)),
  
  stringsAsFactors = FALSE
)

# Save CSV
write.csv(healthcare_raw, "synthetic_healthcare_raw.csv", row.names = FALSE)

head(healthcare_raw)
