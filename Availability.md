# Network Availability 

### <span style="color: orange">  ตรวจสอบ Network Availability ได้ง่ายๆ บน Python   </span>

![](img/err0.jpg)


```
import os
hostname = "google.com1" #example
response = os.system("ping -n 1 " + hostname)

#and then check the response...
if response == 0:
  print(hostname, "is up")
else:
  print(hostname, "is down")

```

=============================================================================
แหล่งอ้างอิง

https://stackoverflow.com/questions/26468640/python-function-to-test-ping/39563638
