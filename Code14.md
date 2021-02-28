# Substr_replace

![](img/substr0.jpg)

### <span style="color: orange"> การปกปิดที่สำคัญข้อมูลด้วย Substr_replace method   </span>

ในการใช้งานข้อมูล Programmer จะต้องมีความตระหนักตลอดเวลา โดยเฉพาะในการแสดงค่าข้อมูลที่มีความสำคัญ
เช่นข้อมูลส่วนตัวที่มีความอ่อนไหว ,ข้อมูลส่วนบุคคล เป็นต้น  นอกจากจะต้องศึกษาข้อกำหนดด้านกฎหมายแล้ว ในการสร้าง Application 
ก็จะต้องเลือกใช้เครื่องมือที่สามารถปิดบังข้อมูลที่สำคัญได้ตามต้องการสำหรับการเขียน program ด้วยภาษา PHP ผู้เขียนขอแนะนำการใช้  
Substr_replace() เพื่อใช้ปิดบังข้อมูลอักขระที่ ต้องการได้ซึ่งสามารถเรียก method ใช้ได้ด้วย คำสั่งง่ายๆ ดังตัวอย่าง

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
    s.login(msg['From'], 'asdf@1234')
    s.sendmail(msg['From'], msg['To'], msg.as_string())
    s.quit()
From =      "ptmsmut@gmail.com"
To =        "6217810010@mutacth.com"
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

```
1234123412341234
```

```
<!DOCTYPE html>
<html>
<body>
<?php
$var = '1234123412341234';
$var = substr_replace($var, str_repeat("X", 8), 4, 8);
Echo $var;
?>
</body>
</html> 
```

```
1234XXXXXXXX1234 
```

แหล่งข้อมูลอ้างอิง

https://www.w3schools.com/php/phptryit.asp?filename=tryphp_func_string_substr_replace
https://www.imooh.com/
