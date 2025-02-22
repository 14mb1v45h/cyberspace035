#!/bin/bash
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/Subdomain_Bruteforce_bheh/main/ascii.sh" | lolcat
echo ""
# Generate a random Sun Tzu quote for offensive security

# Array of Sun Tzu quotes
quotes=("The supreme art of war is to subdue the enemy without fighting." "All warfare is based on deception." "He who knows when he can fight and when he cannot, will be victorious." "The whole secret lies in confusing the enemy, so that he cannot fathom our real intent." "To win one hundred victories in one hundred battles is not the acme of skill. To subdue the enemy without fighting is the acme of skill.")

# Get a random quote from the array
random_quote=${quotes[$RANDOM % ${#quotes[@]}]}

# Check if lolcat, fortune-mod, figlet and curl are installed
if ! command -v lolcat > /dev/null; then
  echo "lolcat not found, installing..."
  if command -v dnf > /dev/null; then
    sudo dnf install -y lolcat
  elif command -v yum > /dev/null; then
    sudo yum install -y lolcat
  elif command -v apt-get > /dev/null; then
    sudo apt-get install -y lolcat
  else
    echo "Error: package manager not found, please install lolcat manually"
    exit 1
  fi
fi

if ! command -v fortune > /dev/null; then
  echo "fortune-mod not found, installing..."
  if command -v dnf > /dev/null; then
    sudo dnf install -y fortune-mod
  elif command -v yum > /dev/null; then
    sudo yum install -y fortune-mod
  elif command -v apt-get > /dev/null; then
    sudo apt-get install -y fortune-mod
  else
    echo "Error: package manager not found, please install fortune-mod manually"
    exit 1
  fi
fi

if ! command -v figlet > /dev/null; then
  echo "figlet not found, installing..."
  if command -v dnf > /dev/null; then
    sudo dnf install -y figlet
  elif command -v yum > /dev/null; then
    sudo yum install -y figlet
  elif command -v apt-get > /dev/null; then
    sudo apt-get install -y figlet
  else
    echo "Error: package manager not found, please install figlet manually"
    exit 1
  fi
fi

if ! command -v curl > /dev/null; then
  echo "curl not found, installing..."
  if command -v dnf > /dev/null; then
    sudo dnf install -y curl
  elif command -v yum > /dev/null; then
    sudo yum install -y curl
  elif command -v apt-get > /dev/null; then
    sudo apt-get install -y curl
  else
    echo "Error: package manager not found, please install curl manually"
    exit 1
  fi
fi

echo "All dependencies installed successfully"

# Print the quote
echo "Offensive security tip: $random_quote - Sun Tzu" | lolcat
sleep 1
echo "MEANS, IT'S ☕ 1337 ⚡ TIME, 369 ☯ " | lolcat
sleep 1
curl --silent "https://raw.githubusercontent.com/blackhatethicalhacking/ScopeHunter/main/ScopeHunter_ascii.sh" | lolcat
echo ""
echo "[YOUR ARE USING ScopeHunter.sh] - (v1.0) CODED BY 14mb1v45h' Abou-Chabké WITH ❤ FOR blackhatethicalhacking.com for Educational Purposes only!" | lolcat
sleep 1
#check if the user is connected to the internet
tput bold;echo "CHECKING IF YOU ARE CONNECTED TO THE INTERNET!" | lolcat
# Check connection
wget -q --spider https://google.com
if [ $? -ne 0 ];then
    echo "++++ CONNECT TO THE INTERNET BEFORE RUNNING ScopeHunter.sh!" | lolcat
    exit 1
fi
tput bold;echo "++++ CONNECTION FOUND, LET'S GO!" | lolcat

function main_menu() {
  # Define arrays for providers and data urls
  providers=( "HackerOne" "BugCrowd" "Intigriti" "YesWeHack" )
  data_urls=(
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/hackerone_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/bugcrowd_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/intigriti_data.json"
    "https://raw.githubusercontent.com/arkadiyt/bounty-targets-data/main/data/yeswehack_data.json"
  )

  # Show providers
  echo "Available Providers:"
  for provider in "${providers[@]}"; do
    echo -e "\033[33m$provider\033[0m"
  done

  # Ask for target company name
  echo -e "\033[32mEnter target company name: \033[0m"
  read company

  # Loop through each provider and check for results
  for i in "${!providers[@]}"; do
    provider=${providers[i]}
    data_url=${data_urls[i]}

    filtered_targets=$(curl $data_url 2>/dev/null | grep -i $company | awk -F'"' '{print $4}')

    if [[ ! -z $filtered_targets ]]; then
      count=$(echo "$filtered_targets" | wc -l)
      echo -e "\033[36mFound \033[31m$count\033[0m \033[36mtarget(s) in $provider. Results saved under \033[33m$company\033[0m"

      mkdir -p "${company}"
      echo "${filtered_targets}" > "${company}/${provider}_${company}.txt"
    else
      echo -e "\033[36m${company} not found in the database on \033[36m${provider}"
    fi
  done
# Ask user if they want to continue or exit
echo -e "\033[32mDo you want to search again? (yes/no) \033[0m"
read choice

if [[ "$choice" =~ ^[Yy][EeSs]*$ ]]; then
  main_menu
elif [[ "$choice" =~ ^[Nn][Oo]*$ ]]; then
  exit 0
else
  echo -e "\033[31mInvalid input. Please enter yes or no.\033[0m"
  continue_or_exit
 fi
}
main_menu

#written by 14mb1v45h
