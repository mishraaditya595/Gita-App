# GitaVedanta

A mobile and web application which aims to be the gateway to the profound teachings of Vedanta, encompassing translations of significant scriptures including the Bhagavad Gita, Kena Upanishad, and Isopanishad.

<p align="left">
<a href="https://play.google.com/store/apps/details?id=com.sbg" target="_blank">
<img src="https://play.google.com/intl/en_us/badges/images/generic/en-play-badge.png" alt="Get it on Google Play" height="90"/></a>
</p>

Or try the app on your browser visiting https://gitavedanta.in/#/ (Available for all users. Chrome recommended for better performance.)

## About Vedanta

Vedanta, often referred to as the "end of the Vedas," represents the culmination of the ancient Indian wisdom tradition. It delves into the fundamental nature of reality, the self, and the ultimate purpose of life. The Gita Vedanta App is dedicated to making these timeless teachings accessible to modern seekers.

## Features
- **Expanded Content:** Gita Vedanta has evolved from solely offering translations of the Bhagavad Gita to including translations of other essential texts like Kena Upanishad and Isopanishad.

- **Holistic Learning:** This app aims to facilitate a comprehensive learning experience, allowing users to delve into ancient wisdom and spiritual teachings.

- **User-friendly Interface:** The app's interface has been thoughtfully designed to ensure a smooth and intuitive user experience, accommodating both newcomers and seasoned seekers.

## Screenshots 

<img src="https://play-lh.googleusercontent.com/YogNf5TqqLrwuRLKzmNyxTWlzhL_TkNZuWq7ggVP4qTA4CN6ILaXCrtjf3tMsEU51CNh=w1052-h592-rw" alt="Screenshot" height="350" width="200"/></a>
<img src="https://play-lh.googleusercontent.com/c2Ucv1qM2LmlUHSU6lcvNgFU7Edr1Fibnt5OneizNWvPOCK1fUlmNggQjtcwPA4JPkI=w1052-h592-rw" height="350" width="200"/></a>
<img src="https://play-lh.googleusercontent.com/K4POjXbwjTDwNUFkbntQurPD1gtNTS_W-b-apxuW3Dch-RwKOOxNkfMfbdtg8eLsOy24=w1052-h592-rw" alt="Screenshot" height="350" width="200"/></a>
<img src="https://play-lh.googleusercontent.com/kY8kdO7Kk6B9jyDTlAI9ga-j9VKaXNv18AvGpvnmX19qC2hBzKAZbaM5zMW-8woJ6II=w1052-h592-rw" alt="Screenshot" height="350" width="200"/></a>


## Repo Setup Guide
1. **Clone the repository:**
   git clone https://github.com/username/repo.git
2. Enable Firebase CLI in your system if not already. Visit: https://firebase.google.com/docs/cli#install-cli-windows for installation guide.
3. Login to firebase through command line by running command 
    - firebase login
2. Open the project in your favourite IDE. I use Intellij.
3. Run the following commands -
   - flutter pub get
   - dart pub global activate flutterfire_cli
   - flutterfire configure (This will start a command line interface for you to select the Firebase project you want to link to the Flutter project. After you complete this, a firebase_options.dart file will be generated in your lib/ folder.)
   - flutter pub run build_runner build --delete-conflicting-outputs
4. Build and run the app on a device or emulator.

## Contributing
Contributions are welcome! If you have any suggestions, bug reports, or feature requests, please open an issue or submit a pull request.

## Contact
If you have any questions or need assistance, feel free to contact me at mishraaditya595@gmail.com.

### Show some ❤️ by starring the repository!

[//]: # ([![Stargazers repo roster for @mishraaditya595/Gita-App]&#40;https://reporoster.com/stars/mishraaditya595/Gita-App&#41;]&#40;https://github.com/mishraaditya595/Gita-App/stargazers&#41;)

[//]: # ()
[//]: # ([![Forkers repo roster for @mishraaditya595/Gita-App]&#40;https://reporoster.com/forks/mishraaditya595/Gita-App&#41;]&#40;https://github.com/mishraaditya595/Gita-App/network/members&#41;)
