import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class menuRecScreen extends StatefulWidget {
  const menuRecScreen({Key? key}) : super(key: key);

  @override
  State<menuRecScreen> createState() => _menuRecScreenState();
}

class _menuRecScreenState extends State<menuRecScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เมนูอาหารแนะนำ'),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: Card(
                  elevation: 4,
                  child: Container(
                    child: IconButton(
                      icon: Image.asset('assets/img/menu/menu23.jpg'),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text('ไข่ขาวก้อน'),
                                  content: SingleChildScrollView(
                                      child: Text(
                                          'ส่วนผสม\nไข่ขาวดิบ ประมาณ 15-20 ฟอง\n\nวิธีทำ\n1.เทไข่ขาวดิบในถาดสี่เหลี่ยมผืนผ้าหรือถาวงกลม\n2.นำไปนึ่งให้สุก ใช้ไฟแรงปานกลาง นาน 60 นาที\n3.นำมาตัดขนาด หรือพิมพ์เป็นรูปหัวใจ ดาว ดอกไม้ตามชอบ\n4.นำไปทอดในน้ำมันที่ร้อน \n5.สามารถนำไปแปรรูปอาหารได้หลากหลายเมนูตามต้องการ\n\nส่วนผสม (1คน)\n- ไข่ขาวก้อนทอดแล้ว 4 ก้อน\n-หมูสับ 2 ช้อนโต๊ะ\n-แครอทหั่นเป็นลูกเต๋า 1 ช้อนชา\n-ถั่วแขก/ถั่วลันเตา 1 ช้อนชา\n-เห็ดหอมหั่นเป็นชิ้นๆ 1 ดอก\n-เมล็ดข้าวโพดดิบ 1 ช้อนโต๊ะ\n-ซอสปรุงรส 1 ช้อนชา\n-พริกไทย 1/8 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-แป้งข้าวโพด 2 ช้อนชา\n-น้ำมันพืชสำหรับทอดและผัด 2 ชช.\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 18.5  กรัม')),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(
                                          'ปิด',
                                          style: TextStyle(color: Colors.blue),
                                        ))
                                  ],
                                ));
                      },
                    ),
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu10.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('เต้าหู้ไข่ขาวทรงเครื่อง'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนทอดแล้ว 4 ก้อน\n-หมูสับ 2 ช้อนโต๊ะ\n-แครอทหั่นเป็นลูกเต๋า 1 ช้อนชา\n-ถั่วแขก/ถั่วลันเตา 1 ช้อนชา\n-เห็ดหอมหั่นเป็นชิ้นๆ 1 ดอก\n-เมล็ดข้าวโพดดิบ 1 ช้อนโต๊ะ\n-ซอสปรุงรส 1 ช้อนชา\n-พริกไทย 1/8 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-แป้งข้าวโพด 2 ช้อนชา\n-น้ำมันพืชสำหรับทอดและผัด 2 ชช.\n\nวิธีทำ\n1.นำไข่ขาวก้อนทอด 4 ก้อน จัดใส่จาน\n2.ผัดหมูบดให้สุก ใส่ถั่วลันเตา เมล็ดข้าวโพด แครอท ปรุงรสด้วยน้ำปลา น้ำตาลทรายและแป้งข้าวโพดละลายน้ำเล็กน้อย คนให้ทั่วจนแป้งสุกใสและข้น นำไปราดบนไข่ขาวทอดที่เตรียมไว้ พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 18.5  กรัม \nพลังงาน = 300 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu11.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ยำหัวใจไข่ขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวพิมพ์รูปหัวใจทอด 6 ก้อน\n-น้ำปลาดี 1 ช้อนชา\n-น้ำมะนาว 2 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-พริกขี้หนูบด 1 ช้อนชา\n-กระเทียมบด 1 ช้อนชา\n-หอมใหญ่ 1 ช้อนโต๊ะ\n-มะเขือเทศ 1 ช้อนโต๊ะ\n-ผักกาดหอม 2-3 ใบ\n\nวิธีทำน้ำยำ\n1.ผสมน้ำปลา น้ำมะนาว น้ำตาลทราย\nพริกขี้หนูบด คนให้ข้ากัน\n\nวิธีทำยำ\n1.นำหอมใหญ่ มะเขือเทศ คึ่นช่าย ไข่ขาวพิมพ์รูปหัวใจใส่ชามคลุก\n2.นำน้ำยำลงคลุกให้เข้ากัน จัดใส่จานรองด้วยผักกาดหอม พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 13.6  กรัม \nพลังงาน = 102.65 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu12.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ลาบไข่ขาวเก้านางฟ้า'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนสี่เหลี่ยม 4  ก้อน\nส่วนผสมน้ำพริกลาบ\n-หอมแดง 2 ช้อนโต๊ะ\n-ข่าซอย 2 ช้อนโต๊ะ\n-ใบมะกรูดฉีก 2 ใบ\n-รากผักชี 1 ต้น\n-พริกขี้หนูแดง 1 เม็ด\nเครื่องปรุงน้ำพริกลาบ\n-น้ำมะนาว 2 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-ข้าวคั่ว 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-หอมแดงซอย 2 ช้อนโต๊ะ\n-ต้นหอมหั่นฝอย 1 ช้อนโต๊ะ\n-ผักชีฝรั่งหั่นฝอย 1 ช้อนชา\n-ผักสดแก้มปริมาณตามต้องการ\n\nวิธีทำ\n1.คั่วส่วนผสมน้ำพริกลาบ แล้วโขลกให้ละเอียด\n2.ปรุงรสด้วยเครื่องปรุงน้ำพริกลาบ ใส่ไข่ขาวก้อน คลุกเคล้าให้เข้ากัน ตักใส่จานทานกับผักสด พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 9.96  กรัม \nพลังงาน = 105.65 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu13.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดกะเพราไข่ขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนสุก 4  ก้อน\n-น้ำมันถั่วเหลือง 1 ช้อนโต๊ะ\n-ข้าวโพดอ่อน 2 ช้อนโต๊ะ\n-ถั่วฝักยาว 2 ช้อนโต๊ะ\n-ใบกะเพราเด็ด ¼ ถ้วย\n-น้ำตาลทราย 1 ช้อนชา\nน้ำปลา 1 ช้อนชา\n\nวิธีทำ น้ำพริกผัดกะเพรา\n1.กระเทียม 2 กลีบใหญ่\n2.พริกขี้หนู 5 เม็ด\n3.รากผักชี 1 ต้น\n4.โขลกส่วนผสมดังกล่าวให้ละเอียด\n\nวิธีทำ\n1.ผัดน้ำพริกที่เตรียมไว้ในน้ำมันให้เหลือง\n2.นำไข่ขาวก้อนลงผัด ตามด้วยข้าวโพดอ่อน ถั่วฝักยาว\nปรุงรสด้วยน้ำตาล น้ำปลา ใส่ใบกะเพรา ตักใส่จาน พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 9.65  กรัม \nพลังงาน = 202.96 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu17.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดถั่วงอก'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนหั่นสี่เหลี่ยมผืนผ้าทอด 2 ฟอง \n-ถั่วงอก ½ ถ้วยตวง\n-แครอทขูดฝอย 1 ช้อนโต๊ะ\n-ต้นหอม 1 ช้อนโต๊ะ\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย ½ ช้อนชา\n-กระเทียมสับ ½ ช้อนชา\n\nวิธีทำ\n1.ตั้งกระทะใส่น้ำมันให้ร้อน เจียวกระเทียมให้เหลือง นำไข่ขาวลงผัด ตามด้วยถั่วงอก แครอท ต้นหอม ปรุงรสด้วยน้ำปลา น้ำตาลทราย\nหมายเหตุ สามารถนำไข่ขาวก้อนไปผัดกับผักชนิดอื่นๆตามต้องการ พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 9.69  กรัม \nพลังงาน = 156.63 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu20.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดมักกะโรนีไข่ขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนหั่นสี่เหลี่ยมผืนผ้า 2 ฟอง \n-มักกะโรนีต้มสุก ½ ถ้วยตวง\n-หอมใหญ่หั่นเสี้ยว ¼ หัว\n-มะเขือเทศ 1 ลูก\n-ซอสมะเขือเทศ 1 ช้อนโต๊ะ\n-ต้นหอมหั่น 1 ต้น\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n\nวิธีทำ\n1.ผัดหอมใหญ่กับน้ำมันให้หอม ใส่มะเขือเทศ ซอสมะเขือเทศ ปรุงรสด้วยน้ำตาล น้ำปลา\n2.นำมักกะโรนีต้มสุก ไข่ขาวก้อน ผัดให้เข้ากัน ใส่ต้นหอมคลุกให้เข้ากันแล้วยกลง พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 11.74  กรัม \nพลังงาน = 143.03 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              GridView.count(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                children: [
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu08.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ราดหน้าเส้นใหญ่ไข่ขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม 1 คน\n-ก๋วยเตี๋ยวเส้นใหญ่ขาว ½ ถ้วยตวง\n-ปลาหมึก 2 ชิ้น\n-กุ้งสด 2 ตัว\n-คะน้าหั่นเป็นชิ้นพอดีคำ ½ ถ้วยตวง\n-แป้งมัน 1 ช้อนโต๊ะ\n-กระเทียบสับ 1 ช้อนชา\n-ซีอิ้วขาว 1 ช้อนชา\n-ซีอิ้วดำ 1 ช้อนชา\n-ซอสหอยนางรม 1 ช้อนชา\n-น้ำตาลทราย 1/2 ช้อนชาส่วนผสมเส้นใหญ่ไข่ขาว\n\nส่วนผสมเส้นใหญ่ไข่ขาว\n-ไข่ขาวดิบ 3 ฟอง\n-แป้งมัน 1 ช้อนโต๊ะ+2 ช้อนชา\n-น้ำสะอาด 50 กรัม\n\nวิธีทำเส้นใหญ่ไข่ขาว\n1.แป้งมันละลายน้ำใส่ไข่ขาวคนให้เข้ากัน\n2.นำกระทะชนิดไม่ติดทาน้ำมันเล็กน้อย นำส่วนผสมไปร่อนในกระทะพอสุกขาวนำออกจากกระทะอย่าให้สุกมากเกินไป แผ่นไข่ขาวจะแห้งกรอบ จะตัดไม่เป็นเส้น\n3.นำแผ่นไข่ขาวตัดเป็นเส้นความกว้าง ½ นิ้ว นำไปใช้เป็นเส้นใหญ่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu07.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('เส้นใหญ่ไข่ขาวผัดซีอิ๊ว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม 1 คน\nก๋วยเตี๋ยวเส้นใหญ่ขาว ½ ถ้วยตวง\nเนื้อหมูหั่นเป็นชิ้นพอดีคำ 2 ช้อนโต๊ะ\nคะน้าหั่นเป็นชิ้นพอดีคำ ½ ถ้วยตวง\nไข่ขาว 2 ฟอง\nกระเทียบสับ 1 ช้อนชา\nซีอิ้วขาว 1 ช้อนชา\nซีอิ้วดำ 1 ช้อนชา\nซอสหอยนางรม 1 ช้อนชา\nน้ำตาล 1 ช้อนชาส่วนผสมเส้นใหญ่ไข่ขาว\n-ไข่ขาวดิบ 3 ฟอง\n-แป้งมัน 1 ช้อนโต๊ะ+2 ช้อนชา\n-น้ำสะอาด 50 กรัม\n\nวิธีทำเส้นใหญ่ไข่ขาว\n1.แป้งมันละลายน้ำใส่ไข่ขาวคนให้เข้ากัน\n2.นำกระทะชนิดไม่ติดทาน้ำมันเล็กน้อย นำส่วนผสมไปร่อนในกระทะพอสุกขาวนำออกจากกระทะอย่าให้สุกมากเกินไป แผ่นไข่ขาวจะแห้งกรอบ จะตัดไม่เป็นเส้น\n3.นำแผ่นไข่ขาวตัดเป็นเส้นความ\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 16.8  กรัม \nพลังงาน = 234 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu21.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ยำเซี่ยงไฮ้ไข่ขาวต้ม'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวก้อนหั่นสี่เหลี่ยมผืนผ้า 2 ฟอง \n-มักกะโรนีต้มสุก ½ ถ้วยตวง\n-หอมใหญ่หั่นเสี้ยว ¼ หัว\n-มะเขือเทศ 1 ลูก\n-ซอสมะเขือเทศ 1 ช้อนโต๊ะ\n-ต้นหอมหั่น 1 ต้น\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย 1 ข้อนชา\n\nวิธีทำ\n1.นำเส้นเซี่ยงไฮ้ลวก ผักคะน้าลวก มะเขือเทศ ไข่ขาว และน้ำยำ ใส่ชามคลุกเคล้าให้เข้ากัน ตักใส่จาน พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 7.5  กรัม \nพลังงาน = 187.5 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu04.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ไข่ขาวตุ๋น'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน)\n-ไข่ขาว 2 ฟอง\n-แครอท 1 ช้อนโต๊ะ\n-หัวหอมใหญ่ 1 ช้อนโต๊ะ\n -ต้นหอม,ผักชี1 ช้อนโต๊ะ \n-พริกไทยป่น1/4 ช้อนชา \n-ซีอิ้วขาว 1 ช้อนชา\n\nวิธีทำ\n1.นำลังถึงใส่น้ำตั้งบนเตาให้เดือด \n2.นำไข่ขาว  ใส่แครอท หัวหอม ต้นหอม ผักชี คนส่วนผสมให้เข้ากัน ไม่ควรตีเป็นฟองเพรานึ่งแล้วหน้าจะมาสวยเรียบ ปรุงรสด้วยซีอิ้วขาว\n3.เทใส่ภาชนะทนไฟ นำไปนึ่งจนสุกสัก 15-20 นาที\n4.โรยพริกไทย พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 7.5  กรัม \nพลังงาน = 82.5 แคลอรี่')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu06.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('เย็นตาโฟรวมมิตร'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน)\n-เส้นใหญ่  ½ ถ้วยตวง\n-ผักบุ้งไทยหั่นเป็นท่อน ½ ถ้วยตวง\n-ลูกชิ้นปลากลม 1 ลูก\n-ลูกชิ้นปลาแท่ง 1 ชิ้น\n-ลูกชิ้นปลารักบี้ 1 ลูก\n-ปลาหมึกแช่ 1 ชิ้น\n-เกี้ยวปลา 1 ชิ้น\n-กุ้งลวก 2 ตัว\n-น้ำซุปกระดูก 1 ถ้วยตวง\n\nวิธีทำ\n1.ต้มน้ำซุปโดยใช้กระดูกหมูส่วนสันหลังล้างให้สะอาด นำกระดูกหมูใส่ขณะที่น้ำยังไม่เดือด ปรุงรสด้วยซีอิ้วขาวรากผักชีกระเทียมพริกไทยบด เมื่อเดือดลดไฟลงและช้อนฟองออก เคี่ยวต่อด้วยไฟอ่อนจะได้น้ำซุปและมีความหวานของกระดูก\n2. ลวกเส้นก๋วยเตี๋ยวและผักบุ้ง พอสุกพรมด้วยน้ำมันเจียวกระเทียม\n3.ลวกลูกชิ้นต่างๆและกุ้งจนสุก ใส่ในชามก๋วยเตี๋ยว\n4.เติมซอสปรุงรสเย็นตาโฟและน้ำซุปก่อนเสิร์ฟ โรยกระเทียมเจียว ปรุงรสตามชอบ\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 16.8  กรัม \nพลังงาน = 234 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu14.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ไข่ขาวพะโล้'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ไก่ต้มสุก 1 ฟอง (ผ่า นำไข่แดงออกโดยไม่ต้องให้ขาดออกจากกัน)\n-เนื้อสันในไก่บด 1 ช้อนโต๊ะ\n-ไข่ขาวก้อนหั่นสี่เหลี่ยมลูกเต๋าขนาด 1X1 นิ้ว 2 ก้อน (ทอดให้เหลือง พักไว้)\n-กระเทียมสับ ¼ ช้อนชา\n-รากผักชี 1 ราก\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-ผงพะโล้ ¼ ช้อนชา\n-อบเชยโป๊ยกั๊ก 1 ชิ้นเล็ก\n-น้ำซุปไก่ 1 ถ้วยตวง\n\nวิธีทำ\n1.นำเนื้อสันในไก่ยัดเข้าในไข่ไก่ที่ผ่าเตรียมไว้แทนที่ไข่แดงให้เต็ม นำไปทอดไฟปานกลางจนเหลือง พักไว้\n2.โขลกกระเทียมพริกไทย รากผักชีให้ละเอียด ผัดในน้ำมันให้หอม\n3.นำส่วนผสมในข้อ2.ใส่ลงในน้ำซุป ใส่ผงพะโล้ อบเชย โป๊ยกั๊ก ใส่ไข่ไก่ที่ยัดไส้ไว้ลงพร้อมกัน เคี่ยวสักพักด้วยไฟอ่อน ปรุงรสด้วยน้ำปลา น้ำตาลทราย พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 11.53  กรัม \nพลังงาน = 214.91 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu15.jpg'),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('ไข่ขาวลูกเขย'),
                              content: SingleChildScrollView(
                                  child: Text(
                                      'ส่วนผสม (1คน)\n- ไข่ไก่ต้มสุก 1 ฟอง (ผ่า นำไข่แดงออกโดยไม่ต้องให้ขาดออกจากกัน)\n-เนื้อสันในไก่บด 1 ช้อนโต๊ะ\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำตาลปี๊บ 1 ช้อนโต๊ะ\n-น้ำปลาดี 1 ช้อนชา\n-หอมแดงซอยเจียว 1 ช้อนชา\n-พริกแห้งทอด 2 เม็ด\n-ผักชี 1 ต้น\nวิธีทำน้ำราดไข่ลูกเขย\n1.เคี่ยวน้ำตาลปี๊บกับน้ำปลา น้ำมะขามเปียกให้ข้นพอประมาณด้วยไฟอ่อน\n\nวิธีทำ\n1.นำเนื้อสันในไก่บดปั้นเป็นก้อน ยัดเข้าในไข่ไก่ต้มที่ผ่าเตรียมไว้ให้เต็มแทนที่ไข่แดง นำไปทอดไฟปานกลางจนเหลือง พักไว้\n2.ผ่าไข่ออกเป็น 2 ซีก นำน้ำราดที่เตรียมไว้ราดให้ทั่ว แต่งหน้าด้วยหอมเจียว พริกแห้งทอด ผักชี พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 8.79  กรัม \nพลังงาน = 212.18 แคลอรี่ \n')),
                              actions: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'ปิด',
                                      style: TextStyle(color: Colors.blue),
                                    ))
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu03.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('แกงจืดไข่ขาวต้ม'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน)\n-ไข่ขาว 2 ฟอง \n-แครอท 1 ช้อนโต๊ะ\n-ต้นหอม,ผักชี\n-กระเทียมเจียว 1 ช้อนชา\n-ซีอิ้วขาว 1ช้อนชา\n-น้ำต้มกระดูกหมู\n\nวิธีทำ\n1.นำน้ำต้มกระดูกหมูตั้งไฟ พอน้ำเดือดใส่ไข่ขาว แครอท \n 2.รอให้เดือดอีกรอบ ปิดไฟ ใส่ต้นหอม ผักชี ปรุงรสตามชอบ\n3.ตักใส่ชาม โรยกระเทียมเจียว พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 7.0  กรัม \nพลังงาน = 121 แคลอรี')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu02.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดฟักไข่ขาวต้ม'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน)\n-ไข่ขาว 2 ฟอง \n-ฟัก 1 ถ้วยตวง\n-กระเทียมกลีบ 1 ช้อนโต๊ะ\n-ต้นหอม พริกแดง \n-น้ำตาลทราย ½ ช้อนชา\n-ซีอิ้วขาว 1 ช้อนชา \n-น้ำต้มกระดูกหมู \n-น้ำมันพืช 2 ช้อนชา\n\nวิธีทำ\n1.ตั้งกระทะใส่น้ำมันให้ร้อน เจียวกระเทียมให้เหลือง \n2.นำฟักลงผัดจนสุก ใส่น้ำต้มกระดูกหมู ไข่ขาว ต้นหอม พริกแดง ปรุงรสด้วยน้ำปลา น้ำตาลทราย\nหมายเหตุ สามารถนำไข่ขาวก้อนไปผัดกับผักชนิดอื่นๆตามต้องการ พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 7.5  กรัม \nพลังงาน = 182.5 แคลอรี่')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu01.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('แกงส้มไข่ขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน) \n-ไข่ขาวต้มสุก 2 ฟอง\n-เนื้อปลา 2 ช้อนโต๊ะผักกาดขาว 1 ทัพพี\n-น้ำพริกแกงส้ม 1 ช้อนชา\n-น้ำตาลปีบ 1 ช้อนชา\n-ซีอิ้วขาว 1 ช้อนชา\n-น้ำมะขามเปียก 3 ช้อนโต๊ะ \n-น้ำต้มกระดูกหมู ½ ถ้วยตวง \n\nวิธีทำ\n1.นำน้ำต้มกระดูกหมูตั้งไฟ พอน้ำเดือดใส่น้ำพริกแกงส้ม\n2.รอให้เดือดอีกรอบใส่ผักที่เตรียมไว้\n3.พอผักใกล้สุก ให้ใส่เนื้อปลาลงไป ปล่อยทิ้งไว้ห้ามคน เพราะปลาจะเหม็นคาว รอจนเนื้อปลาสุก ใส่ไข่ขาวตามลงไป ปรุงรสตามชอบ พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 15 กรัม \nพลังงาน = 185 แคลอรี่')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu05.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ป่นไข่ขาวใส่มะเขือ'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม(1 คน)\n-ไข่ขาวต้มสุก 2 ฟอง\n-มะเขือเปราะต้มสุก 4 ผล\n-พริกขี้หนู๔เผา 4 เม็ด\n-หัวหอมเผา 3 หัว\n-กระเทียมเผา 6 กลีบ\n-ต้นหอม,ผักชี\n-ซีอิ้วขาว 1 ช้อนชา\n\nวิธีทำ\n1.นำหัวหอมเผา กระเทียมเผา พริกขี้หนูเผา มะเขือเปราะต้มสุก มาตำลงในครก จนส่วนผสมเข้ากันดี \n2.นำไข่ขาวมาหั่นเป็นชิ้นเล็กๆใส่ไข่ขาวคลุกเคล้าให้เข้ากัน \n3.ปรุงรสตามใจชอบ โรยต้นหอมผักชี  พร้อมรับประทานกับผักสดตามชอบ\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 8.0  กรัม \nพลังงาน = 95 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu09.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('น้ำพริกกุ้งสด'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- กุ้งขนาดกลางลวก 4 ตัว\n- กระเทียมปอกเปลือก 1 ช้อนโต๊ะ\n- หอมแดง 1 ช้อนโต๊ะ \n- พริกสดหนุ่ม 3 เม็ด (เพิ่มลดตามชอบ)\n- น้ำมะนาว 1 ช้อนโต๊ะ\n\nวิธีทำ\n1.กุ้ง(ล้างทำความสะอาด,และเปลือก) นำไปต้มในน้ำเดือดจนสุก นำไปหั่นหยาบๆ\n2.พริกสดหนุ่ม,หอมแดงและกระเทียมไปคั่วในกระทะจนหอม จนส่วนผสมทั้งหมดเข้ากันดีแต่ไม่ละเอียดจนเกินไป\n3.ปรุงรสด้วยน้ำปลา,น้ำมะนาวและน้ำตาล จากนั้นจึงเติมเนื้อกุ้งผสมให้เข้ากัน (ระวังอย่าให้เนื้อกุ้งเละจะไม่น่าทาน)\n4.ตักน้ำพริกใส่ถ้วย เสิร์ฟพร้อมผักสด (หรือผักนึ่ง)และไข่ขาวต้ม พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 16.0  กรัม \nพลังงาน = 115 แคลอรี่\n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu22.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดเปรี้ยวหวานไข่ขาวต้ม'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวต้ม 2 ฟอง \n-แตงกวา ½ ถ้วยตวง\n-แครอท 1 ช้อนโต๊ะ\n-หอมหัวใหญ่ ½ ถ้วยตวง\n-ซอสมะเขือเทศ 1 ช้อนโต๊ะ\n-ต้นหอมหั่น 1 ต้น\n-กระเทียบสับ 1 ช้อนโต๊ะ\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย 1 ช้อนชา\n-ซอสมะเขือเทศ 1 ช้อนโต๊ะ\n-น้ำต้มกระดูกหมู 1 ทัพพี\n\nวิธีทำ\n1.เจียวกระเทียมให้หอม  ใส่แตงกวาแครอท หัวหอมใหญ่ลงผัด เติมน้ำซุปกระดูกหมู ผัดจนใกล้สุก ใส่ไข่ขาว ซอสมะเขือเทศ เครื่องปรุงรส ตักใส่จาน พร้อมรับประทาน \n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 7.5  กรัม \nพลังงาน = 192.5 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu19.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ไข่ขาวเจียว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวดิบ 2 ฟอง \n-แป้งข้าวโพด ½ ช้อนชา\n-มะเขือเทศ 1 ช้อนชา.\n-แครอท 1 ช้อนชา\n-หอมแดงซอย 1 ช้อนชา\n-ต้นหอม 1 ช้อนชา\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n\nวิธีทำ\n1.ตีไข่ขาวผสมกับแป้งข้าวโพด (ละลายน้ำเล็กน้อย) ให้เข้ากัน เพิ่มสีสันด้วยมะเขือเทศ แครอท หอมแดง ต้นหอม ปรุงรสด้วยน้ำปลา\n2.นำลงทอดในน้ำมันร้อนปานกลางจนเหลือง พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 8.03  กรัม \nพลังงาน = 141.03 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu16.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ไข่ขาวต้านอนุมูลอิสระ'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวดิบ 2 ฟอง \n-แครอทหั่นสี่เหลี่ยมลูกเต๋า 1 ช้อนชา\n-ฟักทองหั่นสี่เหลี่ยมลูกเต๋า 1 ช้อนชา\n-มะเขือเทศหั่นสี่เหลี่ยมลูกเต๋า1ช้อนชา\n-เห็ดหอมแห้งแช่น้ำหั่นสี่เหลี่ยมลูกเต๋า 1 ช้อนชา\n-ต้นหอมหั่นฝอย 1 ต้น\n-น้ำปลาดี 1 ช้อนชา\n-กระเทียมเจียว ½ ช้อนชา\n\nวิธีทำ\n1.นำไข่ขาวดิบตีให้เข้ากัน นำแครอท ฟักทอง มะเขือเทศ เห็ดหอม ต้นหอมคลุกเคล้าให้เข้ากัน ปรุงรสด้วยน้ำปลา เติมน้ำลงเล็กน้อย\n2.เทใส่ถ้วย นำไปนึ่งด้วยไฟแรงจนสุก โรยด้วยกระเทียมเจียว พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 8.98  กรัม \nพลังงาน = 77.4 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: Container(
                      child: IconButton(
                        icon: Image.asset('assets/img/menu/menu18.jpg'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text('ผัดบวบไข่หอมเห็ดขาว'),
                                    content: SingleChildScrollView(
                                        child: Text(
                                            'ส่วนผสม (1คน)\n- ไข่ขาวดิบ 2 ฟอง \n-บวบเหลี่ยม ½ ถ้วยตวง\n-เห็ดหอม 2 ช้อนโต๊ะ\n-แครอทขูดฝอย 2 ช้อนชา\n-น้ำมันถั่วเหลือง 2 ช้อนชา\n-น้ำปลาดี 1 ช้อนชา\n-น้ำตาลทราย ½ ช้อนชา\n-กระเทียมสับ ½ ช้อนชา\n\nวิธีทำ\n1.ตั้งกระทะใส่น้ำมันให้ร้อน เจียวกระเทียมให้เหลือง ใส่เห็ดหอม บวบ  แครอท ผัดให้ทั่วปรุงรสด้วยน้ำปลา น้ำตาลทราย พร้อมรับประทาน\n\nโปรตีนและพลังงานที่ได้รับจากเมนูนี้\nโปรตีน = 10.18  กรัม \nพลังงาน = 184.88 แคลอรี่ \n')),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'ปิด',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ))
                                    ],
                                  ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
