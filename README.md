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

## Hasil Praktikum (P1: Jawaban Soal 4)

![1](./images/P14.gif)

## Perbedaan Menggunakan `listen` dan `await for` pada Stream (P1: Jawaban Soal 5)

Pada kode di `main.dart`, digunakan:

```dart
void changeColor() async {
  await for (var eventColor in colorStream.getColors()) {
    setState(() {
      bgColor = eventColor;
    });
  }
}
```

### Penjelasan:

- **`await for`** digunakan di dalam fungsi async untuk menerima data dari stream satu per satu secara sinkron (menunggu setiap data datang sebelum melanjutkan ke data berikutnya). Cocok digunakan jika ingin memproses setiap data secara berurutan dan menunggu proses selesai sebelum melanjutkan.
- **`listen`** adalah metode pada stream yang menerima callback (fungsi) yang akan dipanggil setiap kali ada data baru. Dengan `listen`, kita tidak perlu menunggu data berikutnya, sehingga lebih cocok untuk kasus di mana kita ingin merespons setiap data secara reaktif tanpa menunggu proses sebelumnya selesai.

### Perbedaan Utama:

- `await for` hanya bisa digunakan di dalam fungsi async dan akan menunggu setiap data stream secara berurutan.
- `listen` bisa digunakan di mana saja dan memberikan lebih banyak kontrol, seperti pause, resume, dan cancel subscription.
- Dengan `await for`, eksekusi fungsi akan "tertahan" di loop sampai stream selesai, sedangkan dengan `listen`, eksekusi fungsi tetap berjalan dan callback akan dipanggil setiap ada data baru.

### Contoh Penggunaan `listen`:

```dart
colorStream.getColors().listen((eventColor) {
  setState(() {
    bgColor = eventColor;
  });
});
```
