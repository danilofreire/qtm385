# Interactive function to calculate the final grade
# Assumes input grades are on a 0-10 scale
qtm385_grader <- function() {

  cat("Enter the student's grades (on a 0-10 scale):\n")

  # --- Get Assignment Grades (Integrated Loop) ---
  while(TRUE) {
    # Prompt for input
    input_char <- readline(prompt = "Enter the 10 assignment grades (0-10 scale, separated by space or comma): ")
    # Standardise separators and split
    input_char_spaces <- gsub(",", " ", input_char)
    grades_char_list <- strsplit(trimws(input_char_spaces), "\\s+")[[1]]
    # Remove empty strings resulting from multiple spaces etc.
    grades_char_list <- grades_char_list[nzchar(grades_char_list)]

    # Validate count
    if (length(grades_char_list) == 10) {
      # Validate numeric conversion
      grades_num <- suppressWarnings(as.numeric(grades_char_list))
      if (!any(is.na(grades_num))) {
        # Optional: Add range checks if needed
        if (all(grades_num >= 0 & grades_num <= 10)) {
             assignment_grades <- grades_num
             break # Exit loop if valid input received
        } else {
           cat("All grades must be numeric and between 0 and 10.\n")
        }
      } else {
        cat("Invalid input. Ensure all 10 entries are numbers.\n")
      }
    } else {
      cat("Invalid input. Please enter exactly 10 numeric grades separated by spaces or commas.\n")
    }
  }
  # Calculate and display average immediately after getting valid input
  assignment_avg <- mean(assignment_grades)
  cat(" -> Assignment Average:", round(assignment_avg, 2), "\n")

  # --- Get PAP Grade (Integrated Loop) ---
  while(TRUE) {
    input_char <- readline(prompt = "Enter the Pre-Analysis Plan (PAP) grade (0-10 scale): ")
    if (input_char == "") { cat("Input cannot be empty.\n"); next } # Check for empty input
    input_num <- suppressWarnings(as.numeric(input_char))
    if (!is.na(input_num)) {
       # Optional: Add range checks if needed
      if (input_num >= 0 && input_num <= 10) {
          pap_grade <- input_num
          break # Exit loop if valid
      } else {
         cat("Grade must be between 0 and 10.\n")
      }
    } else {
      cat("Invalid input. Please enter a number.\n")
    }
  }

  # --- Get Presentation Grade (Integrated Loop) ---
   while(TRUE) {
    input_char <- readline(prompt = "Enter the Final Presentation grade (0-10 scale): ")
    if (input_char == "") { cat("Input cannot be empty.\n"); next } # Check for empty input
    input_num <- suppressWarnings(as.numeric(input_char))
    if (!is.na(input_num)) {
       # Optional: Add range checks if needed
      if (input_num >= 0 && input_num <= 10) {
          presentation_grade <- input_num
          break # Exit loop if valid
      } else {
         cat("Grade must be between 0 and 10.\n")
      }
    } else {
      cat("Invalid input. Please enter a number.\n")
    }
  }

  # --- Calculate Weighted Grade ---
  # Single line calculation using weights
  final_numeric_grade <- (mean(assignment_grades) * 0.50) + (pap_grade * 0.20) + (presentation_grade * 0.30)

  # --- Apply Rounding Rule ---
  # Round up to nearest tenth
  rounded_grade_tenth <- ceiling(final_numeric_grade * 10) / 10

  # --- Determine Letter Grade (Concise using cut) ---
  # Define the breaks (lower bounds of each grade category) and corresponding labels
  # Using right = FALSE means intervals are [lower, upper)
  breaks <- c(-Inf, 6.0, 6.6, 7.1, 7.6, 8.1, 8.6, 9.1, Inf)
  labels <- c("F", "D", "C", "B-", "B", "B+", "A-", "A")
  # Use the raw numeric grade for determining the letter grade category
  letter_grade <- cut(final_numeric_grade, breaks = breaks, labels = labels, right = FALSE, include.lowest = TRUE)


  # --- Output Results ---
  # Minimal essential output
  cat("\n--- Final Grade Calculation (0-10 Scale) ---\n")
  cat("Weighted Numeric Grade:", round(final_numeric_grade, 3), "\n")
  cat("Rounded Grade (Ceiling to nearest tenth):", sprintf("%.1f", rounded_grade_tenth), "\n")
  cat("Final Letter Grade:", as.character(letter_grade), "\n") # Convert factor to character
  cat("-------------------------------------------\n")

  # --- Return Results ---
  # Return the essential results invisibly
  invisible(list(
    numeric_grade = final_numeric_grade,
    rounded_grade_tenth = rounded_grade_tenth,
    letter_grade = as.character(letter_grade)
  ))
}

# --- How to use the function ---
# 1. Load this code into your R session.
# 2. Run the function: qtm385_grader()
# 3. Follow the prompts in the console to enter the grades (0-10 scale).

# Example usage:
# > qtm385_grades()
# > Enter the student's grades (on a 0-10 scale):
# > Enter the 10 assignment grades (0-10 scale, separated by space or comma): 8.5 9 7.8 9.2 8.8 9.5 8 7.5 8.9 9.1
# >  -> Assignment Average: 8.63
# > Enter the Pre-Analysis Plan (PAP) grade (0-10 scale): 9
# > Enter the Final Presentation grade (0-10 scale): 9.5
#
# > --- Final Grade Calculation (0-10 Scale) ---
# > Weighted Numeric Grade: 8.965
# > Rounded Grade (Ceiling to nearest tenth): 9.0
# > Final Letter Grade: A-
# > -------------------------------------------
