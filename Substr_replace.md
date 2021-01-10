# Substr_replace

![](img/substr0.jpg)

### <span style="color: orange"> การปกปิดที่สำคัญข้อมูลด้วย Substr_replace method   </span>

ในการใช้งานข้อมูล Programmer จะต้องมีความตระหนักตลอดเวลา โดยเฉพาะในการแสดงค่าข้อมูลที่มีความสำคัญ
เช่นข้อมูลส่วนตัวที่มีความอ่อนไหว ,ข้อมูลส่วนบุคคล เป็นต้น  นอกจากจะต้องศึกษาข้อกำหนดด้านกฎหมายแล้ว ในการสร้าง Application 
ก็จะต้องเลือกใช้เครื่องมือที่สามารถปิดบังข้อมูลที่สำคัญได้ตามต้องการสำหรับการเขียน program ด้วยภาษา PHP ผู้เขียนขอแนะนำการใช้  
Substr_replace() เพื่อใช้ปิดบังข้อมูลอักขระที่ ต้องการได้ซึ่งสามารถเรียก method ใช้ได้ด้วย คำสั่งง่ายๆ ดังตัวอย่าง

```
<!DOCTYPE html>
<html>
<body>
<?php
$var = '1234123412341234';
Echo $var;
?>
</body>
</html> 
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

แหล่งอ้างอิง

https://www.w3schools.com/php/phptryit.asp?filename=tryphp_func_string_substr_replace
https://www.imooh.com/
