// Shared project data for the site
const projectsData = [
    {
        id: 1,
        title: "Autonomous Navigation Robot",
        category: "robotics",
        image: "img/project1.png",
        description: "A wheeled robot with obstacle detection and autonomous pathfinding capabilities.",
        details: "Features advanced sensor integration including LiDAR, ultrasonic sensors, and IMU. Implements pathfinding algorithms for efficient navigation in unknown environments.",
        demoLink: "https://example.com/demo1",
        githubLink: "https://github.com/hack/autonomous-robot"
    },
    {
        id: 2,
        title: "Smart Home IoT System",
        category: "iot",
        image: "img/project2.png",
        description: "Connected home automation system with real-time monitoring and control.",
        details: `
## Project Overview
The Smart Home IoT System is a comprehensive home automation platform designed to provide seamless control and monitoring of household devices and appliances through a centralized network.

## Key Features
• Real-time device control via mobile application and web dashboard
• Voice control compatibility with Alexa, Google Assistant, and IFTTT
• Intelligent energy monitoring and consumption analytics
• Automated scheduling and scene creation (sunrise, movie night, away mode)
• Multi-user access with role-based permissions
• Cloud data backup and historical analytics
• Emergency alerts and anomaly detection

## Hardware Components
• Arduino Mega 2560 / ESP32 microcontroller units
• WiFi modules (ESP8266/ESP32-WROOM) for connectivity
• Relay modules (8/16-channel) for device switching
• DHT22 temperature and humidity sensors
• Motion sensors (PIR) for occupancy detection
• Light sensors for adaptive lighting
• Smoke and gas sensors for safety
• Power monitoring modules (PZEM-004T)
• Custom PCB for signal conditioning and protection

## Software Architecture
• Firmware: Custom C++ code with real-time OS for edge processing
• Backend: Node.js with Express.js API and MongoDB for data persistence
• Cloud: Firebase for real-time database and push notifications
• Frontend: React.js web dashboard with responsive design
• Mobile: Native Android/iOS apps with offline capability
• Communication: MQTT protocol for lightweight IoT messaging

## Integrations
• Google Home and Amazon Alexa voice control
• IFTTT automation workflows
• Weather API for intelligent scheduling
• Telegram bot for remote notifications
• Home Assistant compatibility

## Performance Metrics
• Response time: < 200ms for device control
• Network latency handling with local fallback
• Supports up to 50+ connected devices
• 99.5% uptime during testing
• Battery backup for critical sensors (48 hours)

## Challenges Overcome
• Managing network latency for real-time response
• Ensuring data security with encryption (AES-256)
• Power optimization for 24/7 operation
• Cross-platform mobile app synchronization
• Scalability for large home setups

## Future Enhancements
• Machine learning for predictive automation
• Solar integration and battery storage monitoring
• Advanced facial recognition for security
• Water and gas leak detection
• Smart meter integration for grid management
        `,
        demoLink: "https://example.com/demo2",
        githubLink: "https://github.com/hack/smart-home-iot"
    },
    {
        id: 3,
        title: "STM32 Firmware Development",
        category: "embedded",
        image: "img/project3.png",
        description: "Real-time embedded system with sensor integration and data processing.",
        details: "Low-level programming with real-time OS, interrupt handling, and peripheral control. Includes ADC, PWM, and communication protocols.",
        demoLink: "https://example.com/demo3",
        githubLink: "https://github.com/hack/stm32-firmware"
    },
    {
        id: 4,
        title: "Computer Vision System",
        category: "ai",
        image: "img/project4.png",
        description: "ML-powered object detection and recognition for robotics applications.",
        details: "Built with TensorFlow and OpenCV. Detects and classifies multiple objects in real-time with 95% accuracy.",
        demoLink: "https://example.com/demo4",
        githubLink: "https://github.com/hack/vision-system"
    },
    {
        id: 5,
        title: "Quadcopter Drone",
        category: "robotics",
        image: "img/project5.png",
        description: "Custom-built quadcopter with flight control and stabilization systems.",
        details: "Self-stabilizing flight controller with GPS and altitude hold. Custom PCB design with brushless motor control.",
        demoLink: "https://example.com/demo5",
        githubLink: "https://github.com/hack/quadcopter"
    },
    {
        id: 6,
        title: "Weather Monitoring Station",
        category: "iot",
        image: "img/project6.png",
        description: "IoT weather station with cloud data logging and real-time updates.",
        details: "Measures temperature, humidity, pressure, and wind speed. Data stored in Firebase with live dashboard.",
        demoLink: "https://example.com/demo6",
        githubLink: "https://github.com/hack/weather-station"
    },
    {
        id: 7,
        title: "Club Portfolio App",
        category: "software",
        image: "img/project7.png",
        description: "A software portfolio to track club events and members.",
        details: "Built with modern web technologies to manage and display all club activities efficiently.",
        demoLink: "https://example.com/demo7",
        githubLink: "https://github.com/hack/portfolio-app"
    },
    {
        id: 8,
        title: "Custom ESP32 Board",
        category: "hardware",
        image: "img/project8.png",
        description: "A fully custom PCB with ESP32 and power management.",
        details: "Custom PCB design using KiCad, includes battery management, ESP32 microcontroller, and sensor interfaces.",
        demoLink: "https://example.com/demo8",
        githubLink: "https://github.com/hack/esp32-board"
    }
];

// Expose to other scripts (global)
window.projectsData = projectsData;
