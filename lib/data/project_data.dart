import 'package:portfolio/constants/app_image.dart';
import 'package:portfolio/model/project_model.dart';

final List<Project> projects = [
  Project(
    name: 'Drive Duo',
    subtitle: 'Car Rental App',
    description:
        'Drive Duo is a car rental app designed to provide users with a seamless experience for renting vehicles. Currently, the app allows users to search for and rent cars from a pre-listed inventory, complete with detailed descriptions, photos, and real-time availability. Key features include a robust search bar, secure payment integration via Razorpay, and easy booking functionality. Targeted at individuals seeking convenient and affordable car rentals, Drive Duo ensures a smooth and trustworthy rental experience. Built with Flutter and Firebase, the app offers a modern and intuitive interface. Future updates will include features for car owners to list their vehicles, transforming Drive Duo into a peer-to-peer car rental platform.',
    imageUrl: AppImage.driveDuoImage,
    techStack: [
      'Flutter',
      'Dart',
      'Firebase Core',
      'Firebase Authentication',
      'Provider',
      'Razorpay',
    ],
    githubUrl: 'https://github.com/hishaamharis/drive_duo.git',
  ),
  Project(
    name: 'Quiz!z',
    subtitle: 'A quiz app.',
    description:
        'Quiz!z is an engaging quiz app designed for educational and general knowledge purposes. It offers multiple-choice questions with a timer, encouraging users to think quickly and test their knowledge. The app features a variety of categories and difficulty levels, catering to users of all ages and expertise. With a built-in leaderboard, users can track their progress and compete with others. Developed using Flutter and Firebase, Quiz!z provides a fun and interactive way to learn and challenge oneself.',
    imageUrl: AppImage.quizizImage,
    techStack: [
      'Flutter',
      'Dart',
      'Firebase Core',
      'Firebase Authentication',
      'Google Sign-In',
      'Cloud Firestore',
      'Flutter Native Splash',
    ],
  ),
  Project(
    name: 'Task manager',
    subtitle: 'A task management app.',
    description:
        'Task Manager is a simple yet effective personal task management app designed to help users organize their daily activities. Users can create tasks, set tags for better categorization, and manage their to-do lists efficiently. Built as one of my initial projects, this app focuses on simplicity and usability, making it ideal for individuals looking to streamline their personal tasks. Developed with Flutter and Hive, Task Manager offers a lightweight and user-friendly experience.',
    imageUrl: AppImage.taskManagerImage,
    techStack: [
      'Flutter',
      'Dart',
      'GetX',
      'Hive',
      'Hive Flutter',
      'UUID',
      'Intl',
    ],
    githubUrl: "https://github.com/hishaamharis/task_manager.git",
  ),
  Project(
    name: 'Projectsmate',
    subtitle: 'A project management app',
    description:
        'Projectsmate is a comprehensive project management app tailored for architects and contractors to manage their projects efficiently. The app enables users to create milestones, update daily tasks (including work progress and workforce details), and communicate with clients and contractors through an integrated chat feature. Additional functionalities include scheduling meetings, uploading site-related documents, and tracking project progress. Developed as a professional tool for the architecture and construction industry, Projectsmate simplifies project management and enhances collaboration. Built with Flutter and Firebase, the app ensures a seamless and secure experience for all users.',
    imageUrl: AppImage.projectsmateImage,
    techStack: [
      'Flutter',
      'Dart',
      'Dio',
      'Awesome Dio Interceptor',
      'Firebase Core',
      'Firebase Authentication',
      'Google Sign-In',
      'GoRouter',
      'Provider',
      'Shared Preferences',
      'Flutter Secure Storage',
    ],
  ),
];
