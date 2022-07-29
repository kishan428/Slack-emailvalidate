#!/bin/bash

authEmail="nagendra.ks@test.com"
echo "$authEmail"

if [[ "$authEmail" =~ ^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(test)\.com$ ]]; then
  echo "Proper Email detected $authEmail"
else
  echo "Email address $authEmail is invalid."
fi
