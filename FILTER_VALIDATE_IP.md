# IP Address Validation 


![](img/IP0.jpg)

 <span style="color: orange"> การตรวจสอบข้อมูล input ด้วย socket.inet_pton() method   </span>


การรับค่า input ในทุก ๆ รูปแบบ ล้วนมีความจำเป็นที่จะต้องตรวจสอบเพื่อลดความเสี่ยงที่จะเกิดขึ้นกับ
Application และในการรับค่า input ที่เป็น IP Address ก็จำเป็นต้องตรวจสอบความถูกต้องด้วยเช่นกัน ซึ่งบน Python สามารถใช้ method ในการตรวจสอบโดยไม่ยุ่งยาก   

## การใช้งาน socket.inet_pton() method

```

import socket
def is_valid_ipv4_address(address):
    try:
        socket.inet_pton(socket.AF_INET, address)
    except AttributeError:  # no inet_pton here, sorry
        try:
            socket.inet_aton(address)
        except socket.error:
            return False
        return address.count('.') == 3
    except socket.error:  # not a valid address
        return False
    return True
ipx = input("please enter IP Address : ")
result = is_valid_ipv4_address(ipx)
print(result)

```
### ----------------------------------------------------------

```
"C:\Program Files (x86)\python\python.exe" "C:/Users/hachol.d/PycharmProjects/Automation/SS-Misstalks/validate IP.py"
please enter IP Address : 5.5.5.555
False
Process finished with exit code 0

```

```
"C:\Program Files (x86)\python\python.exe" "C:/Users/hachol.d/PycharmProjects/Automation/SS-Misstalks/validate IP.py"
please enter IP Address : 192.16.20.222
True
Process finished with exit code 0

```


เมื่อ run code โดยระบุ input เป็น IP Address 2 ค่า สามารถตรวจสอบข้อมูล input ได้โดย return ค่า ออกมาเป็น True



แหล่งอ้างอิง







                                                                     






