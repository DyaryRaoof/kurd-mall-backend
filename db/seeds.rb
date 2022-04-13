# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.destroy_all
Subcategory.destroy_all
City.destroy_all

category1 = Category.create!(name_en: 'Cars', name_ku: 'ئووتۆمبیل', order: 1)
category2 = Category.create!(name_en: 'Property', name_ku: 'مۆڵک', order: 2)
category3 = Category.create!(name_en: 'Home Appliances', name_ku: 'کەلووپەلی ناو ماڵ', order: 3)
category4 = Category.create!(name_en: 'Hardware', name_ku: 'ئامێری ئەلیکترۆنی', order: 4)
category5 = Category.create!(name_en: 'Fashion and Accessories', name_ku: 'پۆشاک و جوانکاری', order: 5)
category6 = Category.create!(name_en: 'Animals and pets', name_ku: 'ئاژەڵ و باڵندە', order: 6)
category7 = Category.create!(name_en: 'Arts and Sports', name_ku: 'وەرزش و هوونەر', order: 7)
category8 = Category.create!(name_en: 'Food', name_ku: 'خۆراک', order: 8)
category9 = Category.create!(name_en: 'Construction', name_ku: 'بیناسازی', order: 9)
category10 = Category.create!(name_en: 'Healthcare', name_ku: 'تەندرووستی', order: 10)
category11 = Category.create!(name_en: 'Other Categories', name_ku: 'جۆری تر', order: 11)

category1.subcategories.create!(name_en: 'Private Cars', name_ku: 'ئوتۆمبیلی تایبەت', order: 1)
category1.subcategories.create!(name_en: 'Truck', name_ku: 'ئووتۆمبیلی بارهەڵگر', order: 2)
category1.subcategories.create!(name_en: 'Agricultural Vehicles', name_ku: 'ئووتۆمبیلی کشتووکاڵ', order: 3)
category1.subcategories.create!(name_en: 'Motorcycle', name_ku: 'ماتۆر', order: 4)
category1.subcategories.create!(name_en: 'Bicycle', name_ku: 'باسکیل', order: 5)
category1.subcategories.create!(name_en: 'Car Plates', name_ku: 'ڕەقەمی ئوتۆمبیل', order: 6)
category1.subcategories.create!(name_en: 'Car Parts', name_ku: 'پارچەی ئوتۆمبیل', order: 7)
category1.subcategories.create!(name_en: 'Taxi', name_ku: 'تاکسی', order: 8)
category1.subcategories.create!(name_en: 'Bus', name_ku: 'پاس', order: 9)
category1.subcategories.create!(name_en: 'Scarp Vehicles', name_ku: 'ئوتۆمبیلی سکراب', order: 10)
category1.subcategories.create!(name_en: 'Europian Plate Cars', name_ku: 'ژمارە ئەورووپی', order: 11)
category1.subcategories.create!(name_en: 'Other Vehicle', name_ku: 'ئووتۆمبیلی تر', order: 12)


category2.subcategories.create!(name_en: 'House', name_ku: 'خانوو', order: 1)
category2.subcategories.create!(name_en: 'Shop', name_ku: 'دووکان', order: 2)
category2.subcategories.create!(name_en: 'Land', name_ku: 'زەویوزار', order: 3)
category2.subcategories.create!(name_en: 'Other Property', name_ku: 'موڵکی تر', order: 4)



category3.subcategories.create!(name_en: 'Electrical Hardware', name_ku: 'کەلووپەلی کارەبایی', order: 1)
category3.subcategories.create!(name_en: 'Sitting Room', name_ku: 'ژووری دانیشتن', order: 2)
category3.subcategories.create!(name_en: 'Bed Room', name_ku: 'نووستن', order: 3)
category3.subcategories.create!(name_en: 'Kitchen', name_ku: 'چێشتخانە', order: 4)
category3.subcategories.create!(name_en: 'Generators', name_ku: 'موەلیدە', order: 5)
category3.subcategories.create!(name_en: 'Other Appliences', name_ku: 'کەلووپەلی ناوماڵی تر', order: 6)

category4.subcategories.create!(name_en: 'Computer', name_ku: 'کۆمپیوتەر', order: 1)
category4.subcategories.create!(name_en: 'Mobile', name_ku: 'مۆبایل', order: 2)
category4.subcategories.create!(name_en: 'Tablet', name_ku: 'تابلێت', order: 3)
category4.subcategories.create!(name_en: 'Gaming', name_ku: 'یاری', order: 4)
category4.subcategories.create!(name_en: 'Camera', name_ku: 'کامێرا', order: 5)
category4.subcategories.create!(name_en: 'Smart Watch', name_ku: 'کاتژمێری زیرەک', order: 6)
category4.subcategories.create!(name_en: 'Sim Card', name_ku: 'سیم کارد', order: 7)
category4.subcategories.create!(name_en: 'Internet Devise', name_ku: 'ئامێری ئینتەرنێت', order: 8)
category4.subcategories.create!(name_en: 'Other Hardware', name_ku: 'ئامێری تر', order: 9)

