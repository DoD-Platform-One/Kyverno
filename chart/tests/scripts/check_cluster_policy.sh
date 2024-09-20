#!/bin/bash

# Function to check for ClusterPolicy
check_cluster_policy() {
  # Number of attempts
  local max_attempts=5

  # Time to wait between attempts (in seconds)
  local wait_time=6

  # Name of the ClusterPolicy to check
  local policy_name="$1"
  local attempt=1
  local found=0

  while [ $attempt -le $max_attempts ]
  do
      echo "Attempt $attempt: Checking for ClusterPolicy '$policy_name'..."
      kubectl get clusterpolicy "$policy_name" &> /dev/null

      if [ $? -eq 0 ]; then
          echo "ClusterPolicy '$policy_name' found."
          found=1
          break
      fi

      if [ $attempt -lt $max_attempts ]; then
          echo "ClusterPolicy '$policy_name' not found. Retrying in $wait_time seconds..."
          sleep $wait_time
      fi

      attempt=$((attempt + 1))
  done

  if [ $found -eq 0 ]; then
      echo "Error: ClusterPolicy '$policy_name' not found after $((max_attempts * wait_time)) seconds."
      exit 1
  else
      echo "ClusterPolicy '$policy_name' check completed successfully."
      exit 0
  fi
}