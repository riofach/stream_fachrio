# stream_fachrio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Penjelasan Kode pada lib/stream.dart (P1: Jawaban Soal 3)

### Fungsi keyword `yield*`

Pada kode:

```dart
Stream<Color> getColors() async* {
  yield* Stream.periodic(const Duration(seconds: 1), (int i) {
    int index = i % _colors.length;
    return _colors[index];
  });
}
```

Keyword `yield*` digunakan untuk meneruskan (menyebarkan) seluruh nilai yang dihasilkan oleh stream lain ke dalam stream yang sedang dibuat. Dalam hal ini, `yield*` akan mengeluarkan setiap nilai yang dihasilkan oleh `Stream.periodic` secara langsung ke pendengar (listener) dari stream `getColors()`.

### Maksud isi perintah kode

Kode tersebut membuat sebuah stream yang setiap 1 detik akan mengeluarkan (emit) satu warna dari daftar `_colors`. Warna yang dikeluarkan akan berurutan sesuai urutan pada list, dan akan mengulang dari awal jika sudah sampai di akhir list (menggunakan operasi modulus). Dengan demikian, stream ini dapat digunakan untuk menampilkan warna yang berubah-ubah setiap detik secara otomatis.
