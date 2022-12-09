#! /bin/bash
cat greet.txt
echo "Secret Agent Application"
echo "-------------------------"
message="Kill 10 sleeping students"
FROM='mamunkhan3523@gmail.com'
TO='mkmamun031@gmail.com'
SUBJECT='Your OTP is '

echo "Enter Your Name"
echo "---------------" 
read -p ": " name
echo "---------------"
echo "Favorite Actor"
echo "---------------"
read -p ": " actor
echo "---------------"
echo "Lucky Number"
echo "---------------"
read -p ": " lucky
echo "Favorurite Dish"
echo "---------------"
read -p ": " dish
echo "---------------"
first_char_name=$(echo -n $name | cut -c 1)
len=$(echo -n $actor | wc -c)
last_char_actor=$(echo -n $actor | cut -c $len)
no_of_characters_dish=$(echo -n $dish | wc -c)
if [ $first_char_name = "d" -a $last_char_actor = "r" -a $lucky -eq 7 -a $no_of_characters_dish -ge 6 ]; then
  clear
  cat output.txt
  echo "Hello Agent! Thanks for Completing The First Step Verification"
  echo "Please Login to continue"
  echo "-------------------------"
  read -p "Enter Your User Name : " user
  echo "-------------------------" 
  read -p "Enter Your Password : " pass
  echo "-------------------------" 
  if (( $user == "admin" && $pass == "${name}123" ))
  then
     clear
     cat output.txt
     echo "Second Step Verification Successful"
     printf "Redirecting"
     for i in 1 2 3 4 5  # First loop.
	
	do
          printf  "."
          sleep 1
    	done
     sleep 1
     clear
     cat output.txt
     echo "Your Task Is"
     echo "-------------"
     echo "$message" | tr '[A-Za-z]' '[N-ZA-Mn-za-m]'
     echo "-------------"
     echo "Enter the secret code to decrypt the message"
     echo "------------------------------------------------"
     read -p ": " msg
     echo "------------------------------------------------"
      if (( $msg == "1234" ))
      then
            
            if [ $# -eq 1 ]; 
            then
              length=$1
            else
              length=5
            fi
            digits=({2..9})
            lower=({a..k} {m..n} {p..z})
            upper=({A..N} {P..Z})
            CharArray=(${digits[*]} ${lower[*]} ${upper[*]})
            ArrayLength=${#CharArray[*]}
            password=""
            for i in `seq 1 $length`
            do
              index=$(($RANDOM%$ArrayLength))
              char=${CharArray[$index]}
              password=${password}${char}
            done
            BODY="Hey Agent: Your OTP is : ${password}"
            echo "An OTP has been sent to ${TO} . Please Check Your Inbox"
            printf "From: <%s>\nTo: <%s>\nSubject: %s\n\n%s" "$FROM" "$TO" "$SUBJECT" "$BODY" | ssmtp "$TO"
            read -p "Enter Your OTP: " otp
            if (( $password == "${otp}"  ))
            then
               clear
               cat verify.txt
               echo "Thank you for validating yourself as our secret agent"
               echo "-----------------------------------------------------"
               echo "Your Task Is : ${message}"
               echo "-----------------------------------------------------"
            else
               echo "OTP IS NOT VALID!"
            fi

      else
            echo "Decryption Failed"
      fi
  else
     echo "Login Failed! Go Away or I will Kill You!"
  fi
else
  cat entry.txt
fi
