# CanteenGo – Praktikum Pemrograman Mobile 2

**Nama**: _SITA NOVITASARI_  
**NPM**: _085023006_  
**Mata Kuliah**: _PRAKTIKUM PEMROGRAMAN MOBILE 2_

Proyek ini menerapkan pola feature-first dengan pemisahan presentation, domain, data, dan core. Data menu dibaca dari Supabase dengan caching Isar, dan state dikelola dengan Riverpod.


## Menjalankan
```bash
flutter pub get
flutter run \
  --dart-define SUPABASE_URL=https://<project>.supabase.co \
  --dart-define SUPABASE_ANON_KEY=<anon_key>
```

## Struktur Singkat
```
lib/src/features/menu/
  data/
    dto/menu_item_dto.dart      // map Supabase row -> domain
    repo/menu_repo.dart         // fetch + cache Isar
    local/menu_item_isar.dart   // Isar schema
  domain/
    models/menu_item.dart       // model domain (freezed)
    usecases/refresh_menu.dart  // use case tipis
  presentation/
    controllers/menu_controller.dart
    widgets/menu_card.dart, menu_grid.dart
    screens/menu_screen.dart
core/
  network/supabase_client.dart
  storage/isar_db.dart, local_store.dart
```

## Testing
```bash
flutter test
```

## Screenshot Aplikasi & Supabase
- Halaman Menu  
  ![Halaman Menu](screenshots/menu.jpg)
- Halaman Pesanan  
  ![Halaman Pesanan](screenshots/pesanan.jpg)
- Halaman Keranjang  
  ![Halaman Keranjang](screenshots/keranjang.jpg)
- Supabase tabel `menu_items`  
  ![Supabase table menu_items](screenshots/supabase-table.jpg)
