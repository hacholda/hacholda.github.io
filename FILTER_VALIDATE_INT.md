# Input Validate ตอนที่ ...
##  FILTER_VALIDATE_INT()


input Validate  เป็นการกรองและจำกัดค่า input ที่รับเข้ามายัง Application เป็นการจำกัดและลดการนำเข้าข้อมูลที่ผิดพลาดของโปรแกรม ในการรับค่าที่เป็นตัวเลขก็เช่นกันในบางครั้งจำเป็นต้องจำกัดเฉพาะค่าในช่วงที่กำหนดเพื่อควบคุมไม่ให้มีความเสียหายเกิดขึ้นกับระบบ 
บนโปรแกรมที่เขียนด้วย PHP สามารถจำกัดค่าโดยใช้ function ทีสำเร็จ สามารถเรียกใช้ได้ง่ายๆ ดังตัวอย่าง

### <span style="color: orange">  การใช้ FILTER_VALIDATE_INT() เพื่อตรวจสอบข้อมูล input   </span>

‘’’
<?php
$int = 1202;
$min = 1;
$max = 200;

if (filter_var($int, FILTER_VALIDATE_INT, array("options" => array("min_range"=>$min, "max_range"=>$max))) === false) {
    echo("Variable value is not within the legal range");
} else {
    echo("Variable value is within the legal range");
}
?>

‘’’

‘’’
>>  run-project -l php
Variable value is not within the legal range
‘’’

‘’’
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

‘’’

‘’’
>>  run-project -l php
Variable value is not within the legal range
‘’’

