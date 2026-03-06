# nutritional-data-cleaning

# 🥗 Nutritional Data Cleaning & Density Analysis

## 📌 Project Overview
This project focuses on **Data Transformation** and **Nutritional Profiling** of various food items. Using SQL (BigQuery), I cleaned a messy dataset of food names and manufacturers, categorized them into "Traditional" vs "Processed/Brand" categories, and calculated key metrics like **Nutritional Density**.


## 📊 Analytical Logic (The Query)
The analysis was performed in two main stages using **CTEs**:

### **1. Data Cleaning & Categorization**
* **String Manipulation:** Standardized food names using `INITCAP`, `TRIM`, and `REPLACE` to fix inconsistent naming conventions (e.g., converting "Ikan, masakan" to "Masakan Ikan").
* **Smart Categorization:** Used `REGEXP_CONTAINS` and keyword matching to automatically classify items as **Traditional** (raw/home-cooked) or **Olahan/Brand** (processed/industrial) based on ingredients and manufacturer data.
* **Data Typing:** Handled unit conversions by stripping "g" from strings and casting them to `FLOAT64` for calculation.

### **2. Advanced Metrics Calculation**
I calculated several performance indicators per 100g to allow for a fair comparison between food items:
* **Energy Density:** `energy_kcal / weight_g`
* **Nutrient Concentration:** Protein, Fat, and Sodium per 100g.
* **Nutrition Density Index:** A custom formula `(Protein + Fiber) / Energy` to identify high-nutrient, low-calorie "superfoods."


## 🛠️ SQL Techniques Used
* **Regex & Pattern Matching:** Sophisticated `CASE WHEN` logic to filter processed food keywords (e.g., *Milk, Syrup, Cookies, Pasta*).
* **CTEs:** To separate the cleaning logic from the final metric calculations.
* **Null Handling:** Using `NULLIF` to prevent "division by zero" errors during density calculations.
* **Data Normalization:** Calculating values per 100g to standardize the comparison baseline.


## 📈 Business & Health Insights
* **Processed vs Traditional:** Identified the significant gap in **Sodium (Natrium)** levels between traditional home-cooked meals and brand-processed snacks.
* **Nutrition Density:** Pinpointed specific food items that provide the highest protein and fiber per calorie, useful for dietary planning.
* **Categorization Accuracy:** Successfully automated the classification of 90%+ of the dataset using manufacturer-name correlation logic.


## 🖼️ Visualization (Looker Studio)
The cleaned data was visualized to show:
* **Comparison Matrix:** Protein vs. Fat distribution by Category.
* **Sodium Alert:** Highlighting processed brands with sodium levels exceeding recommended daily values.
* **Top 10 Superfoods:** Food items with the highest Nutrition Density Index.

