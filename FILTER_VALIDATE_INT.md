# Input Validate ตอนที่ 3
##  FILTER_VALIDATE_INT()


input Validate  เป็นการกรองและจำกัดค่า input ที่รับเข้ามายัง Application เป็นการจำกัดและลดการนำเข้าข้อมูลที่ผิดพลาดของโปรแกรม ในการรับค่าที่เป็นตัวเลขก็เช่นกันในบางครั้งจำเป็นต้องจำกัดเฉพาะค่าในช่วงที่กำหนดเพื่อควบคุมไม่ให้มีความเสียหายเกิดขึ้นกับระบบ 
บนโปรแกรมที่เขียนด้วย PHP สามารถจำกัดค่าโดยใช้ function ทีสำเร็จ สามารถเรียกใช้ได้ง่ายๆ ดังตัวอย่าง

### <span style="color: orange">  การใช้ FILTER_VALIDATE_INT() เพื่อตรวจสอบข้อมูล input   </span>

จากตัวอย่างกำหนดช่วงของตัวแปรที่เป็นตัวเลข (int) โดยให้มีค่าระหว่าง 1 ถึง 200 และให้ตัวแปรที่รับเข้ามา ($int) มีค่า 202
```
<?php
$int = 202;
$min = 1;
$max = 200;

if (filter_var($int, FILTER_VALIDATE_INT, array("options" => array("min_range"=>$min, "max_range"=>$max))) === false) {
    echo("Variable value is not within the legal range");
} else {
    echo("Variable value is within the legal range");
}
?>
```

ผลการทำงานจะแสดงค่าการตรวจสอบซึ่งจำนวนเกินกว่ากำหนด
```
>>  run-project -l php
Variable value is not within the legal range

```

เมื่อเปรียบเทียบใหม่โดยกำหนดค่าการนำเข้าตัวแปรแบบตัวเลข (int) ซึ่งมีค่าตามกำหนด
```
<?php
$int = 122;
$min = 1;
$max = 200;

if (filter_var($int, FILTER_VALIDATE_INT, array("options" => array("min_range"=>$min, "max_range"=>$max))) === false) {
    echo("Variable value is not within the legal range");
} else {
    echo("Variable value is within the legal range");
}
?>
```

Function FILTER_VALIDATE_INT() จะทำการตรวจสอบและแสดงผลซึ่งเราสามารถนำผลลัพท์ มาดำเนินการต่อไปหรือนำไปสร้าง
เงื่อนไขอื่นๆ ต่อไปได้
```
>>  run-project -l php
Variable value is not within the legal range
```

แหล่งข้อมูลอ้างอิง

https://www.3wschool.com
