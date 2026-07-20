# 🎹 Pian Digital pe FPGA

![Schema](Schema.png)

---

# 📖 Descriere

Acest proiect a fost realizat in cadrul activitatilor de laborator, sub coordonarea **ing. Mihai Antonescu**.

Scopul proiectului a fost dezvoltarea unui **pian digital** utilizand o placa FPGA si limbajul **SystemVerilog**. Sistemul permite redarea notelor muzicale prin intermediul butoanelor de pe placa de dezvoltare, generand semnalele audio necesare pentru un buzzer si oferind feedback vizual cu ajutorul LED-urilor.

Pe langa modul de interpretare a notelor introduse de utilizator, proiectul include si o functie **Autoplay**, capabila sa redea automat o melodie memorata in memoria interna.

Proiectul demonstreaza utilizarea proiectarii hardware digitale pentru implementarea unei aplicatii interactive in timp real.

---

# 🔧 Tehnologii utilizate

- FPGA
- Vivado Design Suite
- SystemVerilog
- Xilinx Vivado
- Buzzer
- LED-uri
- Butoane (Push Buttons)
- Memorie ROM
- Constrangeri XDC

---

# ⚙️ Functionalitati

- Interpretarea comenzilor introduse prin butoane.
- Generarea notelor muzicale pe buzzer.
- Afisarea vizuala a notelor utilizand LED-uri.
- Modul **Autoplay** pentru redarea automata a unei melodii.
- Organizarea proiectului pe subsisteme hardware independente.
- Implementarea logicii digitale utilizand SystemVerilog.

---

# 🧩 Structura proiectului

Proiectul este impartit in mai multe module hardware, dintre care:

- Keyboard Subsystem
- Buzzer Subsystem
- LEDs Subsystem
- Autoplay Subsystem
- ROM pentru melodii
- ROM pentru frecventele notelor
- Contoare si multiplexoare
- Modul Top

Aceasta organizare modulara faciliteaza dezvoltarea, testarea si extinderea proiectului.

---

# 📂 Continutul proiectului

| Fisier | Descriere |
|---------|-----------|
| Pian/ | Proiectul complet Vivado |
| Schema.png | Schema bloc a proiectului |
| Demo.mp4 | Demonstratie video |
| Documentatie.pdf | Documentatia proiectului |

---

# ▶️ Demonstratie

Fisierul **Demo.mp4** prezinta functionarea pianului digital, interpretarea notelor muzicale si modul de redare automata a melodiei.

Pentru detalii privind implementarea hardware, arhitectura modulelor si dezvoltarea proiectului, consultati fisierul **Documentatie.pdf**.

---

# 👨‍💻 Profesor coordonator

**ing. Mihai Antonescu**

---

# 👨‍💻 Studenti

**Daniel Petrescu & Team**

Facultatea de Electronica, Telecomunicatii si Tehnologia Informatiei

Universitatea Nationala de Stiinta si Tehnologie POLITEHNICA Bucuresti