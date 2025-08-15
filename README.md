# 🌍 Countries App

اپلیکیشنی ساده با **Flutter** برای نمایش لیست کشورها، پایتخت و پرچم آن‌ها.  
پیاده‌سازی با **Clean Architecture** و **Bloc** برای مدیریت وضعیت.

## ✨ ویژگی‌ها

- 📝 دریافت داده‌ها از فایل **JSON آنلاین**
- 🏴 نمایش پرچم کشورها با **کشینگ تصاویر**
- ⏳ مدیریت وضعیت‌ها: **لودینگ، نمایش داده و خطا**
- ⚡ استفاده از **Bloc** و **Freezed**
- 🔧 دسته‌بندی خطاها با **Failure**: Network, Server, Unknown

## 🛠 تکنولوژی‌ها

- **Flutter**
- **Bloc / Freezed**
- **Dio**
- **CachedNetworkImage** (کشینگ تصاویر با Silver و AppCacheManagers)
- **fpdart** (Either / مدیریت خطا)

## 💡 نکات حرفه‌ای

- تصاویر با **fadeIn/fadeOut** کوتاه و سریع نمایش داده می‌شوند
- **Hero** برای کنترل Flag ها
