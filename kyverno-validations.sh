#!/bin/bash

# Function to run a validation check and save the result
run_validation() {
  local yaml_file=$1
  local result_file=$2

  # Check if the file exists
  if [[ ! -f $yaml_file ]]; then
    echo "File not found: $yaml_file"
    exit 1
  fi

  # Extract checks from the YAML file
  checks_count=$(yq e '.spec.checks | length' $yaml_file)

  echo "Running validations from $yaml_file..."

  # Clear or create the result file
  > $result_file

  # Loop through each check and execute the script
  for i in $(seq 0 $(($checks_count - 1))); do
    check_name=$(yq e ".spec.checks[$i].name" $yaml_file)
    script=$(yq e ".spec.checks[$i].script" $yaml_file)
    
    echo "Running check: $check_name"
    result=$(eval "$script")
    if [[ $result != "" ]]; then
      echo "Validation failed for $check_name: $result" | tee -a $result_file
    else
      echo "Validation passed for $check_name" | tee -a $result_file
    fi
  done
}

# Sleep for a specified duration before running the validations
sleep_duration=30  # Duration in seconds

# Run healthcheck validations
echo "Sleeping for $sleep_duration seconds before running healthcheck validations..."
sleep $sleep_duration
run_validation kyverno-healthcheck.yaml baseline-healthcheck-results.txt

# Sleep again before running configuration validations
echo "Sleeping for $sleep_duration seconds before running configuration validations..."
sleep $sleep_duration
run_validation kyverno-config-check.yaml baseline-config-check-results.txt

# Combine results
cat baseline-healthcheck-results.txt baseline-config-check-results.txt > baseline-assessment-results.txt

echo "Validation complete. Results saved in baseline-assessment-results.txt."
