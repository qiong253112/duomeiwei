﻿SET NAMES 'utf8';
DROP DATABASE IF EXISTS kaifanla_new;
CREATE DATABASE kaifanla_new CHARSET=UTF8;
USE kaifanla_new;
CREATE TABLE kf_dish(
    did INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(64),
    price FLOAT(6,2),
    img_sm VARCHAR(64),
    img_lg VARCHAR(64),
    detail VARCHAR(2048),
    material VARCHAR(2048)
);
INSERT INTO kf_dish(did,img_sm,img_lg,name,price,material,detail) VALUES
(   null,
    'lg01.jpg',
    'sm01.jpg',
    '【蟹蟹你偷吃】',
    258,
    '建议2-4人食 含5套餐具  约13×13cm  约480克  ',
    '手工打发而成的进口鲜奶油，口感绵密，精致细腻，这份雪白让你有如获至宝的幸福感！新鲜的水果，与蛋糕的精心配比，酸甜清爽，回味无穷 '
),
(   null,
    'lg02.jpg',
    'sm02.jpg',
    '【雪域牛乳芝士蛋糕】',
    198,
    '建议2-4人食 含5套餐具  约13×13cm  约480克',
    '无盐黄油，白巧克力，芝士，淡奶油，手工打发而成的进口鲜奶油，口感绵密，精致细腻，这份雪白让你有如获至宝的幸福感！新鲜的水果，与蛋糕的精心配比，酸甜清爽，回味无穷'
),
(   null,
    'lg03.jpg',
    'sm03.jpg',
    '【芒果熔岩星球蛋糕】',
    318,
    '卡福洛芒果泥、稀奶油、芒果',
    '工打发而成的进口鲜奶油，口感绵密，精致细腻，这份雪白让你有如获至宝的幸福感！新鲜的水果，与蛋糕的精心配比，酸甜清爽，回味无穷'
),
(   null,
    'lg04.jpg',
    'sm04.jpg',
    '【哈!蜜瓜蛋糕】',
    318,
    '黑巧克力、蜜瓜味力娇酒、稀奶油、无盐黄油、白巧克力',
    '建议2-4人食 含5套餐具  约13×13cm  约480克'
),
(   null,
    'lg05.jpg',
    'sm05.jpg',
    '【芒果钻石雪域双拼蛋糕】',
    298,
    '奶油芝士、无盐黄油、起泡葡萄酒',
    '建议5-8人食 含10套餐具  约17×17cm  约950克'
),
(   null,
    'lg06.jpg',
    'sm06.jpg',
    '【草莓拿破仑蛋糕】',
    458,
    '新鲜草莓、幼砂糖、黄油、淡奶油',
    '建议10-12人食 含15套餐具  约22×22cm  约1500克'
),
(   null,
    'lg07',
    'sm07.jpg',
    '【莓果绵绵蛋糕 】',
    12,
    '新鲜草莓、淡奶油',
    '颗颗鲜红草莓散发诱人浓郁果香，携手爽滑细腻的鲜奶油于如浪波纹中舞出一曲甜蜜华尔兹，软绵香甜的香草戚风蛋糕，包裹纯酥脆糖和醇厚黄油，在草莓粒粒脆的星星点缀下，绽放专属少女心得纯真浪漫'
),
(   null,
    'lg08.jpg',
    'sm08.jpg',
    '【罗马假日】',
    128,
    '新鲜芒果、淡奶油',
    '蛋糕很美味，蛋糕底是用曲奇饼一样的托盘，中间是细滑的蛋糕，上边的芒果是新鲜果，吃起来清甜不腻，下边的饼干很香，牛油味刚刚好，女儿争着要吃蛋糕底的曲奇。我订的送达时间也很准时。配套的小盘子和小叉叉也算精致，不愧米其林品质。很满意。'
);
##SELECT * FROM kf_dish;
/*用户表*/
CREATE TABLE kf_users(
    userid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    uname VARCHAR(20),                     /*用户名*/
    pwd VARCHAR(20),                       /*密码*/
    phone VARCHAR(20)                      /*电话*/
);
INSERT INTO kf_users VALUES
(NULL,'mary','11111','13111112345'),
(NULL,'jerry','22222','13819196547'),
(NULL,'john','33333','13819196547');
/*订单表*/
CREATE TABLE kf_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,     /*订单ID*/
    userid INT,                             /*用户*/
    phone VARCHAR(16),                      /*联系电话*/
    user_name VARCHAR(16),                  /*收货方用户名*/
    order_time LONG,                        /*下单时间*/
    addr VARCHAR(256),                      /*订单地址*/
    totalprice FLOAT(6,2)                   /*订单总价*/
);
INSERT INTO kf_order VALUES
(NULL,1,'13501234567','曹品熙',1445154859209,'大柳树路29号',120.5),
(NULL,1,'13501257543','曹品薇',1445154997543,'大柳树路29号',212.5),
(NULL,2,'13207654321','曹品依',1445254997612,'大柳树路29号',255),
(NULL,2,'13899999999','曹广杰',1445354959209,'大柳树路29号',135);

/**购物车表**/
CREATE TABLE kf_cart(
    ctid INT PRIMARY KEY AUTO_INCREMENT, /*购物车编号*/
    userid INT,                          /*用户编号：假定有用户id为 1 和 3 的两个用户有数据*/
    did INT,                             /*产品编号*/
    dishCount INT                      /*数量*/
);
INSERT INTO kf_cart VALUES (1,1,1,1),
(2,1,2,4),
(3,1,5,2),
(4,3,2,10),
(5,3,6,1);
##SELECT * FROM kf_order;
/**订单详情表**/
CREATE TABLE kf_orderdetails(
    oid INT ,                            /*订单编号*/
    did INT,                             /*产品id*/
    dishCount INT,                     /*购买数量*/
    price FLOAT(8,2)                     /*产品单价：需要记载，因为产品价格可能波动*/
);
INSERT INTO kf_orderdetails VALUES (1,1,2,5),
(1,2,1,10.5),
(2,3,1,12.5),
(3,1,3,5),
(3,2,4,10),
(4,4,7,5),
(5,5,5,4),
(5,6,2,12.5);
