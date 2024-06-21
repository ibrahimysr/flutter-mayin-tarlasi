revealBoxNumber(
    int index, List Kare_durumu, int satir_kare_sayisi, int kare_Sayisi) {
  if (Kare_durumu[index][0] != 0) {
    Kare_durumu[index][1] = true;
  } else if (Kare_durumu[index][0] == 0) {
    Kare_durumu[index][1] = true;

    if (index % satir_kare_sayisi != 0) {
      if (Kare_durumu[index - 1][0] == 0 &&
          Kare_durumu[index - 1][1] == false) {
        revealBoxNumber(index - 1, Kare_durumu, satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index - 1][1] = true;
    }

    if (index % satir_kare_sayisi != 0 && index >= satir_kare_sayisi) {
      if (Kare_durumu[index - 1 - satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index - 1 - satir_kare_sayisi][1] == false) {
        revealBoxNumber(index - 1 - satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index - 1 - satir_kare_sayisi][1] = true;
    }

    if (index >= satir_kare_sayisi) {
      if (Kare_durumu[index - satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index - satir_kare_sayisi][1] == false) {
        revealBoxNumber(index - satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index - satir_kare_sayisi][1] = true;
    }

    if (index % satir_kare_sayisi != satir_kare_sayisi - 1 &&
        index >= satir_kare_sayisi) {
      if (Kare_durumu[index + 1 - satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index + 1 - satir_kare_sayisi][1] == false) {
        revealBoxNumber(index + 1 - satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index + 1 - satir_kare_sayisi][1] = true;
    }

    if (index % satir_kare_sayisi != satir_kare_sayisi - 1) {
      if (Kare_durumu[index + 1][0] == 0 &&
          Kare_durumu[index + 1][1] == false) {
        revealBoxNumber(index + 1, Kare_durumu, satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index + 1][1] = true;
    }

    if (index < kare_Sayisi - satir_kare_sayisi &&
        index % satir_kare_sayisi != satir_kare_sayisi - 1) {
      if (Kare_durumu[index + 1 + satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index + 1 + satir_kare_sayisi][1] == false) {
        revealBoxNumber(index + 1 + satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index + 1 + satir_kare_sayisi][1] = true;
    }

    if (index < kare_Sayisi - satir_kare_sayisi) {
      if (Kare_durumu[index + satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index + satir_kare_sayisi][1] == false) {
        revealBoxNumber(index + satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index + satir_kare_sayisi][1] = true;
    }

    if (index < kare_Sayisi - satir_kare_sayisi &&
        index % satir_kare_sayisi != 0) {
      if (Kare_durumu[index - 1 + satir_kare_sayisi][0] == 0 &&
          Kare_durumu[index - 1 + satir_kare_sayisi][1] == false) {
        revealBoxNumber(index - 1 + satir_kare_sayisi, Kare_durumu,
            satir_kare_sayisi, kare_Sayisi);
      }

      Kare_durumu[index - 1 + satir_kare_sayisi][1] = true;
    }
  }
}

void scanBombs(int kare_Sayisi, int satir_kare_sayisi, List<int> mayin_konumu,
    List Kare_durumu) {
  for (int i = 0; i < kare_Sayisi; i++) {
    int numbersOfBombsAround = 0;

    if (mayin_konumu.contains(i - 1) && i % satir_kare_sayisi != 0) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i - 1 - satir_kare_sayisi) &&
        i % satir_kare_sayisi != 0 &&
        i >= satir_kare_sayisi) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i - satir_kare_sayisi) &&
        i >= satir_kare_sayisi) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i + 1 - satir_kare_sayisi) &&
        i % satir_kare_sayisi != satir_kare_sayisi - 1 &&
        i >= satir_kare_sayisi) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i + 1) &&
        i % satir_kare_sayisi != satir_kare_sayisi - 1) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i + 1 + satir_kare_sayisi) &&
        i % satir_kare_sayisi != satir_kare_sayisi - 1 &&
        i < kare_Sayisi - satir_kare_sayisi) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i + satir_kare_sayisi) &&
        i < kare_Sayisi - satir_kare_sayisi) {
      numbersOfBombsAround++;
    }

    if (mayin_konumu.contains(i - 1 + satir_kare_sayisi) &&
        i % satir_kare_sayisi != 0 &&
        i < kare_Sayisi - satir_kare_sayisi) {
      numbersOfBombsAround++;
    }
    Kare_durumu[i][0] = numbersOfBombsAround;
  }
}
