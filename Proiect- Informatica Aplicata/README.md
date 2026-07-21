# TV Episode Information Display using ESP32

An embedded systems project developed using the **ESP32** microcontroller that retrieves information about TV show episodes from an online REST API and displays the season and episode number on a multiplexed 2-digit 7-segment display.

---

## Features

- Wi-Fi connectivity
- HTTP GET requests
- JSON data parsing
- 2-digit multiplexed 7-segment display
- Serial Monitor interaction
- Real-time data retrieval from an online API

---

## Hardware

- ESP32 DevKit
- 2-Digit 7-Segment Display
- 7 × 220 Ω Resistors
- Breadboard
- Jumper Wires

---

## Wiring

| Display | ESP32 |
|----------|-------|
| A | GPIO4 |
| B | GPIO16 |
| C | GPIO17 |
| D | GPIO5 |
| E | GPIO18 |
| F | GPIO19 |
| G | GPIO21 |
| Digit 1 | GPIO15 |
| Digit 2 | GPIO2 |
| DP | GPIO22 (unused) |

---

## How it Works

1. ESP32 connects to a Wi-Fi network.
2. The user enters an episode ID through the Serial Monitor.
3. An HTTP request is sent to the REST API.
4. The received JSON response is parsed.
5. Episode information is displayed in the Serial Monitor.
6. The season and episode numbers are shown on the multiplexed 7-segment display.

---

## Technologies Used

- ESP32
- Arduino IDE
- C++
- Wi-Fi
- HTTP Client
- ArduinoJson Library
- REST API
- 7-Segment Multiplexing

---

## Project Structure

```
Project
│
├── TV_Episode_Display.ino
├── README.md
├── Circuit.png
├── Hardware.jpg
└── Demo.mp4
```

---

## Demonstration

The project demonstrates how an ESP32 can access information from an online REST API, process JSON data and display relevant information on a hardware interface using a multiplexed 7-segment display.

---

## Future Improvements

- OLED or LCD display support
- Automatic Wi-Fi reconnection
- Better error handling
- Display scrolling
- OTA firmware updates

---

## Author

Developed as part of the **SUMMER IT 2025** embedded systems laboratory.