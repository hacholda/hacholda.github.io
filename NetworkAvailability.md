
## Network Availability 
### <span style="color: orange">  ตรวจสอบได้ง่ายๆ บน Python ด้วย OS.system()  </span>


![](img/network0.jpg)


ในบางครั้งการเขียนโปรแกรมที่มีการเชื่อมต่อกับเครื่องอื่น ๆ จำเป็นต้องมีการตรวจสอบความพร้อมใช้ของเครื่องนั้น ๆ  เพราะหากไม่มีการตรวจสอบแล้ว โปรแกรมอาจจะทำงานไม่สมบูรณ์ไม่สามารถทำงานขั้นตอนอื่นได้เป็นสาเหตุที่จะเกิดความเสียหาย ในเคสนี้ ผู้เขียนยกตัวอย่างการตรวจสอบความพร้อมใช้ของ Network (Network Availability) โดยนำคำสั่ง Ping เรียกใช้งานผ่านโมดูล os.system() os.system() เป็น function ที่ทำหน้าที่เชื่อมต่อเพื่อขอใช้บริการผ่านการควบคุมของ Operating System เราสามารถ run คำสั่งได้โดยการเรียกใช้คำสั่งผ่าน โมดูล os.system 

### ตัวอย่างการใช้งานคำสั่ง ping บน Python ผ่าน function os.sys() สำหรับการ ตรวจสอบ Network Availability

Ping เป็นคำสั่งพื้นฐานบนระบบปฏิบัติการเกือบทุกค่าย เป็นเครื่องมือที่ใช้ในการตรวจสอบในเครือข่าย IP Network โดยคำสั่ง Ping จะสร้าง ICMP Packet ที่เป็น Echo Request ส่งไปยังเครื่อง Host ปลายทางและจะตอบข้อมูลกลับมาด้วย ICMP Echo Reply 

### คำสั่ง ping บอกอะไรได้บ้าง 
-	สามารถตรวจสอบว่า Node ปลายทางเปิดใช้งานอยุ่หรือไม่ (กรณีที่ Node ดังกล่าวเปิดให้ ping)
-	สามารถตรวจสอบระยะเวลาที่เครื่องปลายทางตอบกลับมา (Round Trip Time) 
-	บอกคุณภาพของ Network โดยสามารถบอก % ของ packet ที่ Loss
ตัวอย่างคำสั่ง

```
import os
hostname = "google.com" #example
response = os.system("ping -n 1 " + hostname)
#and then check the response...
if response == 0:
  print(hostname, "is up")
else:
  print(hostname, "is down")
```
ผลลัพท์จะแสดงรายละเอียดการใช้คำสั่ง ping และ output จากค่าที่ได้กำหนดไว้  "google.com is up"

```
Pinging google.com [172.217.174.174] with 32 bytes of data:
Reply from 172.217.174.174: bytes=32 time=27ms TTL=109

Ping statistics for 172.217.174.174:
    Packets: Sent = 1, Received = 1, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 27ms, Maximum = 27ms, Average = 27ms
google.com is up

Process finished with exit code 0
```

=============================================================================
แหล่งอ้างอิง

https://stackoverflow.com/questions/26468640/python-function-to-test-ping/39563638
