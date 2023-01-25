# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.create!(name: 'TestUser', email: 'user@example.com', password: 'password', password_confirmation: 'password')

Category.create(title: 'Apple')
Category.create(title: 'Samsung')
Category.create(title: 'Xiaomi')

product = Product.create(name: 'Apple IPhone 14 128Gb', description: 'Screen (6.1", OLED (Super Retina XDR), 2532x1170)
/ Apple A15 Bionic / dual main camera: 12 MP + 12 MP, front camera: 12 MP / 128 GB of internal memory / 3G / LTE / 5G /
GPS / Nano- SIM / iOS 16', category_id: 1, price: 970)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/284913535.jpg')

product = Product.create(name: 'Apple IPhone 14 Plus 128Gb', description: 'Screen (6.7", OLED (Super Retina XDR),
2778x1284) / Apple A15 Bionic / dual main camera: 12 MP + 12 MP, front camera: 12 MP / 128 GB of internal memory / 3G /
LTE / 5G / GPS / Nano- SIM / iOS 16', category_id: 1, price: 1075)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/284984205.jpg')

product = Product.create(name: 'Apple IPhone 14 Pro 256Gb', description: 'Screen (6.1", OLED (Super Retina XDR),
2556x1179) / Apple A16 Bionic / main quad camera: 48 MP + 12 MP + 12 MP + 12 MP, front camera: 12 MP / 256 GB of
internal memory / 3G / LTE / 5G / GPS / Nano-SIM / iOS 16', category_id: 1, price: 1575)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/284920762.jpg')

product = Product.create(name: 'Apple IPhone 14 Pro Max 256Gb', description: 'Screen (6.7", OLED (Super Retina XDR),
2796x1290) / Apple A16 Bionic / main quad camera: 48 MP + 12 MP + 12 MP + 12 MP, front camera: 12 MP / 256 GB of
internal memory / 3G / LTE / 5G / GPS / Nano-SIM / iOS 16', category_id: 1, price: 1700)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/284924168.jpg')

product = Product.create(name: 'Apple IPhone 13 128Gb', description: 'Screen (6.1", OLED (Super Retina XDR), 2532x1170)
/ Apple A15 Bionic / dual main camera: 12 MP + 12 MP, front camera: 12 MP / 128 GB of internal memory / 3G / LTE / 5G /
GPS / Nano- SIM, eSIM / iOS 15', category_id: 1, price: 900)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/221214139.jpg')

product = Product.create(name: 'Apple IPhone 13 Mini 128Gb', description: 'Screen (5.4", OLED (Super Retina XDR),
2340x1080) / Apple A15 Bionic / dual main camera: 12 MP + 12 MP, front camera: 12 MP / 128 GB of internal memory / 3G
/ LTE / 5G / GPS / Nano- SIM, eSIM / iOS 15', category_id: 1, price: 790)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/221266736.jpg')

product = Product.create(name: 'Apple IPhone 13 Pro 128Gb', description: 'Screen (6.1", OLED (Super Retina XDR),
2532x1170) / Apple A15 Bionic / triple main camera: 12 MP + 12 MP + 12 MP, front camera: 12 MP / 128 GB internal memory
/ 3G / LTE / 5G / GPS / Nano-SIM / iOS 15', category_id: 1, price: 1125)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/221201190.jpg')

product = Product.create(name: 'Apple IPhone 13 Pro Max 128Gb', description: 'Screen (6.7", OLED (Super Retina XDR),
2778x1284) / Apple A15 Bionic / triple main camera: 12 MP + 12 MP + 12 MP, front camera: 12 MP / 128 GB internal memory
/ 3G / LTE / 5G / GPS / Nano-SIM / iOS 15', category_id: 1, price: 1225)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/221237435.jpg')

product = Product.create(name: 'Apple IPhone 12 128Gb', description: 'Screen (6.1", OLED (Super Retina XDR), 2532x1170)
/ Apple A14 Bionic / dual main camera: 12 MP + 12 MP, front camera: 12 MP / 128 GB internal memory / 3G / LTE / 5G / GPS
/ Nano- SIM, eSIM / iOS 14', category_id: 1, price: 810)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/175435404.jpg')

