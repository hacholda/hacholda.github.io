# File_Integrity_Monitor with email notification

```

import os, hashlib, time
files = {}

import email,smtplib
def send_message(From, To, Subject):
    msg = email.message_from_string('warning')
    msg['From'] = From
    msg['To'] = To
    msg['Subject'] = Subject
    s = smtplib.SMTP("smtp.gmail.com", 587)
    s.ehlo()
    s.starttls()
    s.login(msg['From'], 'SOURCE EMAIL PASSWORD')
    s.sendmail(msg['From'], msg['To'], msg.as_string())
    s.quit()
From =      "SOURCE EMAIL"
To =          "DESTINATION EMAIL"
Subject =   "File Change"

while True:
   for file in [item for item in os.listdir('.')]:
      hash = hashlib.md5()
      with open(file,"rb") as f:
         for chunk in iter(lambda: f.read(4096),b""):
            hash.update(chunk)
      md5 = hash.hexdigest()
      if file in files and md5 != files[file]:
         print('file change')
         send_message(From, To, Subject)
      files[file] = md5
```