category5.subcategories.create!(name_en: 'Fashion', name_ku: 'جل و بەرگ ', order: 1)
category5.subcategories.create!(name_en: 'Accessories', name_ku: 'جوانکاری', order: 2)
category5.subcategories.create!(name_en: 'Jewelry', name_ku: 'زێڕ و زیو', order: 3)
category5.subcategories.create!(name_en: 'Women’s Needs', name_ku: 'پێویستی پیاوان', order: 4)
category5.subcategories.create!(name_en: 'Men’s Needs', name_ku: 'پێویستی ژنان', order: 5)
category5.subcategories.create!(name_en: 'Other Fashion And Accessories', name_ku: 'پۆشاک و جوانکاری تر', order: 6)


category6.subcategories.create!(name_en: 'Pets', name_ku: 'ئاژەڵی ماڵی', order: 1)
category6.subcategories.create!(name_en: 'Wild Animals', name_ku: 'ئاژەڵی کێوی', order: 2)
category6.subcategories.create!(name_en: 'Fish', name_ku: 'ماسی', order: 3)
category6.subcategories.create!(name_en: 'Other Animals', name_ku: 'ئاژەڵی تر', order: 4)

category7.subcategories.create!(name_en: 'Books', name_ku: 'کتێب', order: 1)
category7.subcategories.create!(name_en: 'Sports', name_ku: 'وەرزش', order: 2)
category7.subcategories.create!(name_en: 'Music', name_ku: 'مۆسیقا', order: 3)
category7.subcategories.create!(name_en: 'Gallery', name_ku: 'گەلەری', order: 4)
category7.subcategories.create!(name_en: 'Other Arts and Sports', name_ku: 'هوونەر و وەرزشی تر', order: 5)


category8.subcategories.create!(name_en: 'Red Meat', name_ku: 'گۆشتی سوور', order: 1)
category8.subcategories.create!(name_en: 'Poultry', name_ku: 'گۆشتی پەلەوەر', order: 2)
category8.subcategories.create!(name_en: 'Ftruits and Vegetables', name_ku: 'سەوزە و میوە', order: 3)
category8.subcategories.create!(name_en: 'Bread', name_ku: 'نان', order: 4)
category8.subcategories.create!(name_en: 'Pickles', name_ku: 'ترشیات', order: 5)
category8.subcategories.create!(name_en: 'Sweets', name_ku: 'شیرینەمەنی', order: 6)
category8.subcategories.create!(name_en: 'Nuts', name_ku: 'چەرەسات', order: 7)
category8.subcategories.create!(name_en: 'Dairy', name_ku: 'شیرەمەنی', order: 8)
category8.subcategories.create!(name_en: 'Icecream', name_ku: 'ساردەمەنی', order: 9)
category8.subcategories.create!(name_en: 'Special Food', name_ku: 'خواردنی تایبەت', order: 10)
category8.subcategories.create!(name_en: 'Other Food', name_ku: 'خواردنی تر', order: 11)

category9.subcategories.create!(name_en: 'Tools', name_ku: 'کەلووپەلی بیناسازی', order: 1)
category9.subcategories.create!(name_en: 'Cement', name_ku: 'کۆنکرێت', order: 2)
category9.subcategories.create!(name_en: 'Door', name_ku: 'دەرگا', order: 3)
category9.subcategories.create!(name_en: 'Decoration', name_ku: 'دیکۆرات', order: 4)
category9.subcategories.create!(name_en: 'Bathroom', name_ku: 'حەمام', order: 4)
category9.subcategories.create!(name_en: 'Lighting', name_ku: 'ڕووناکی', order: 5)
category9.subcategories.create!(name_en: 'Stairs', name_ku: 'قادرمە', order: 6)
category9.subcategories.create!(name_en: 'Tile', name_ku: 'کاشی', order: 7)
category9.subcategories.create!(name_en: 'Dye', name_ku: 'بۆیە', order: 8)

category10.subcategories.create!(name_en: 'Medicine', name_ku: 'دەرمان', order: 1)
category10.subcategories.create!(name_en: 'Medical Equipment', name_ku: 'کەلووپەلی پزیشکی', order: 2)
category10.subcategories.create!(name_en: 'Other Medical Needs', name_ku: 'پێداویستی پزیشکی تر', order: 3)


City.create!(name_en: 'Sulaimany', name_ku: 'سولەیمانی', order: 1)
City.create!(name_en: 'Hawler', name_ku: 'هەولێر', order: 2)
City.create!(name_en: 'Duhok', name_ku: 'دوهۆک', order: 3)
City.create!(name_en: 'Halabja', name_ku: 'هەلەبجە', order: 4)