product = Product.create(name: 'Samsung Galaxy A53 5G 6/128Gb', description: 'Screen (6.5", Super AMOLED, 2400x1080) /
Samsung Exynos 1280 (2 x 2.4 GHz + 6 x 2.0 GHz) / main quad camera: 64 MP + 12 MP + 5 MP + 5 MP, front 32 MP / RAM 6 GB
/ 128 GB internal memory + microSD (up to 1 TB)/ 3G/ LTE/ 5G/ GPS/ A-GPS/ GLONASS/ BDS/ support for 2x SIM-cards
(Nano-SIM)/ Android 12/ 5000 mAh', category_id: 2, price: 400)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/263969408.jpg')

product = Product.create(name: 'Samsung Galaxy A53 5G 8/256Gb', description: 'Screen (6.5", Super AMOLED, 2400x1080) /
Samsung Exynos 1280 (2 x 2.4 GHz + 6 x 2.0 GHz) / main quad camera: 64 MP + 12 MP + 5 MP + 5 MP, front 32 MP / RAM 8 GB
/ 256 GB of internal memory + microSD (up to 1 TB) / 3G / LTE / 5G / GPS / A-GPS / GLONASS / BDS / support for 2x
SIM-cards (Nano-SIM) / Android 12 / 5000 mAh', category_id: 2, price: 445)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/263969400.jpg')

product = Product.create(name: 'Samsung Galaxy A73 5G 6/128Gb', description: 'Screen (6.7", Super AMOLED Plus,
2400x1080) / Qualcomm Snapdragon 778G (4 x 2.4 GHz + 4 x 1.8 GHz) / main quad camera: 108 MP + 12 MP + 5 MP + 5 MP,
front 32 MP / RAM 6 GB / 128 GB internal memory + microSD (up to 1 TB) / 3G / LTE / 5G / GPS / A-GPS / GLONASS / BDS /
support for 2x SIM-cards (Nano-SIM) / Android 12 / 5000 mAh', category_id: 2, price: 520)
product.attach_img('https://content.rozetka.com.ua/goods/images/big/263974510.jpg')

product = Product.create(name: 'Samsung Galaxy A73 5G 8/256Gb', description: 'Screen (6.7", Super AMOLED Plus,
2400x1080) / Qualcomm Snapdragon 778G (4 x 2.4 GHz + 4 x 1.8 GHz) / main quad camera: 108 MP + 12 MP + 5 MP + 5 MP,
front 32 MP / RAM 8 GB / 256 GB internal memory + microSD (up to 1 TB) / 3G / LTE / 5G / GPS / A-GPS / GLONASS / BDS
/ support for 2x SIM-cards (Nano-SIM) / Android 12 / 5000 mAh', category_id: 2, price: 575)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/263974548.jpg')

product = Product.create(name: 'Samsung Galaxy S21 FE 6/128GB', description: 'Screen (6.4", Dynamic AMOLED 2X,
2340x1080) / Qualcomm Snapdragon 888 (2.84 GHz) / triple main camera: 12 MP + 12 MP + 8 MP, front 32 MP / RAM 6 GB /
128 GB internal memory / 3G / LTE / 5G / GPS / dual SIM support (Nano-SIM) / Android 11 / 4500 mAh', category_id: 2,
                         price: 590)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/245951012.jpg')

product = Product.create(name: 'Samsung Galaxy S21 FE 8/256GB', description: 'Screen (6.4", Dynamic AMOLED 2X,
2340x1080) / Qualcomm Snapdragon 888 (2.84 GHz) / triple main camera: 12 MP + 12 MP + 8 MP, front 32 MP / RAM 8 GB /
256 GB internal memory / 3G / LTE / 5G / GPS / dual SIM support (Nano-SIM) / Android 11 / 4500 mAh', category_id: 2,
                         price: 640)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/245917791.jpg')

product = Product.create(name: 'Samsung Galaxy S22 8/128GB', description: 'Screen (6.1", Dynamic AMOLED 2X, 2340x1080)
/ Samsung Exynos 2200 (2.8 GHz + 2.5 GHz + 1.8 GHz) / triple main camera: 50 MP + 12 MP + 10 MP, front 10 MP / RAM 8 GB
/ 128 GB built-in memory / 3G / LTE / 5G / GPS / support for 2 SIM-cards (Nano-SIM) / Android 12 / 3700 mAh',
                         category_id: 2, price: 740)
product.attach_img('https://content.rozetka.com.ua/goods/images/big/253279554.jpg')

