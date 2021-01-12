# Error and Exception handling  

### <span style="color: orange">  Error and Exception handling อีกหนึ่งปัจจัยที่ช่วยลดความเสี่ยงที่เกิดจากการทำงานที่ผิดพลาดของ Application   </span>

![](img/err0.jpg)

ในมุมของ Security ถึงแม้ว่า Programmer จะพยายามพี่จะตรวจสอบข้อบกพร่องของ Code และลดความผิดพลาด แต่แน่นอนว่าสุดท้าย Application ก็ยังมีโอกาสที่จะเกิดปัญหาเนื่องจากบางครั้งบาง error เราตรวจสอบไม่เจอในขั้นตอนการทดสอบ และยิ่ง Code มีความซับซ้อน หรือมีขนาดใหญ่ขึ้น โอกาสที่จะเกิดข้อผิดพลาดหรือ Program เกิด  error ก็ยิ่งมากขึ้นด้วย ดังนั้นจึงมีความจำเป็นที่จะต้องจัดการกับ error ทิ่เกิดขึ้นในขณะที่ Application กำลังทำงาน ในการเขียน Program บน PHP สามารถใช้ Function ที่จัดการกับ Error ได้อย่างง่าย โดยใช้ Exception() method

ตัวอย่างการใช้งาน หากไม่ได้มีการใช้ Exception 
```
<?php
//create function with an exception
function checkNum($number) {
  if($number>1) {
    throw new Exception("Value must be 1 or below");
  }
  return true;
}

//trigger exception
checkNum(2);
?>
```
=============================================================================
```
<?php
//create function with an exception
function checkNum($number) {
  if($number>1) {
    throw new Exception("Value must be 1 or below");
  }
  return true;
}
//trigger exception in a "try" block
try {
  checkNum(0);
  //If the exception is thrown, this text will not be shown
  echo 'If you see this, the number is 1 or below';
}
//catch exception
catch(Exception $e) {
  echo 'Message: ' .$e->getMessage();
}
?>
```
=============================================================================
แหล่งอ้างอิง

https://www.w3schools.com/php/php_exceptions.asp