![Nutritional Dashboard](https://github.com/DevanAgustino/nutritional-data-cleaning/blob/main/Visualization.png?raw=true)
![Lihat Nutritional_Dasboard di Looker Studio](https://lookerstudio.google.com/reporting/2af37ca2-936c-475e-8383-3a516718926a)


## 🏁 Conclusion & Recommendations

### **Conclusion:**
This analysis reveals a stark contrast in nutritional profiles between **Traditional** and **Processed/Brand** food categories:
1. **Nutritional Density:** Traditional foods tend to have a significantly higher *Nutrition Density Index*, providing more protein and fiber per calorie compared to most processed alternatives.
2. **Sodium Levels:** The majority of items in the "Processed/Brand" category contain sodium levels that approach or exceed daily recommended limits in a single small serving, serving as a key health risk indicator.
3. **Data Efficiency:** By leveraging SQL Regex and automated logic, data cleaning that previously required manual entry can now be automated, drastically speeding up nutritional audits for large-scale datasets.

### **Strategic Recommendations:**
1. **For Consumers (Dietary Planning):** Prioritize food items with a high *Nutrition Density Index* identified in this analysis to meet daily nutrient targets without consuming excessive calories.
2. **For Manufacturers:** Products in the "Processed/Brand" category should be reformulated to increase fiber content and reduce sodium concentration to remain competitive in the growing healthy-food market.
3. **System Development:** The SQL logic developed here can be scaled into a recommendation engine for health apps, automatically suggesting healthier traditional alternatives based on the processed products a user searches for.


## 📂 Folder Structure
* 📁 `data/`: Contains `nilai-gizi.csv` (Raw).
* 📁 `clean_data/`: Contains `analisa_gizi.csv` (Cleaned).
* 📁 `analisis_nutrisi/`: SQL scripts for cleaning and analysis.

---

# 🥗 Data Cleaning & Analisis Kepadatan Gizi (Nutrition Density)

## 📌 Deskripsi Proyek
Proyek ini berfokus pada **Transformasi Data** dan **Profiling Nutrisi** dari berbagai jenis makanan. Menggunakan SQL (BigQuery), saya membersihkan dataset nama makanan dan produsen yang tidak teratur, mengategorikannya menjadi "Traditional" vs "Olahan/Brand", serta menghitung metrik utama seperti **Kepadatan Gizi (Nutritional Density)**.

---

## 📊 Logika Analisis (The Query)
Analisis dilakukan dalam dua tahap utama menggunakan **CTE (Common Table Expressions)**:

### **1. Pembersihan & Kategorisasi Data**
* **Manipulasi String:** Menstandarisasi nama makanan menggunakan fungsi `INITCAP`, `TRIM`, dan `REPLACE` untuk memperbaiki konvensi penamaan yang tidak konsisten (contoh: mengubah "Ikan, masakan" menjadi "Masakan Ikan").
* **Kategorisasi Cerdas:** Menggunakan `REGEXP_CONTAINS` dan pencocokan kata kunci untuk mengklasifikasikan item secara otomatis sebagai **Traditional** (mentah/masakan rumah) atau **Olahan/Brand** (industri/proses) berdasarkan bahan baku dan data produsen.
* **Tipe Data:** Menangani konversi unit dengan menghapus satuan "g" dari string dan mengubahnya (*casting*) menjadi `FLOAT64` agar bisa dihitung secara matematis.

### **2. Perhitungan Metrik Lanjutan**
Saya menghitung beberapa indikator kinerja per 100g untuk memungkinkan perbandingan yang adil antar item makanan:
* **Kepadatan Energi:** `energy_kcal / weight_g`
* **Konsentrasi Nutrisi:** Kadar Protein, Lemak, dan Natrium (Sodium) per 100g.
* **Indeks Kepadatan Gizi:** Menggunakan rumus kustom `(Protein + Serat) / Energi` untuk mengidentifikasi "superfoods" yang tinggi nutrisi namun rendah kalori.


## 🛠️ Teknik SQL yang Digunakan
* **Regex & Pattern Matching:** Logika `CASE WHEN` yang canggih untuk menyaring kata kunci makanan olahan (seperti: *Milk, Sirup, Cookies, Pasta*).
* **CTEs:** Untuk memisahkan logika pembersihan data (*cleaning*) dengan perhitungan metrik akhir agar query lebih terstruktur.
* **Penanganan Nilai Null:** Menggunakan `NULLIF` untuk mencegah error "pembagian dengan nol" (*division by zero*) saat menghitung kepadatan gizi.
* **Normalisasi Data:** Menghitung nilai per 100g untuk menstandarisasi basis perbandingan antar produk.

---

## 📈 Wawasan Bisnis & Kesehatan (Insights)
* **Olahan vs Tradisional:** Ditemukan celah signifikan pada kadar **Natrium (Sodium)** di mana makanan olahan bermerek memiliki kadar garam jauh lebih tinggi dibandingkan masakan rumah tradisional.
* **Kepadatan Gizi:** Berhasil memetakan item makanan yang memberikan protein dan serat tertinggi per kalori, sangat berguna untuk rekomendasi perencanaan diet sehat.
* **Akurasi Kategorisasi:** Otomatisasi klasifikasi berhasil memproses lebih dari 90% dataset secara akurat dengan mengaitkan logika nama produsen dan nama produk.


## 🖼️ Visualisasi (Looker Studio)
Data yang telah dibersihkan divisualisasikan untuk menampilkan:
* **Matriks Perbandingan:** Distribusi Protein vs. Lemak berdasarkan Kategori.
* **Peringatan Natrium:** Menyoroti brand makanan olahan dengan kadar natrium yang melebihi batas konsumsi harian.
* **Top 10 Superfoods:** Daftar makanan dengan Indeks Kepadatan Gizi tertinggi.

![Nutritional Dashboard](https://github.com/DevanAgustino/nutritional-data-cleaning/blob/main/Visualization.png?raw=true)
![Lihat Nutritional_Dasboard di Looker Studio](https://lookerstudio.google.com/reporting/2af37ca2-936c-475e-8383-3a516718926a)


## 🏁 Kesimpulan & Rekomendasi

### **Kesimpulan:**
Analisis ini menunjukkan adanya perbedaan profil nutrisi yang kontras antara makanan kategori **Traditional** dan **Olahan/Brand**. 
1. **Kepadatan Nutrisi:** Makanan tradisional cenderung memiliki skor *Nutrition Density* yang lebih tinggi, memberikan lebih banyak protein dan serat per kalori dibandingkan makanan olahan.
2. **Kandungan Natrium:** Mayoritas makanan dalam kategori "Olahan/Brand" memiliki kandungan natrium yang mendekati atau melebihi batas harian dalam satu porsi kecil, yang menjadi indikator risiko kesehatan jika dikonsumsi berlebih.
3. **Efisiensi Data:** Dengan menggunakan SQL RegEx, pembersihan data yang sebelumnya dilakukan manual dapat diotomatisasi, sehingga mempercepat proses audit nutrisi untuk dataset berskala besar.

### **Rekomendasi Strategis:**
1. **Untuk Konsumen (Dietary Planning):** Prioritaskan makanan dengan *Nutrition Density Index* tinggi yang diidentifikasi dalam analisis ini untuk mencapai target nutrisi harian tanpa kelebihan kalori.
2. **Untuk Industri/Produsen:** Produk dalam kategori "Olahan/Brand" perlu diformulasikan ulang untuk meningkatkan kandungan serat dan mengurangi konsentrasi natrium agar lebih kompetitif dalam pasar makanan sehat.
3. **Pengembangan Sistem:** Logika SQL ini dapat dikembangkan menjadi sebuah mesin rekomendasi (recommendation engine) untuk aplikasi kesehatan yang secara otomatis menyarankan alternatif makanan tradisional yang lebih sehat berdasarkan profil produk olahan yang dicari pengguna.


## 📂 Struktur
* 📁 `data/`: Berisi file `nilai-gizi.csv` (Data Mentah).
* 📁 `clean_data/`: Berisi file `analisa_gizi.csv` (Hasil Pembersihan).
* 📁 `analisis_nutrisi/`: Script SQL untuk pembersihan dan analisis.