product = Product.create(name: 'Samsung Galaxy S22 Plus 8/128GB', description: 'Screen (6.6", Dynamic AMOLED 2X,
2340x1080) / Samsung Exynos 2200 (2.8 GHz + 2.5 GHz + 1.8 GHz) / triple main camera: 50 MP + 12 MP + 10 MP, front 10 MP
/ RAM 8 GB / 128 GB built-in memory / 3G / LTE / 5G / GPS / support for 2 SIM-cards (Nano-SIM) / Android 12 / 4500 mAh',
               category_id: 2, price: 890)
product.attach_img('https://content.rozetka.com.ua/goods/images/big/253280149.jpg')

product = Product.create(name: 'Samsung Galaxy S22 Ultra 12/512GB', description: 'Screen (6.8", Dynamic AMOLED 2X,
3088x1440) / Samsung Exynos 2200 (2.8 GHz + 2.5 GHz + 1.8 GHz) / main quad camera: 108 MP + 12 MP + 10 MP + 10 MP,
front 40 MP / RAM 12 GB / 512 GB of internal memory / 3G / LTE / 5G / GPS / support for 2x SIM-cards (Nano-SIM) /
Android 12 / 5000 mAh', category_id: 2, price: 1275)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/253281756.jpg')

product = Product.create(name: 'Xiaomi Redmi Note 10 Pro 6/128GB', description: 'Screen (6.67", AMOLED, 2400x1080) /
Qualcomm Snapdragon 732G (2.3 GHz) / main quad camera: 108 MP + 8 MP + 5 MP + 2 MP, front 16 MP / RAM 6 GB / 128 GB
internal memory / 3G / LTE / GPS / dual SIM support (Nano-SIM) / Android 11 (MIUI 12) / 5020 mAh', category_id: 3,
                         price: 250)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/163432102.jpg')

product = Product.create(name: 'Xiaomi 12 Lite 6/128GB', description: 'Screen (6.55", AMOLED, 2400x1080) / Qualcomm
Snapdragon 778G (2.4 GHz + 2.2 GHz + 1.9 GHz) / triple main camera: 108 MP + 8 MP + 2 MP, front 32 MP / RAM 6 GB / 128
GB / 3G / LTE / 5G / GPS / Dual SIM support (Nano-SIM) / Android 12 / 4300 mAh', category_id: 3, price: 400)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/305180121.jpg')

product = Product.create(name: 'Xiaomi 12 Lite 8/128GB', description: 'Screen (6.55", AMOLED, 2400x1080) / Qualcomm
Snapdragon 778G (2.4 GHz + 2.2 GHz + 1.9 GHz) / triple main camera: 108 MP + 8 MP + 2 MP, front 32 MP / RAM 8 GB /
128 GB / 3G / LTE / 5G / GPS / Dual SIM support (Nano-SIM) / Android 12 / 4300 mAh', category_id: 3, price: 425)
product.attach_img('https://content2.rozetka.com.ua/goods/images/big/284339433.jpg')

product = Product.create(name: 'Xiaomi 12T 8/256GB', description: 'Screen (6.67", AMOLED, 2712x1220) / MediaTek
Dimensity 8100 Ultra (2.85 GHz + 2.0 GHz) / triple main camera: 108 MP + 8 MP + 2 MP, front 20 MP / RAM 8 GB / 256 GB
internal memory / 3G / LTE / 5G / GPS / dual SIM support (Nano-SIM) / Android 12 / 5000 mAh', category_id: 3,
                         price: 575)
product.attach_img('https://content.rozetka.com.ua/goods/images/big/290072924.jpg')

product = Product.create(name: 'Xiaomi 12T Pro 8/256GB', description: 'Screen (6.67", AMOLED, 2712x1220) / Qualcomm
Snapdragon 8+Gen Gen 1 (1 x 3.2 GHz + 3 x 2.75 GHz + 4 x 2.0 GHz) / three main cameras: 200 MP + 8 MP + 2 MP, front
20 MP/ 8 GB RAM / 256 GB internal memory / 3G / LTE / 5G / GPS / 2x SIM support (Nano-SIM) / Android 12 / 5000 mAh',
               category_id: 3, price: 700)
product.attach_img('https://content1.rozetka.com.ua/goods/images/big/290155508.jpg')
