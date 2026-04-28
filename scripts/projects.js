// Scroll to top
const backToTopBtn = document.getElementById('backToTop');

// Window scroll event
window.addEventListener('scroll', () => {
    if (window.pageYOffset > 300) {
        // Show button
        backToTopBtn.classList.add('show');
    } else {
        // Hide button
        backToTopBtn.classList.remove('show');
    }
});

// Click scroll event
backToTopBtn.addEventListener('click', () => {
    // Scroll up smooth
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
});

// Project data
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
        details: "Mobile app integration, voice control compatibility, and energy monitoring. Built with Arduino, WiFi modules, and cloud connectivity.",
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

// Get filter buttons
const filterBtns = document.querySelectorAll('.filter-btn');
// Get project cards
const projectCards = document.querySelectorAll('.project-card');

// Filter button click
filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        // Clear active class
        filterBtns.forEach(b => b.classList.remove('active'));
        // Set active class
        btn.classList.add('active');

        // Get filter value
        const filterValue = btn.getAttribute('data-filter');

        // Loop project cards
        projectCards.forEach(card => {
            // Check card category
            if (filterValue === 'all' || card.getAttribute('data-category') === filterValue) {
                // Show card
                card.style.display = 'block';
            } else {
                // Hide card
                card.style.display = 'none';
            }
        });
    });
});

// Get modal elements
const modal = document.getElementById('projectModal');
const closeBtn = document.querySelector('.close-btn');

// Open modal click
projectCards.forEach((card, index) => {
    card.addEventListener('click', () => {
        const project = projectsData[index];
        // Set modal data
        document.getElementById('modalImage').src = project.image;
        document.getElementById('modalTitle').textContent = project.title;
        document.getElementById('modalCategory').textContent = project.category.toUpperCase();
        document.getElementById('modalDescription').textContent = project.description;
        document.getElementById('modalDetails').textContent = project.details;
        document.getElementById('demoLink').href = project.demoLink;
        document.getElementById('githubLink').href = project.githubLink;
        
        // Show modal window
        modal.style.display = 'block';
        // Disable body scroll
        document.body.style.overflow = 'hidden';
    });
});

// Close modal click
closeBtn.addEventListener('click', () => {
    // Hide modal window
    modal.style.display = 'none';
    // Enable body scroll
    document.body.style.overflow = 'auto';
});

// Window click close
window.addEventListener('click', (event) => {
    // Check click target
    if (event.target === modal) {
        // Hide modal window
        modal.style.display = 'none';
        // Enable body scroll
        document.body.style.overflow = 'auto';
    }
});

// Nav link click
document.querySelectorAll('.glass-nav a').forEach(link => {
    link.addEventListener('click', (e) => {
        // Prevent default action
        e.preventDefault();
        // Get target ID
        const targetId = link.getAttribute('href');
        const targetElement = document.querySelector(targetId);
        
        // Check element exists
        if (targetElement) {
            // Smooth scroll action
            targetElement.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});
