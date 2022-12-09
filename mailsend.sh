#/bin/bash

FROM='mamunkhan3523@gmail.com'
TO='mkmamun031@gmail.com'
SUBJECT='This is a test message'

BODY="This is a test mail message body.Hi there."

printf "From: <%s>\nTo: <%s>\nSubject: %s\n\n%s" "$FROM" "$TO" "$SUBJECT" "$BODY" | ssmtp "$FROM"

